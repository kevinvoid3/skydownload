#!/usr/bin/env python3
"""
從 Android resources.arsc（或整包 APK）抽出字串資源。

輸出兩種視角：
  1. resolved：每筆 string 類型資源 -> (資源名, 語系, 值)，跨語系看在地化最有用
  2. pool dump：resources.arsc 裡所有 string pool 的原始字串（fallback，格式再怪都掃得到）

零依賴，純標準庫，風格比照 repo 內手刻的 DEX parser。

用法：
  python extract_arsc_strings.py app.apk
  python extract_arsc_strings.py resources.arsc --out-dir out_arsc
  python extract_arsc_strings.py app.apk --locale zh-TW en      # 只輸出這些語系
  python extract_arsc_strings.py app.apk --grep http            # 只留含此 regex 的值
"""
import argparse
import json
import re
import struct
import sys
import zipfile
from pathlib import Path

# ---- ResChunk type ----
RES_STRING_POOL_TYPE = 0x0001
RES_TABLE_TYPE = 0x0002
RES_TABLE_PACKAGE_TYPE = 0x0200
RES_TABLE_TYPE_TYPE = 0x0201      # 一個 type 在某個 config 下的 entry 表
RES_TABLE_TYPE_SPEC_TYPE = 0x0202
RES_TABLE_LIBRARY_TYPE = 0x0203

FLAG_UTF8 = 1 << 8

# entry 裡的 value data type：字串
TYPE_STRING = 0x03


def u16(b, o):
    return struct.unpack_from("<H", b, o)[0]


def u32(b, o):
    return struct.unpack_from("<I", b, o)[0]


# ---- 字串長度的兩種變長編碼 ----
def _len_utf8(data, p):
    # 高位設了就是兩個 byte
    n = data[p]
    p += 1
    if n & 0x80:
        n = ((n & 0x7F) << 8) | data[p]
        p += 1
    return n, p


def _len_utf16(data, p):
    n = u16(data, p)
    p += 2
    if n & 0x8000:
        n = ((n & 0x7FFF) << 16) | u16(data, p)
        p += 2
    return n, p


def _decode_mutf8(raw):
    # arsc 的 UTF-8 字串是 Java modified UTF-8 / CESU-8：
    # BMP 以外字元（emoji）以 UTF-16 代理對各編成 3 bytes（共 6 bytes），
    # 標準 utf-8 decoder 會當成無效代理 -> 替代字元。
    # 解法：用 surrogatepass 收下代理，再經 utf-16 來回把代理對併回真字元。
    try:
        s = raw.decode("utf-8", "surrogatepass")
        return s.encode("utf-16", "surrogatepass").decode("utf-16")
    except UnicodeError:
        return raw.decode("utf-8", "replace")


def parse_string_pool(data, off):
    """回傳 off 這個 chunk 起點的 string pool 字串陣列。"""
    assert u16(data, off) == RES_STRING_POOL_TYPE, "not a string pool at %d" % off
    header_size = u16(data, off + 2)
    string_count = u32(data, off + 8)
    flags = u32(data, off + 16)
    strings_start = u32(data, off + 20)
    is_utf8 = bool(flags & FLAG_UTF8)

    offsets_base = off + header_size          # u32 偏移陣列接在 header 之後
    data_base = off + strings_start           # 字串資料區
    out = []
    for i in range(string_count):
        str_off = u32(data, offsets_base + i * 4)
        p = data_base + str_off
        if is_utf8:
            _n_chars, p = _len_utf8(data, p)      # 第一個長度（字元數）用不到
            n_bytes, p = _len_utf8(data, p)
            # modified UTF-8 以 NUL 結尾（真正的 U+0000 會編成 C0 80），
            # 直接讀到 NUL 可同時避開 AOSP 對含補充字元字串長度算錯的老 bug
            end = data.find(b"\x00", p)
            raw = data[p:end] if 0 <= end <= p + n_bytes + 8 else data[p:p + n_bytes]
            s = _decode_mutf8(raw)
        else:
            n_units, p = _len_utf16(data, p)
            s = data[p:p + n_units * 2].decode("utf-16-le", "replace")
        out.append(s)
    return out


# ---- ResTable_config 的語系欄位 ----
def _unpack(b0, b1, base):
    if b0 == 0 and b1 == 0:
        return ""
    if b0 & 0x80:  # 3 字母打包進 2 bytes（base-26/base-10）
        first = b1 & 0x1F
        second = ((b1 & 0xE0) >> 5) | ((b0 & 0x03) << 3)
        third = (b0 & 0x7C) >> 2
        return "".join(chr(base + x) for x in (first, second, third))
    return chr(b0) + chr(b1)


def config_locale(data, cfg_off, cfg_size):
    # ResTable_config: size(u32) 之後依序 imsi(4) 之後 language(2)@8 region(2)@10
    if cfg_size < 12:
        return "default"
    lang = _unpack(data[cfg_off + 8], data[cfg_off + 9], ord("a"))
    region = _unpack(data[cfg_off + 10], data[cfg_off + 11], ord("0"))
    if not lang:
        return "default"
    return lang + ("-" + region if region else "")


# ---- 走訪整張表 ----
def walk_table(data):
    """回傳 (value_pool, packages)。packages: [{name, type_names, key_names, types:[...]}]"""
    assert u16(data, 0) == RES_TABLE_TYPE, "not a resources.arsc / RES_TABLE"
    header_size = u16(data, 2)
    total = u32(data, 4)

    value_pool = None
    packages = []
    off = header_size
    while off < total:
        ctype = u16(data, off)
        csize = u32(data, off + 4)
        if csize <= 0:
            break
        if ctype == RES_STRING_POOL_TYPE and value_pool is None:
            value_pool = parse_string_pool(data, off)
        elif ctype == RES_TABLE_PACKAGE_TYPE:
            packages.append(parse_package(data, off, csize))
        off += csize
    return value_pool or [], packages


def parse_package(data, off, csize):
    pkg_header = u16(data, off + 2)
    pkg_id = u32(data, off + 8)
    name = _read_pkgname(data, off + 12)
    # ResTable_package: id@8, name[128]@12, typeStrings@268, lastPublicType@272,
    # keyStrings@276, lastPublicKey@280
    type_strings_off = u32(data, off + 268)
    key_strings_off = u32(data, off + 276)

    type_names = parse_string_pool(data, off + type_strings_off) if type_strings_off else []
    key_names = parse_string_pool(data, off + key_strings_off) if key_strings_off else []

    types = []
    end = off + csize
    cur = off + pkg_header
    # 子 chunk 從第一個 pool 之後開始；直接掃到 package 結尾
    while cur < end:
        ctype = u16(data, cur)
        sz = u32(data, cur + 4)
        if sz <= 0:
            break
        if ctype == RES_TABLE_TYPE_TYPE:
            types.append(parse_type_chunk(data, cur))
        cur += sz
    return {
        "id": pkg_id,
        "name": name,
        "type_names": type_names,
        "key_names": key_names,
        "types": types,
    }


def _read_pkgname(data, off):
    # 128 個 u16，NUL 結尾
    chars = []
    for i in range(128):
        c = u16(data, off + i * 2)
        if c == 0:
            break
        chars.append(chr(c))
    return "".join(chars)


def parse_type_chunk(data, off):
    header_size = u16(data, off + 2)
    type_id = data[off + 8]              # 1-based
    entry_count = u32(data, off + 12)
    entries_start = u32(data, off + 16)
    cfg_off = off + 20
    cfg_size = u32(data, cfg_off)
    locale = config_locale(data, cfg_off, cfg_size)

    flags = data[off + 9]
    FLAG_OFFSET16 = 0x02
    FLAG_SPARSE = 0x01

    idx_base = off + header_size
    data_base = off + entries_start
    entries = []  # (entry_id, key_index, value_type, value_data)
    for i in range(entry_count):
        if flags & FLAG_SPARSE:
            # sparse: (idx u16, offset/4 u16)
            eid = u16(data, idx_base + i * 4)
            eoff = u16(data, idx_base + i * 4 + 2) * 4
        elif flags & FLAG_OFFSET16:
            eoff = u16(data, idx_base + i * 2)
            eid = i
            if eoff == 0xFFFF:
                continue
            eoff *= 4
        else:
            eoff = u32(data, idx_base + i * 4)
            eid = i
            if eoff == 0xFFFFFFFF:
                continue
        ep = data_base + eoff
        entry_size = u16(data, ep)
        entry_flags = u16(data, ep + 2)
        key_index = u32(data, ep + 4)
        if entry_flags & 0x0001:   # FLAG_COMPLEX（bag），不是單純字串值，略過
            continue
        # Res_value 緊接在 entry header（8 bytes）之後
        vp = ep + 8
        value_type = data[vp + 3]
        value_data = u32(data, vp + 4)
        entries.append((eid, key_index, value_type, value_data))
    return {"type_id": type_id, "locale": locale, "entries": entries}


def resolve(value_pool, packages, want_locales=None):
    rows = []  # {res, locale, value}
    for pkg in packages:
        type_names = pkg["type_names"]
        key_names = pkg["key_names"]
        for t in pkg["types"]:
            tname = type_names[t["type_id"] - 1] if 0 < t["type_id"] <= len(type_names) else "type%d" % t["type_id"]
            if tname != "string":
                continue
            loc = t["locale"]
            if want_locales and loc not in want_locales:
                continue
            for eid, key_index, vtype, vdata in t["entries"]:
                if vtype != TYPE_STRING:
                    continue
                if vdata >= len(value_pool):
                    continue
                key = key_names[key_index] if key_index < len(key_names) else "key%d" % key_index
                rows.append({
                    "res": "%s/%s" % (tname, key),
                    "locale": loc,
                    "value": value_pool[vdata],
                })
    return rows


def esc_strings(s):
    # Apple/Steam .strings 跳脫
    return (s.replace("\\", "\\\\").replace('"', '\\"')
             .replace("\n", "\\n").replace("\t", "\\t").replace("\r", "\\r"))


def load_arsc(path):
    p = Path(path)
    raw = p.read_bytes()
    if raw[:2] == b"PK":
        with zipfile.ZipFile(p) as zf:
            return zf.read("resources.arsc")
    return raw


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("input", help="resources.arsc 或 .apk")
    ap.add_argument("--out-dir", default="out_arsc")
    ap.add_argument("--locale", nargs="*", help="只輸出這些語系，如 zh-TW en default")
    ap.add_argument("--grep", help="只保留 value 符合此 regex 的列")
    ap.add_argument("--dump-pools", action="store_true", help="另外輸出所有 string pool 原始字串")
    ap.add_argument("--split", action="store_true", help="每個語系各輸出一個 by_locale/<locale> 檔")
    ap.add_argument("--format", choices=["txt", "strings"], default="txt",
                    help="txt: 'res = value'；strings: Apple/Steam .strings 格式 \"key\" = \"value\";")
    args = ap.parse_args()

    data = load_arsc(args.input)
    value_pool, packages = walk_table(data)

    want = set(args.locale) if args.locale else None
    rows = resolve(value_pool, packages, want)
    if args.grep:
        rx = re.compile(args.grep, re.IGNORECASE)
        rows = [r for r in rows if rx.search(r["value"])]

    def line_of(r):
        if args.format == "strings":
            # Steam/Apple .strings：key 去掉 "string/" 前綴，值做 .strings 跳脫
            key = r["res"].split("/", 1)[1] if "/" in r["res"] else r["res"]
            return '"%s" = "%s";' % (esc_strings(key), esc_strings(r["value"]))
        return "%s = %s" % (r["res"], r["value"].replace("\n", "\\n"))

    ext = "strings" if args.format == "strings" else "txt"

    out = Path(args.out_dir)
    out.mkdir(parents=True, exist_ok=True)

    # 1. resolved JSON（永遠輸出，方便程式吃）
    (out / "strings.json").write_text(
        json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")

    # 2. 以語系分組
    by_loc = {}
    for r in rows:
        by_loc.setdefault(r["locale"], []).append(r)
    lines = []
    for loc in sorted(by_loc):
        lines.append("===== locale: %s (%d) =====" % (loc, len(by_loc[loc])))
        for r in sorted(by_loc[loc], key=lambda x: x["res"]):
            lines.append(line_of(r))
        lines.append("")
    (out / ("strings.%s" % ext)).write_text("\n".join(lines), encoding="utf-8")

    # 每語系一檔
    if args.split:
        loc_dir = out / "by_locale"
        loc_dir.mkdir(parents=True, exist_ok=True)
        for loc, items in by_loc.items():
            with (loc_dir / ("%s.%s" % (loc, ext))).open("w", encoding="utf-8") as f:
                for r in sorted(items, key=lambda x: x["res"]):
                    f.write(line_of(r) + "\n")
        print("split %d locales -> %s/" % (len(by_loc), loc_dir))

    locales = sorted({r["locale"] for r in rows})
    print("packages: %d, value-pool strings: %d" % (len(packages), len(value_pool)))
    print("string resources: %d across %d locales" % (len(rows), len(locales)))
    print("locales:", ", ".join(locales) if locales else "(none)")

    if args.dump_pools:
        pools = [("value-pool", value_pool)]
        for pkg in packages:
            pools.append(("%s/type-names" % pkg["name"], pkg["type_names"]))
            pools.append(("%s/key-names" % pkg["name"], pkg["key_names"]))
        dump = []
        for label, pool in pools:
            dump.append("# %s (%d)" % (label, len(pool)))
            dump.extend(pool)
            dump.append("")
        (out / "all_pools.txt").write_text("\n".join(dump), encoding="utf-8")
        print("dumped raw pools -> %s" % (out / "all_pools.txt"))

    print("wrote %s and %s" % (out / "strings.json", out / ("strings.%s" % ext)))


if __name__ == "__main__":
    main()