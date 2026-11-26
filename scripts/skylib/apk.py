"""取得 APK：history.json、下載、sha256、zip 讀取、版本字串處理。"""
import hashlib
import json
import re
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


def download_file(url, dest):
    dest.parent.mkdir(parents=True, exist_ok=True)
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(req, timeout=120) as resp, dest.open("wb") as out:
        while True:
            chunk = resp.read(1024 * 1024)
            if not chunk:
                break
            out.write(chunk)
    return dest


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
