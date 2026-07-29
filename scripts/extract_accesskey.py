#!/usr/bin/env python3
import argparse
import hashlib
import json
import os
import re
import sys
import urllib.request
import zipfile
from datetime import datetime, timezone, timedelta
from pathlib import Path


DEFAULT_HISTORY_URL = (
    "history.json"
)
DEFAULT_PACKAGE = "com.tgc.sky.android.huawei"
DEFAULT_PATTERNS = [
    r"access[_-]?key",
    r"accessKey",
    r"AccessKey",
]
DEFAULT_ACCESSKEY_PATTERNS = [
    r'(?i)["\']?access[_-]?key["\']?\s*[:=]\s*["\']?([A-Za-z0-9._~+/=-]{8,})',
    r'(?i)[?&]access[_-]?key=([^&"\'\s]{8,})',
]
SENSITIVE_HINT = re.compile(
    r"(access[_-]?key|accessKey|secret|token|credential|password|passwd|authorization)",
    re.IGNORECASE,
)
HIGH_ENTROPY = re.compile(r"^[A-Za-z0-9_+/=-]{24,}$")


def now_cst():
    return datetime.now(timezone(timedelta(hours=8))).strftime("%Y-%m-%d %H:%M:%S")


def read_url(url):
    req = urllib.request.Request(url, headers={"User-Agent": "sky-apk-dex-action/1.0"})
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
    req = urllib.request.Request(url, headers={"User-Agent": "sky-apk-dex-action/1.0"})
    with urllib.request.urlopen(req, timeout=120) as resp, dest.open("wb") as out:
        while True:
            chunk = resp.read(1024 * 1024)
            if not chunk:
                break
            out.write(chunk)
    return dest


def sha256_file(path):
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def uleb128(data, offset):
    result = 0
    shift = 0
    cursor = offset
    while True:
        b = data[cursor]
        cursor += 1
        result |= (b & 0x7F) << shift
        if (b & 0x80) == 0:
            return result, cursor
        shift += 7


def read_u32(data, offset):
    return int.from_bytes(data[offset : offset + 4], "little")


def iter_dex_strings(dex_bytes):
    if not dex_bytes.startswith(b"dex\n"):
        return
    string_ids_size = read_u32(dex_bytes, 0x38)
    string_ids_off = read_u32(dex_bytes, 0x3C)
    for index in range(string_ids_size):
        string_data_off = read_u32(dex_bytes, string_ids_off + index * 4)
        _, cursor = uleb128(dex_bytes, string_data_off)
        end = dex_bytes.find(b"\x00", cursor)
        if end < 0:
            continue
        raw = dex_bytes[cursor:end]
        text = raw.decode("utf-8", errors="replace")
        yield index, text


def context_window(strings, hit_index, radius):
    lo = max(0, hit_index - radius)
    hi = min(len(strings), hit_index + radius + 1)
    return [
        {"stringIndex": strings[i][0], **summarize_string(strings[i][1])}
        for i in range(lo, hi)
    ]


def fingerprint(value):
    return hashlib.sha256(value.encode("utf-8", errors="replace")).hexdigest()


def summarize_string(value):
    digest = fingerprint(value)
    should_redact = SENSITIVE_HINT.search(value) or HIGH_ENTROPY.fullmatch(value)
    if should_redact:
        preview = "[redacted]"
    else:
        preview = value
        if len(preview) > 180:
            preview = f"{preview[:90]}...[{len(value)} chars]...{preview[-60:]}"
    return {
        "valuePreview": preview,
        "length": len(value),
        "sha256": digest,
    }


def extract_accesskey_candidates(dex_name, strings, patterns):
    compiled = [re.compile(pattern) for pattern in patterns]
    candidates = []
    seen = set()
    for string_index, value in strings:
        for pattern in compiled:
            match = pattern.search(value)
            if not match:
                continue
            accesskey = match.group(1) if match.lastindex else match.group(0)
            accesskey = accesskey.rstrip("\"'")
            if accesskey in seen:
                continue
            seen.add(accesskey)
            candidates.append(
                {
                    "accesskey": accesskey,
                    "dex": dex_name,
                    "stringIndex": string_index,
                    "pattern": pattern.pattern,
                }
            )
    return candidates


def scan_dex(dex_name, dex_bytes, patterns, accesskey_patterns, radius):
    compiled = [re.compile(p, re.IGNORECASE) for p in patterns]
    strings = list(iter_dex_strings(dex_bytes))
    hits = []
    for i, (string_index, value) in enumerate(strings):
        matched = [p.pattern for p in compiled if p.search(value)]
        if not matched:
            continue
        hits.append(
            {
                "dex": dex_name,
                "stringIndex": string_index,
                "matchedPatterns": matched,
                **summarize_string(value),
                "context": context_window(strings, i, radius),
            }
        )
    candidates = extract_accesskey_candidates(dex_name, strings, accesskey_patterns)
    return hits, candidates, len(strings)


def extract_dex_files(apk_path):
    dex_files = []
    with zipfile.ZipFile(apk_path) as zf:
        for name in sorted(zf.namelist()):
            if re.fullmatch(r"classes(?:\d*)\.dex", name):
                dex_files.append((name, zf.read(name)))
    return dex_files


def write_text_report(report, path):
    lines = []
    lines.append("# Sky APK DEX AccessKey Scan")
    lines.append("")
    lines.append(f"- generatedAt: {report['generatedAt']}")
    lines.append(f"- package: {report['packageName']}")
    lines.append(f"- version: {report['apk']['version']}")
    lines.append(f"- apkSha256: {report['apk']['sha256']}")
    lines.append(f"- dexFiles: {len(report['dexFiles'])}")
    lines.append(f"- hits: {len(report['hits'])}")
    lines.append("")
    for hit in report["hits"]:
        lines.append(f"## {hit['dex']} string#{hit['stringIndex']}")
        lines.append("")
        lines.append(f"- patterns: {', '.join(hit['matchedPatterns'])}")
        lines.append(f"- sha256: {hit['sha256']}")
        lines.append(f"- length: {hit['length']}")
        lines.append("")
        lines.append("```text")
        for item in hit["context"]:
            marker = ">" if item["stringIndex"] == hit["stringIndex"] else " "
            lines.append(
                f"{marker} [{item['stringIndex']}] {item['valuePreview']} "
                f"(len={item['length']}, sha256={item['sha256']})"
            )
        lines.append("```")
        lines.append("")
    path.write_text("\n".join(lines), encoding="utf-8")


def write_accesskey_output(version, accesskey, public_dir):
    payload = {
        "version": version,
        "accesskey": accesskey,
    }
    content = json.dumps(payload, ensure_ascii=False, indent=2) + "\n"
    public_dir.mkdir(parents=True, exist_ok=True)
    (public_dir / "index.json").write_text(content, encoding="utf-8")
    (public_dir / "index.html").write_text(content, encoding="utf-8")


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--history-url", default=os.getenv("HISTORY_URL", DEFAULT_HISTORY_URL))
    parser.add_argument("--package-name", default=os.getenv("PACKAGE_NAME", DEFAULT_PACKAGE))
    parser.add_argument("--apk-url", default=os.getenv("APK_URL"))
    parser.add_argument("--work-dir", default=os.getenv("WORK_DIR", "work"))
    parser.add_argument("--out-dir", default=os.getenv("OUT_DIR", "out"))
    parser.add_argument("--public-dir", default=os.getenv("PUBLIC_DIR", "accesskey"))
    parser.add_argument("--context-radius", type=int, default=int(os.getenv("CONTEXT_RADIUS", "3")))
    parser.add_argument(
        "--pattern",
        action="append",
        default=[],
        help="Regex string to scan in DEX string table. Can be passed multiple times.",
    )
    parser.add_argument(
        "--accesskey-regex",
        action="append",
        default=[],
        help="Regex used to extract the accesskey. The first capture group is used.",
    )
    return parser.parse_args()


def main():
    args = parse_args()
    work_dir = Path(args.work_dir)
    out_dir = Path(args.out_dir)
    work_dir.mkdir(parents=True, exist_ok=True)
    out_dir.mkdir(parents=True, exist_ok=True)

    record = {}
    apk_url = args.apk_url
    if not apk_url:
        history = load_history(args.history_url)
        record = get_latest_record(history, args.package_name)
        apk_url = record["downUrl"]

    version = record.get("version", "manual-url")
    apk_path = work_dir / f"{args.package_name}.{version.replace('/', '_')}.apk"
    print(f"Downloading APK: {apk_url}")
    download_file(apk_url, apk_path)

    apk_sha = sha256_file(apk_path)
    if record.get("sha256") and record["sha256"].lower() != apk_sha.lower():
        raise SystemExit(
            f"APK sha256 mismatch: expected {record['sha256']}, got {apk_sha}"
        )

    patterns = args.pattern or DEFAULT_PATTERNS
    accesskey_patterns = args.accesskey_regex or DEFAULT_ACCESSKEY_PATTERNS
    dex_files = extract_dex_files(apk_path)
    if not dex_files:
        raise SystemExit("No classes*.dex files found in APK")

    all_hits = []
    all_candidates = []
    dex_summary = []
    for dex_name, dex_bytes in dex_files:
        hits, candidates, string_count = scan_dex(
            dex_name,
            dex_bytes,
            patterns,
            accesskey_patterns,
            args.context_radius,
        )
        all_hits.extend(hits)
        all_candidates.extend(candidates)
        dex_summary.append(
            {
                "name": dex_name,
                "bytes": len(dex_bytes),
                "sha256": hashlib.sha256(dex_bytes).hexdigest(),
                "stringCount": string_count,
                "hitCount": len(hits),
            }
        )

    report = {
        "generatedAt": now_cst(),
        "packageName": args.package_name,
        "source": {
            "historyUrl": args.history_url,
            "apkUrl": apk_url,
        },
        "apk": {
            "version": version,
            "size": apk_path.stat().st_size,
            "sha256": apk_sha,
        },
        "patterns": patterns,
        "accesskeyPatterns": accesskey_patterns,
        "dexFiles": dex_summary,
        "hits": all_hits,
        "accesskeyCandidates": [
            {
                "dex": candidate["dex"],
                "stringIndex": candidate["stringIndex"],
                "pattern": candidate["pattern"],
                "length": len(candidate["accesskey"]),
                "sha256": fingerprint(candidate["accesskey"]),
            }
            for candidate in all_candidates
        ],
    }

    accesskey = all_candidates[0]["accesskey"] if all_candidates else None
    (out_dir / "report.json").write_text(
        json.dumps(report, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
    write_text_report(report, out_dir / "report.md")
    write_accesskey_output(version, accesskey, Path(args.public_dir))
    print(f"Scanned {len(dex_files)} dex files, found {len(all_hits)} hits.")
    print(f"AccessKey: {'found' if accesskey else 'not found'}")
    print(f"Wrote {out_dir / 'report.json'} and {out_dir / 'report.md'}")
    print(f"Wrote {Path(args.public_dir) / 'index.json'}")


if __name__ == "__main__":
    main()
