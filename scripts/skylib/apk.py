"""取得 APK：history.json、下載、sha256、zip 讀取、版本字串處理。"""
import hashlib
import http.client
import json
import re
import time
import urllib.error
import urllib.request
from datetime import datetime, timezone, timedelta
from pathlib import Path

USER_AGENT = "sky-apk-dex-action/1.0"
DEFAULT_HISTORY_URL = "history.json"
DEFAULT_PACKAGE = "com.tgc.sky.android.huawei"


def now_cst():
    return datetime.now(timezone(timedelta(hours=8))).strftime("%Y-%m-%d %H:%M:%S")


def read_url(url):
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(req, timeout=60) as resp:
        return resp.read()


def load_history(source):
    if re.match(r"^https?://", source):
        raw = read_url(source)
    else:
        raw = Path(source).read_bytes()
    return json.loads(raw.decode("utf-8"))


def get_latest_record(history, package_name):
    if isinstance(history, list):
        records = history
    else:
        records = history.get(package_name, [])
    if not records:
        raise SystemExit(f"No records found for package: {package_name}")
    return records[-1]


# 這些狀態碼代表連結本身有問題（過期、不存在），重試也沒用
_NO_RETRY = {400, 401, 403, 404, 410}


def download_file(url, dest, attempts=5, backoff=10):
    """下載到 dest；逾時或連線中斷就重試（10、20、40、80 秒後），伺服器支援 Range 時從斷點續傳。
    完整性由呼叫端用 sha256 驗證。"""
    dest.parent.mkdir(parents=True, exist_ok=True)
    if dest.exists():
        dest.unlink()          # 不接續上一次執行留下的檔案，避免拼到不同版本
    err = None
    for i in range(1, attempts + 1):
        have = dest.stat().st_size if dest.exists() else 0
        headers = {"User-Agent": USER_AGENT}
        if have:
            headers["Range"] = "bytes=%d-" % have
        try:
            req = urllib.request.Request(url, headers=headers)
            with urllib.request.urlopen(req, timeout=120) as resp:
                if have and resp.status != 206:
                    print("伺服器不支援續傳，從頭下載")
                    have = 0
                with dest.open("ab" if have else "wb") as out:
                    while True:
                        chunk = resp.read(1024 * 1024)
                        if not chunk:
                            break
                        out.write(chunk)
                length = resp.headers.get("Content-Length")
            if length is not None and dest.stat().st_size < have + int(length):
                raise ConnectionError("連線提早結束（%d / %d bytes）"
                                      % (dest.stat().st_size, have + int(length)))
            return dest
        except urllib.error.HTTPError as e:
            if e.code == 416 and have:
                return dest    # 已經下載完整
            if e.code in _NO_RETRY:
                raise SystemExit("下載失敗：HTTP %d（連結可能已失效）" % e.code)
            err = e
        except (urllib.error.URLError, http.client.HTTPException, OSError) as e:
            err = e            # 逾時、DNS、連線重設、IncompleteRead
        if i < attempts:
            wait = backoff * 2 ** (i - 1)
            print("下載失敗（第 %d/%d 次）：%s，%d 秒後重試" % (i, attempts, err, wait))
            time.sleep(wait)
    raise SystemExit("下載失敗（試了 %d 次）：%s" % (attempts, err))


def sha256_file(path):
    h = hashlib.sha256()
    with Path(path).open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def parse_version(version):
    """'0.35.6 (433304)' -> (0, 35, 6, 433304)；抓不到數字回傳 None。"""
    nums = re.findall(r"\d+", str(version or ""))
    return tuple(int(n) for n in nums) if nums else None


def compare_versions(a, b):
    """a 比 b 新回傳 1、相同 0、比較舊 -1；任一邊解析不了回傳 None。
    先比版本號，再比括號裡的 build 號；字串完全相同一律視為相同。"""
    if a is not None and a == b:
        return 0
    pa, pb = parse_version(a), parse_version(b)
    if pa is None or pb is None:
        return None
    n = max(len(pa), len(pb))
    pa, pb = pa + (0,) * (n - len(pa)), pb + (0,) * (n - len(pb))
    return (pa > pb) - (pa < pb)


def version_slug(version):
    """'0.35.5 (431758)' -> '0.35.5_431758'，給檔名用。"""
    s = re.sub(r"[^0-9A-Za-z._-]+", "_", str(version)).strip("_")
    return s or "unknown"


# android:versionCode / versionName 的 resource id（固定值）
_VERSION_CODE_ID = 0x0101021B
_VERSION_NAME_ID = 0x0101021C


def _axml_strings(data, o):
    """讀 binary AXML 的 string pool chunk（起點 o），回傳字串清單。"""
    import struct
    u16 = lambda p: struct.unpack_from("<H", data, p)[0]
    u32 = lambda p: struct.unpack_from("<I", data, p)[0]
    cnt = u32(o + 8)
    flags = u32(o + 16)
    stroff = u32(o + 20)
    utf8 = bool(flags & 0x100)
    base = o + stroff
    out = []
    for i in range(cnt):
        so = base + u32(o + 28 + i * 4)
        if utf8:
            j = so + (2 if data[so] & 0x80 else 1)
            m = data[j]; j += 1
            if m & 0x80:
                m = ((m & 0x7F) << 8) | data[j]; j += 1
            out.append(data[j:j + m].decode("utf-8", "replace"))
        else:
            ln = u16(so)
            out.append(data[so + 2:so + 2 + ln * 2].decode("utf-16-le", "replace"))
    return out


def read_version_code(apk_path):
    """從 APK 的 AndroidManifest.xml（binary AXML）讀 android:versionCode；
    讀不到或解析失敗一律回傳 None（絕不讓整個流程中斷）。華為 API 給國際服的
    version 已含 build 號，國服只有 versionName，靠這支補上。"""
    import struct
    import zipfile
    try:
        with zipfile.ZipFile(apk_path) as zf:
            data = zf.read("AndroidManifest.xml")
    except (KeyError, zipfile.BadZipFile, OSError):
        return None
    try:
        u16 = lambda p: struct.unpack_from("<H", data, p)[0]
        u32 = lambda p: struct.unpack_from("<I", data, p)[0]
        if len(data) < 8 or u16(0) != 0x0003:   # 不是標準 AXML（例如被加殼）
            return None
        strings, resmap = [], []
        pos = 8
        while pos + 8 <= len(data):
            t = u16(pos); hs = u16(pos + 2); sz = u32(pos + 4)
            if sz < 8:
                break
            if t == 0x0001:                       # string pool
                strings = _axml_strings(data, pos)
            elif t == 0x0180:                     # resource map
                resmap = [u32(pos + hs + i * 4) for i in range((sz - hs) // 4)]
            elif t == 0x0102:                     # START_TAG
                name_idx = u32(pos + 20)
                tag = strings[name_idx] if name_idx < len(strings) else ""
                if tag == "manifest":
                    attr_start = u16(pos + 24)
                    attr_count = u16(pos + 28)
                    ab = pos + 16 + attr_start
                    for i in range(attr_count):
                        a = ab + i * 20
                        a_name = u32(a + 4)
                        value = u32(a + 16)
                        rid = resmap[a_name] if a_name < len(resmap) else None
                        if rid == _VERSION_CODE_ID:
                            return value
                    return None                   # 有 manifest 但沒 versionCode
            pos += sz
    except (struct.error, IndexError, UnicodeDecodeError):
        return None
    return None


def with_version_code(version, apk_path):
    """version 字串若還沒有括號 build 號，就從 APK 補上 versionCode：
    '0.16.8' + 421629 -> '0.16.8 (421629)'；補不到就原樣回傳。"""
    v = str(version or "")
    if "(" in v:                                  # 已含 build 號（例如國際服）
        return version
    code = read_version_code(apk_path)
    return "%s (%d)" % (v, code) if code is not None else version
