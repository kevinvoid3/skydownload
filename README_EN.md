# Sky: Children of the Light — APK Download History

English | [简体中文](./README.md)

A static web page that automatically tracks and records APK version updates for **Sky: Children of the Light** (Huawei channel builds), making it easy to browse historical versions, download links, and file verification info.

Preview: `index.html` (works together with the `history.json` data file)

[Link](https://kevinvoid3.github.io/skydownload)

## ✨ Features

- **Multi-app support**: tracks both the Global (TGC) and CN (NetEase) Huawei channel packages
- **Historical record keeping**: each version update is appended, never overwritten or deleted
- **Multi-language UI**: built-in support for Simplified Chinese / Traditional Chinese / English / Japanese / Korean, with automatic browser language detection and a manual switcher that remembers your choice
- **File integrity verification**: SHA256 hash provided for every version, so you can verify the downloaded file hasn't been tampered with or corrupted
- **File size formatting**: byte counts are automatically formatted into readable units (KB/MB/GB)
- **One-click hash copy**: copy the SHA256 value with a single click for command-line verification
- **Fully static**: no backend required — the page only depends on a `history.json` data file, making it easy to host on GitHub Pages or any static hosting platform

## 📁 Project Structure

```
.
├── index.html      # Main page (UI, i18n strings, and rendering logic)
└── history.json     # Version update history data (generated periodically by an external script/crawler)
```

## 📄 history.json Data Format

The page supports two data formats:

**New format (recommended): dictionary grouped by package name**

```json
{
  "com.tgc.sky.android.huawei": [
    {
      "timestamp": "2026-07-01 10:00:00",
      "version": "0.30.1",
      "size": 512000000,
      "sha256": "a1b2c3...",
      "downUrl": "https://example.com/xxx.apk"
    }
  ],
  "com.netease.sky.huawei": [
    { "...": "..." }
  ]
}
```

**Legacy format (still supported): a flat array**, treated as Global (TGC) data by default:

```json
[
  {
    "timestamp": "2026-07-01 10:00:00",
    "version": "0.30.1",
    "size": 512000000,
    "sha256": "a1b2c3...",
    "downUrl": "https://example.com/xxx.apk"
  }
]
```

| Field | Description |
|-------|--------------|
| `timestamp` | Update time, displayed in UTC+8 throughout the page |
| `version` | Version number |
| `size` | File size in bytes |
| `sha256` | SHA256 hash of the file |
| `downUrl` | APK download link (from a Huawei CDN mirror) |

## 🚀 Deployment

1. Place `index.html` and `history.json` in the same directory
2. Deploy to any static site host (GitHub Pages, Netlify, Vercel, etc.)
3. Keep `history.json` updated via a scheduled job/crawler script — the page will automatically load the latest data and display it sorted by time, newest first

## 🔎 Automatic APK / DEX Scan

This repository includes a GitHub Actions workflow: `Extract Sky AccessKey`.

- Reads this repository's `history.json` by default
- Uses the global package by default: `com.tgc.sky.android.huawei`
- Downloads the latest APK automatically
- Reads `classes.dex`, `classes2.dex`, and other DEX files from the APK
- Parses the DEX string table
- Scans for `accesskey` / `accessKey` / `AccessKey` strings
- Uploads `report.json` and `report.md` as the `sky-accesskey-report` Actions artifact
- Updates `accesskey.json`
- Commits generated output back to the current repository

GitHub Pages output:

```text
https://kevinvoid3.github.io/skydownload/accesskey.json
```

JSON format:

```json
{
  "version": "0.34.2 (404725)",
  "accesskey": "ACCESS_KEY_VALUE"
}
```

When no value is matched, `accesskey` is `null`. A custom regex can be passed
through the `accesskey_regex` input when manually running the workflow. Capture
group 1 is used as the final value.

Run locally:

```bash
python scripts/extract_accesskey.py
```

Use a specific APK URL:

```bash
APK_URL="https://example.com/app.apk" python scripts/extract_accesskey.py
```

Use custom scan patterns:

```bash
python scripts/extract_accesskey.py \
  --pattern "access[_-]?key" \
  --pattern "AccessKey" \
  --accesskey-regex "accessKey=([A-Za-z0-9_-]+)"
```

## ⚠️ Disclaimer

- Download links on this page come from a Huawei CDN mirror and are intended for **backup and historical reference only**
- Please verify the SHA256 checksum yourself before installing any file
- This project is not affiliated with That Game Company (TGC) or NetEase in any way — it is an independent, third-party historical archive tool

## 🐛 Feedback

For questions, suggestions, or bug reports, please open an issue on the [GitHub project page](https://github.com/kevinvoid3/skydownload/issues), or email [adam105195@gmail.com](mailto:adam105195@gmail.com).

## 📜 License

This project is intended for personal learning and archival purposes only. Commercial use is not permitted.
