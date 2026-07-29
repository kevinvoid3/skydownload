import json
import struct
import tempfile
import unittest
from pathlib import Path

from scripts import extract_accesskey


def build_static_accesskey_dex(accesskey):
    strings = [
        "Lcom/example/BuildConfig;",
        "SKY_ACCESS_KEY",
        "Ljava/lang/String;",
        accesskey,
    ]
    string_ids_off = 0x70
    type_ids_off = string_ids_off + len(strings) * 4
    field_ids_off = type_ids_off + 2 * 4
    class_defs_off = field_ids_off + 8
    class_data_off = class_defs_off + 32
    class_data = bytes([1, 0, 0, 0, 0, 0x19])
    static_values_off = class_data_off + len(class_data)
    static_values = bytes([1, extract_accesskey.VALUE_STRING, 3])
    string_data_off = static_values_off + len(static_values)

    encoded_strings = []
    for value in strings:
        raw = value.encode("utf-8")
        encoded_strings.append(bytes([len(value)]) + raw + b"\x00")

    size = string_data_off + sum(len(value) for value in encoded_strings)
    dex = bytearray(size)
    dex[:8] = b"dex\n035\x00"
    struct.pack_into("<II", dex, 0x38, len(strings), string_ids_off)
    struct.pack_into("<II", dex, 0x40, 2, type_ids_off)
    struct.pack_into("<II", dex, 0x50, 1, field_ids_off)
    struct.pack_into("<II", dex, 0x60, 1, class_defs_off)

    cursor = string_data_off
    for index, value in enumerate(encoded_strings):
        struct.pack_into("<I", dex, string_ids_off + index * 4, cursor)
        dex[cursor : cursor + len(value)] = value
        cursor += len(value)

    struct.pack_into("<II", dex, type_ids_off, 0, 2)
    struct.pack_into("<HHI", dex, field_ids_off, 0, 1, 1)
    struct.pack_into(
        "<IIIIIIII",
        dex,
        class_defs_off,
        0,
        1,
        0xFFFFFFFF,
        0,
        0xFFFFFFFF,
        0,
        class_data_off,
        static_values_off,
    )
    dex[class_data_off : class_data_off + len(class_data)] = class_data
    dex[static_values_off : static_values_off + len(static_values)] = static_values
    return bytes(dex)


class ExtractAccesskeyTests(unittest.TestCase):
    def test_extracts_and_prioritizes_static_buildconfig_field(self):
        secret = "STATIC_KEY_1234567890"
        dex = build_static_accesskey_dex(secret)

        hits, candidates, string_count = extract_accesskey.scan_dex(
            "classes3.dex",
            dex,
            extract_accesskey.DEFAULT_PATTERNS,
            extract_accesskey.DEFAULT_ACCESSKEY_PATTERNS,
            3,
        )

        self.assertEqual(string_count, 4)
        self.assertEqual(candidates[0]["field"], "SKY_ACCESS_KEY")
        self.assertEqual(candidates[0]["length"], len(secret))
        self.assertEqual(
            candidates[0]["sha256"],
            extract_accesskey.fingerprint(secret),
        )
        self.assertEqual(extract_accesskey.accesskey_candidate_priority(candidates[0]), 0)
        self.assertNotIn(secret, json.dumps(hits))
        self.assertNotIn(secret, json.dumps(candidates))

    def test_public_output_contains_only_candidate_fingerprint(self):
        secret = "STATIC_KEY_1234567890"
        candidate = {
            "dex": "classes3.dex",
            "source": "static-field",
            "class": "Lcom/example/BuildConfig;",
            "field": "SKY_ACCESS_KEY",
            "stringIndex": 3,
            "length": len(secret),
            "sha256": extract_accesskey.fingerprint(secret),
            "redactedStringIndexes": [3],
        }

        with tempfile.TemporaryDirectory() as directory:
            extract_accesskey.write_accesskey_output(
                "1.2.3 (456)",
                candidate,
                Path(directory),
            )
            content = (Path(directory) / "index.json").read_text(encoding="utf-8")
            payload = json.loads(content)

        self.assertNotIn(secret, content)
        self.assertIsNone(payload["accesskey"])
        self.assertEqual(payload["accesskeyCandidate"]["length"], len(secret))
        self.assertEqual(
            payload["accesskeyCandidate"]["sha256"],
            extract_accesskey.fingerprint(secret),
        )


if __name__ == "__main__":
    unittest.main()
