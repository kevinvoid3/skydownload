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
├── index.html          # Main page (UI, i18n strings, and rendering logic)
├── history.json        # Version update history data (generated periodically by an external script/crawler)
├── strings/            # resources.arsc strings, markup removed, one file per locale
├── strings_raw/        # raw strings with markup kept (for diffing)
├── Resources/          # .json / .lua from assets/Data/Resources
├── GameScripts/        # .lua / .luac from assets/Data/Scripts (not Scripts/: it would collide with scripts/ on case-insensitive Windows)
├── archive/            # per-version backups: Resources/, Scripts/, Strings/ each holding <Kind>_YYYY-MM-DD/
├── md/                 # per-update diff reports (<timestamp>_tgc.md / <timestamp>_netease.md) and index.json
├── worker/accesskey/    # Cloudflare Worker serving the accesskey (Workers KV + personal tokens)
└── scripts/
    ├── sky_extract.py  # single entry point (run / diff / accesskey / strings / arsc)
    └── skylib/         # implementation split by category: apk, dex, arsc, resources, diff, report
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

## 🔎 Automatic APK Extraction / Resource Diff

This repository includes a GitHub Actions workflow: `Extract Sky APK data and diff` (`.github/workflows/extract-data.yml`).

- Runs automatically after `deploy.yml` finishes (`workflow_run`), once for the global server and then once for the China server; pushing `history.json` by hand also triggers it
- When run manually (Run workflow), tick `tgc` and/or `netease` (both by default); `apk_url` can only be used with a single server
- APK downloads retry up to 5 times on timeouts or dropped connections and resume where they stopped; 403/404/410 mean the link is dead and are not retried
- Reads the latest `history.json` record and only processes versions **newer** than the repo baseline: the same version exits before downloading (tick `force` to rerun), and an older one (e.g. a newer baseline added by hand from another channel before Huawei updates) is always skipped so it never overwrites the baseline
- Downloads the APK once, verifies SHA256, and produces:

| Output | Content |
|------|------|
| accesskey (**not in git**) | DEX scan (string table, static fields), prefers `BuildConfig.SKY_ACCESS_KEY`; written only to Workers KV and read through the `worker/accesskey/` Worker with a personal token |
| `strings/<locale>.strings` | All `resources.arsc` locales with in-game markup removed, for other repos |
| `strings_raw/<locale>.strings` | Raw strings with markup kept (only `DIFF_LOCALES`), used for diffing |
| `Resources/` | `.json` / `.lua` files from `assets/Data/Resources` inside the APK |
| `GameScripts/` | All files from `assets/Data/Scripts` (`.lua` sources and `.luac` bytecode) |
| `archive/<Kind>/<Kind>_YYYY-MM-DD/` (Kind: Resources, Scripts, Strings) | Per-version backups named by run date (not used for diffing) |
| `md/<timestamp>_<server>.md` | Diff against the repo's existing `strings_raw/` and `Resources/`; `md/index.json` lists all reports |

Run locally (Python 3.12+, standard library only):

```bash
python scripts/sky_extract.py run
python scripts/sky_extract.py diff --old-resources Resources_old.zip --new-resources app.apk
python scripts/sky_extract.py accesskey app.apk
python scripts/sky_extract.py strings app.apk
python scripts/sky_extract.py arsc app.apk --grep http
```

Code lives in `scripts/skylib/`, split by category: `apk`, `dex`, `arsc`, `resources`, `diff`, `report`.

The accesskey is no longer published on GitHub Pages. It is stored in Workers KV (free Workers plan, no credit card needed)
(global under `accesskey/`, China under `accesskey/netease/`, each with `latest.json` and `<version>.json`) and read through a Worker with a personal token;
see [`worker/accesskey/README.md`](worker/accesskey/README.md).

```bash
curl -H "Authorization: Bearer <token>" https://skydownload-accesskey.<subdomain>.workers.dev/accesskey.json
```

`/accesskey.json` returns both servers (`null` for a server with no value yet):

```json
{
  "tgc":     { "version": "0.35.5 (431758)", "accesskey": "TGC_ACCESS_KEY_VALUE" },
  "netease": { "version": "0.16.8",          "accesskey": "NETEASE_ACCESS_KEY_VALUE" }
}
```

A specific version: `/accesskey/0.35.5_431758.json` (global) or `/netease/accesskey/0.16.8.json` (China), each a single `{"version", "accesskey"}` object.

In a browser, open `/login`, paste the token once, and `/accesskey.json` opens directly from then on (400-day cookie, renewed automatically while in use) (requires `SESSION_KEY`, see `worker/accesskey/README.md`).

When no value is matched nothing is uploaded (the previous version stays in KV). A custom regex can be passed through the `accesskey_regex` input when manually running the workflow; capture group 1 is used.

## ⚠️ Disclaimer

- Download links on this page come from a Huawei CDN mirror and are intended for **backup and historical reference only**
- Please verify the SHA256 checksum yourself before installing any file
- This project is not affiliated with That Game Company (TGC) or NetEase in any way — it is an independent, third-party historical archive tool

## 🐛 Feedback

For questions, suggestions, or bug reports, please open an issue on the [GitHub project page](https://github.com/kevinvoid3/skydownload/issues), or email [adam105195@gmail.com](mailto:adam105195@gmail.com).

## 📜 License

This project is intended for personal learning and archival purposes only. Commercial use is not permitted.
