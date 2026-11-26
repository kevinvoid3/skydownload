# archive/

各版本的備份，**不參與比對**（比對永遠是 repo 根目錄的 `Resources/`、`GameScripts/`、`strings_raw/` 對當下 APK）。

```
archive/
├── Resources/
│   ├── Resources_2026-10-23/     # assets/Data/Resources 的 .json / .lua，結構同 Resources/
│   └── Resources_2026-11-26/
├── Scripts/
│   ├── Scripts_2026-10-23/       # assets/Data/Scripts 的 .lua / .luac，結構同 GameScripts/
│   └── Scripts_2026-11-26/
└── Strings/
    └── Strings_2026-11-26/       # 原始字串（保留標記），zh-CN / zh-TW / default
```

- 日期是 workflow 執行當天（台灣時間）。**既有備份絕不覆蓋**：當天已有內容相同的就沿用；內容不同（例如手動放的其他版本、同一天出了兩個版本）就另存成 `_2`、`_3`…
- 資料夾名稱保留種類前綴（`Resources_…`），跟手動備份的 `Resources_2026-10-23.zip` 一致：
  解壓後的資料夾直接放進對應的子資料夾即可，不用改名。
- `archive/Scripts/` 和根目錄的 `scripts/`（程式碼）位置不同，不會因為 Windows 不分大小寫而衝突。
- 國服在 `archive_com.netease.sky.huawei/`，結構相同。
