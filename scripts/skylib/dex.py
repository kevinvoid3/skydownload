"""DEX 解析與 accesskey 抽取（自 extract_accesskey.py 原樣搬移）。"""
import hashlib
import json
import re
import zipfile
from pathlib import Path

from .apk import now_cst

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

# 國服（網易）：key 不在 DEX static field，而在 assets/_ntcfgss*.dat 設定檔裡。
# 該檔含 SKY_BUILD_ACCESS_KEY 標記（與 key 不相鄰），全檔只有唯一一個符合格式的字串即為 key。
# 編號會隨版本／渠道變（華為包在 _ntcfgss2、官網包在 _ntcfgss3），所以用 glob 不寫死。
ASSETS_KEY_GLOB = re.compile(r"assets/_ntcfgss\d*\.dat")
ASSETS_KEY_MARKER = b"SKY_BUILD_ACCESS_KEY"
ASSETS_KEY_PATTERN = re.compile(rb"[0-9]{10}-[0-9a-fA-F]{64}(?![0-9a-fA-F])")

VALUE_STRING = 0x17
VALUE_ARRAY = 0x1C
VALUE_ANNOTATION = 0x1D
VALUE_NULL = 0x1E
VALUE_BOOLEAN = 0x1F

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


def extract_assets_buildkey(apk_path):
    """掃 APK 的 assets/_ntcfgss*.dat：含 SKY_BUILD_ACCESS_KEY 標記、且全檔唯一一個
    符合格式的字串，即為國服 key。回傳與其他抽法同形狀的候選清單。"""
    candidates = []
    with zipfile.ZipFile(apk_path) as zf:
        names = sorted(n for n in zf.namelist() if ASSETS_KEY_GLOB.fullmatch(n))
        for name in names:
            data = zf.read(name)
            if ASSETS_KEY_MARKER not in data:
                continue
            keys = {m.group(0) for m in ASSETS_KEY_PATTERN.finditer(data)}
            if len(keys) != 1:
                # 0 個：這份沒有；多個不同值：無法確定是哪個，交給呼叫端當成找不到
                if len(keys) > 1:
                    print(f"警告：{name} 有多個不同的 key 候選，略過")
                continue
            key = keys.pop().decode("ascii")
            candidates.append({
                "dex": name,
                "source": "assets-buildkey",
                "class": None,
                "field": "SKY_BUILD_ACCESS_KEY",
                "accesskey": key,
                "stringIndex": None,
                "pattern": ASSETS_KEY_PATTERN.pattern.decode("ascii"),
                "length": len(key),
                "sha256": fingerprint(key),
                "redactedStringIndexes": [],
            })
    return candidates


def accesskey_candidate_priority(candidate):
    field = (candidate.get("field") or "").upper()
    class_name = (candidate.get("class") or "").lower()
    # 國服 assets 設定檔的 key：定位明確（標記 + 全檔唯一），和國際服的 SKY_ACCESS_KEY 同級最優先。
    # 兩服不會同包，所以不會互搶。
    if candidate.get("source") == "assets-buildkey":
        return 0
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

def scan_apk(apk_path, version, package_name, apk_url="", history_url="",
             apk_sha="", patterns=None, accesskey_patterns=None,
             context_radius=3, out_dir="out", public_file="accesskey.json"):
    """掃整包 APK 的 DEX，寫 out/report.json、out/report.md 與 accesskey.json。"""
    out_dir = Path(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    patterns = patterns or DEFAULT_PATTERNS
    accesskey_patterns = accesskey_patterns or DEFAULT_ACCESSKEY_PATTERNS
    dex_files = extract_dex_files(apk_path)
    if not dex_files:
        raise SystemExit("No classes*.dex files found in APK")

    all_hits, all_candidates, dex_summary = [], [], []
    for dex_name, dex_bytes in dex_files:
        hits, candidates, string_count = scan_dex(
            dex_name, dex_bytes, patterns, accesskey_patterns, context_radius)
        all_hits.extend(hits)
        all_candidates.extend(candidates)
        dex_summary.append({
            "name": dex_name,
            "bytes": len(dex_bytes),
            "sha256": hashlib.sha256(dex_bytes).hexdigest(),
            "stringCount": string_count,
            "hitCount": len(hits),
        })

    # 國服 key 在 assets/_ntcfgss*.dat，不在 DEX；國際服沒有這些檔，這步不會有結果
    all_candidates.extend(extract_assets_buildkey(apk_path))

    report = {
        "generatedAt": now_cst(),
        "packageName": package_name,
        "source": {"historyUrl": history_url, "apkUrl": apk_url},
        "apk": {
            "version": version,
            "size": Path(apk_path).stat().st_size,
            "sha256": apk_sha,
        },
        "patterns": patterns,
        "accesskeyPatterns": accesskey_patterns,
        "dexFiles": dex_summary,
        "hits": all_hits,
        "accesskeyCandidates": [candidate_metadata(c) for c in all_candidates],
    }
    selected = min(all_candidates, key=accesskey_candidate_priority) if all_candidates else None
    report["selectedAccesskeyCandidate"] = candidate_metadata(selected)
    (out_dir / "report.json").write_text(
        json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    write_text_report(report, out_dir / "report.md")
    write_accesskey_output(version, selected, Path(public_file))
    print(f"Scanned {len(dex_files)} dex files, found {len(all_hits)} hits.")
    print(f"AccessKey candidate: {'found' if selected else 'not found'}")
    print(f"Wrote {out_dir / 'report.json'}, {out_dir / 'report.md'} and {public_file}")
    return selected
