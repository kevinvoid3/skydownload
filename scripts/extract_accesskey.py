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
ACCESSKEY_FIELD = re.compile(r"access[_-]?key", re.IGNORECASE)

VALUE_STRING = 0x17
VALUE_ARRAY = 0x1C
VALUE_ANNOTATION = 0x1D
VALUE_NULL = 0x1E
VALUE_BOOLEAN = 0x1F


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


def read_u16(data, offset):
    return int.from_bytes(data[offset : offset + 2], "little")


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


def decode_encoded_value(data, offset, strings):
    header = data[offset]
    offset += 1
    value_type = header & 0x1F
    value_arg = header >> 5

    if value_type == VALUE_NULL:
        return None, "null", offset
    if value_type == VALUE_BOOLEAN:
        return bool(value_arg), "boolean", offset
    if value_type == VALUE_ARRAY:
        size, offset = uleb128(data, offset)
        values = []
        for _ in range(size):
            value, value_kind, offset = decode_encoded_value(data, offset, strings)
            values.append({"kind": value_kind, "value": value})
        return values, "array", offset
    if value_type == VALUE_ANNOTATION:
        _, offset = uleb128(data, offset)
        size, offset = uleb128(data, offset)
        values = []
        for _ in range(size):
            name_idx, offset = uleb128(data, offset)
            value, value_kind, offset = decode_encoded_value(data, offset, strings)
            values.append(
                {
                    "name": strings[name_idx],
                    "kind": value_kind,
                    "value": value,
                }
            )
        return values, "annotation", offset

    byte_count = value_arg + 1
    raw_value = int.from_bytes(data[offset : offset + byte_count], "little")
    offset += byte_count
    if value_type == VALUE_STRING:
        if raw_value >= len(strings):
            return None, "invalid-string", offset
        return {
            "stringIndex": raw_value,
            "text": strings[raw_value],
        }, "string", offset
    return raw_value, f"type-0x{value_type:02x}", offset


def read_static_fields(data, class_data_off):
    cursor = class_data_off
    static_fields_size, cursor = uleb128(data, cursor)
    instance_fields_size, cursor = uleb128(data, cursor)
    direct_methods_size, cursor = uleb128(data, cursor)
    virtual_methods_size, cursor = uleb128(data, cursor)

    static_fields = []
    field_idx = 0
    for _ in range(static_fields_size):
        field_idx_diff, cursor = uleb128(data, cursor)
        _, cursor = uleb128(data, cursor)
        field_idx += field_idx_diff
        static_fields.append(field_idx)

    for _ in range(instance_fields_size):
        _, cursor = uleb128(data, cursor)
        _, cursor = uleb128(data, cursor)
    for _ in range(direct_methods_size + virtual_methods_size):
        _, cursor = uleb128(data, cursor)
        _, cursor = uleb128(data, cursor)
        _, cursor = uleb128(data, cursor)
    return static_fields


def read_static_values(data, static_values_off, strings):
    size, cursor = uleb128(data, static_values_off)
    values = []
    for _ in range(size):
        value, value_kind, cursor = decode_encoded_value(data, cursor, strings)
        values.append({"kind": value_kind, "value": value})
    return values


def extract_static_accesskeys(dex_name, dex_bytes, strings):
    type_ids_size = read_u32(dex_bytes, 0x40)
    type_ids_off = read_u32(dex_bytes, 0x44)
    field_ids_size = read_u32(dex_bytes, 0x50)
    field_ids_off = read_u32(dex_bytes, 0x54)
    class_defs_size = read_u32(dex_bytes, 0x60)
    class_defs_off = read_u32(dex_bytes, 0x64)

    type_descriptors = []
    for index in range(type_ids_size):
        descriptor_idx = read_u32(dex_bytes, type_ids_off + index * 4)
        type_descriptors.append(strings[descriptor_idx])

    fields = []
    for index in range(field_ids_size):
        offset = field_ids_off + index * 8
        class_idx = read_u16(dex_bytes, offset)
        name_idx = read_u32(dex_bytes, offset + 4)
        fields.append(
            {
                "class": (
                    type_descriptors[class_idx]
                    if class_idx < len(type_descriptors)
                    else None
                ),
                "name": strings[name_idx],
            }
        )

    candidates = []
    for index in range(class_defs_size):
        offset = class_defs_off + index * 32
        class_data_off = read_u32(dex_bytes, offset + 24)
        static_values_off = read_u32(dex_bytes, offset + 28)
        if not class_data_off or not static_values_off:
            continue

        static_fields = read_static_fields(dex_bytes, class_data_off)
        static_values = read_static_values(dex_bytes, static_values_off, strings)
        for position, value_info in enumerate(static_values):
            if position >= len(static_fields):
                break
            field_index = static_fields[position]
            if field_index >= len(fields):
                continue
            field = fields[field_index]
            if not ACCESSKEY_FIELD.search(field["name"]):
                continue
            encoded_string = value_info["value"]
            if (
                value_info["kind"] != "string"
                or not encoded_string
                or not encoded_string["text"]
            ):
                continue
            value = encoded_string["text"]
            candidates.append(
                {
                    "dex": dex_name,
                    "source": "static-field",
                    "class": field["class"],
                    "field": field["name"],
                    "accesskey": value,
                    "stringIndex": encoded_string["stringIndex"],
                    "length": len(value),
                    "sha256": fingerprint(value),
                    "redactedStringIndexes": [encoded_string["stringIndex"]],
                }
            )
    return candidates


def candidate_metadata(candidate):
    if not candidate:
        return None
    return {
        "dex": candidate["dex"],
        "source": candidate["source"],
        "class": candidate.get("class"),
        "field": candidate.get("field"),
        "stringIndex": candidate.get("stringIndex"),
        "pattern": candidate.get("pattern"),
        "length": candidate["length"],
        "sha256": candidate["sha256"],
    }


def context_window(strings, hit_index, radius, redacted_string_indexes=None):
    lo = max(0, hit_index - radius)
    hi = min(len(strings), hit_index + radius + 1)
    redacted_string_indexes = redacted_string_indexes or set()
    return [
        {
            "stringIndex": strings[i][0],
            **summarize_string(
                strings[i][1],
                strings[i][0] in redacted_string_indexes,
            ),
        }
        for i in range(lo, hi)
    ]


def fingerprint(value):
    return hashlib.sha256(value.encode("utf-8", errors="replace")).hexdigest()


def summarize_string(value, force_redact=False):
    digest = fingerprint(value)
    should_redact = (
        force_redact
        or SENSITIVE_HINT.search(value)
        or HIGH_ENTROPY.fullmatch(value)
    )
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
            candidate_id = (len(accesskey), fingerprint(accesskey))
            if candidate_id in seen:
                continue
            seen.add(candidate_id)
            candidates.append(
                {
                    "dex": dex_name,
                    "source": "inline-string",
                    "accesskey": accesskey,
                    "stringIndex": string_index,
                    "pattern": pattern.pattern,
                    "length": candidate_id[0],
                    "sha256": candidate_id[1],
                    "redactedStringIndexes": [string_index],
                }
            )
    return candidates


def accesskey_candidate_priority(candidate):
    field = (candidate.get("field") or "").upper()
    class_name = (candidate.get("class") or "").lower()
    if field == "SKY_ACCESS_KEY":
        return 0
    if "buildconfig" in class_name and ACCESSKEY_FIELD.search(field):
        return 1
    if candidate["source"] == "static-field":
        return 2
    return 3


def scan_dex(dex_name, dex_bytes, patterns, accesskey_patterns, radius):
    compiled = [re.compile(p, re.IGNORECASE) for p in patterns]
    strings = list(iter_dex_strings(dex_bytes))
    string_values = [value for _, value in strings]
    candidates = extract_static_accesskeys(dex_name, dex_bytes, string_values)
    candidates.extend(
        extract_accesskey_candidates(dex_name, strings, accesskey_patterns)
    )
    redacted_string_indexes = {
        string_index
        for candidate in candidates
        for string_index in candidate["redactedStringIndexes"]
    }

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
                **summarize_string(
                    value,
                    string_index in redacted_string_indexes,
                ),
                "context": context_window(
                    strings,
                    i,
                    radius,
                    redacted_string_indexes,
                ),
            }
        )
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
    selected = report["selectedAccesskeyCandidate"]
    lines.append(f"- accesskeyCandidate: {'found' if selected else 'not found'}")
    if selected:
        lines.append(f"- accesskeyDex: {selected['dex']}")
        lines.append(f"- accesskeySource: {selected['source']}")
        lines.append(f"- accesskeyField: {selected['field']}")
        lines.append(f"- accesskeyLength: {selected['length']}")
        lines.append(f"- accesskeySha256: {selected['sha256']}")
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


def write_accesskey_output(version, selected_candidate, output_path):
    payload = {
        "version": version,
        "accesskey": selected_candidate.get("accesskey") if selected_candidate else None,
    }
    content = json.dumps(payload, ensure_ascii=False, indent=2) + "\n"
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(content, encoding="utf-8")


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--history-url", default=os.getenv("HISTORY_URL", DEFAULT_HISTORY_URL))
    parser.add_argument("--package-name", default=os.getenv("PACKAGE_NAME", DEFAULT_PACKAGE))
    parser.add_argument("--apk-url", default=os.getenv("APK_URL"))
    parser.add_argument("--work-dir", default=os.getenv("WORK_DIR", "work"))
    parser.add_argument("--out-dir", default=os.getenv("OUT_DIR", "out"))
    parser.add_argument("--public-file", default=os.getenv("PUBLIC_FILE", "accesskey.json"))
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
            candidate_metadata(candidate)
            for candidate in all_candidates
        ],
    }

    selected_candidate = (
        min(all_candidates, key=accesskey_candidate_priority)
        if all_candidates
        else None
    )
    report["selectedAccesskeyCandidate"] = candidate_metadata(selected_candidate)
    (out_dir / "report.json").write_text(
        json.dumps(report, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
    write_text_report(report, out_dir / "report.md")
    write_accesskey_output(version, selected_candidate, Path(args.public_file))
    print(f"Scanned {len(dex_files)} dex files, found {len(all_hits)} hits.")
    print(f"AccessKey candidate: {'found' if selected_candidate else 'not found'}")
    print(f"Wrote {out_dir / 'report.json'} and {out_dir / 'report.md'}")
    print(f"Wrote {Path(args.public_file)}")


if __name__ == "__main__":
    main()
