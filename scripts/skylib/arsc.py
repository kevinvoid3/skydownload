"""resources.arsc 解析、字串清標記、strings/ 讀寫（合併 extract_arsc_strings.py 與 build_strings.py）。

標記處理（normalize）：
  - 排版標記 <b> <1> <warning> <apcolor> <small> <h3> ... 一律移除
  - 圖示標記 <candle/> <heart/> <button type="shout"/> 預設移除；keep_icons=True 轉成 [candle] [btn:shout]
  - 變數佔位 {1} %s %1$s 保留不動
  - 移除標記後收斂多餘空白
"""
import json
import re
import struct
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


# ---- 清標記 ----
TAG_RE = re.compile(r"<[^>]*>")
ICON_RE = re.compile(r"<([a-zA-Z_][\w]*)\s*/>")
BTN_RE = re.compile(r'<button\s+type="([^"]+)"\s*/>')
WS_RE = re.compile(r"[ \t]{2,}")


def normalize(value, keep_icons=False):
    s = value
    if keep_icons:
        s = BTN_RE.sub(lambda m: "[btn:%s]" % m.group(1), s)
        s = ICON_RE.sub(lambda m: "[%s]" % m.group(1), s)
    # 其餘（含排版標記、以及未保留時的圖示）全部移除
    s = TAG_RE.sub("", s)
    # 收斂因移除標記產生的多餘空白（保留換行）
    s = WS_RE.sub(" ", s)
    s = "\n".join(line.strip() for line in s.split("\n"))
    return s.strip()


# ---- 高階：APK -> {locale: {key: value}} ----
def read_arsc_from_apk(apk_path):
    with zipfile.ZipFile(apk_path) as zf:
        if "resources.arsc" not in zf.namelist():
            return None
        return zf.read("resources.arsc")   # 只讀這個 entry，不載入整包


def strings_by_locale(arsc, locales=None, normalize_values=True, keep_icons=False):
    value_pool, packages = walk_table(arsc)
    rows = resolve(value_pool, packages, set(locales) if locales else None)
    by_loc = {}
    for r in rows:
        key = r["res"].split("/", 1)[1] if "/" in r["res"] else r["res"]
        val = normalize(r["value"], keep_icons) if normalize_values else r["value"]
        by_loc.setdefault(r["locale"], {})[key] = val
    return by_loc


# ---- strings/ 目錄讀寫 ----
STRINGS_EXT = {"strings": "strings", "json": "json", "txt": "txt"}


def write_strings_dir(by_loc, out_dir, fmt="strings"):
    out = Path(out_dir)
    out.mkdir(parents=True, exist_ok=True)
    ext = STRINGS_EXT[fmt]
    for loc in sorted(by_loc):
        kv = by_loc[loc]
        path = out / ("%s.%s" % (loc, ext))
        if fmt == "json":
            path.write_text(json.dumps(kv, ensure_ascii=False, indent=2), encoding="utf-8")
        elif fmt == "strings":
            lines = ['"%s" = "%s";' % (esc_strings(k), esc_strings(v)) for k, v in sorted(kv.items())]
            path.write_text("\n".join(lines) + "\n", encoding="utf-8")
        else:
            lines = ["%s = %s" % (k, v.replace("\n", "\\n")) for k, v in sorted(kv.items())]
            path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return len(by_loc)


_STRINGS_LINE = re.compile(r'^"((?:[^"\\]|\\.)*)"\s*=\s*"((?:[^"\\]|\\.)*)";\s*$')
_UNESC = {"n": "\n", "t": "\t", "r": "\r", '"': '"', "\\": "\\"}


def unesc_strings(s):
    return re.sub(r"\\(.)", lambda m: _UNESC.get(m.group(1), "\\" + m.group(1)), s)


def parse_strings_text(text):
    """解析 .strings（Apple/Steam 格式，一行一筆）；略過註解與空行。"""
    kv = {}
    for line in text.splitlines():
        line = line.strip()
        if not line or line.startswith(("/*", "//", "*")):
            continue
        m = _STRINGS_LINE.match(line)
        if m:
            kv[unesc_strings(m.group(1))] = unesc_strings(m.group(2))
    return kv


def load_strings_file(path):
    path = Path(path)
    text = path.read_text(encoding="utf-8-sig")
    if path.suffix == ".json":
        return json.loads(text)
    if path.suffix == ".txt":
        kv = {}
        for line in text.splitlines():
            if " = " in line:
                k, v = line.split(" = ", 1)
                kv[k] = v.replace("\\n", "\n")
        return kv
    return parse_strings_text(text)


def load_strings_dir(path, locales=None):
    """讀 strings/ 目錄 -> {locale: {key: value}}；目錄不存在回傳 {}。"""
    p = Path(path)
    out = {}
    if not p.is_dir():
        return out
    for f in sorted(p.iterdir()):
        if f.suffix.lstrip(".") not in STRINGS_EXT.values():
            continue
        loc = f.stem
        if locales and loc not in locales:
            continue
        out[loc] = load_strings_file(f)
    return out
