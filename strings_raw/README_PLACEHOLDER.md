# strings_raw/（placeholder）

把舊版的**原始字串**（保留 `<1>`、`<b>`、`<heart/>` 等遊戲標記）放在這裡，當作字串 diff 的比對基準。

- 一個語系一個檔，檔名必須是語系代碼：`zh-CN.strings`、`zh-TW.strings`、`default.strings`
  （例：`Localizable.strings` 若是簡中，就改名成 `zh-CN.strings`）。
- 預設只比對 `DIFF_LOCALES` 內的語系（zh-CN、zh-TW、default），其他語系放了也不會讀。
- 格式：`"key" = "value";` 一行一筆（`.json` 的 `{key: value}` 也可以）。
- **如果手上的檔案已經清過標記**（裡面找不到 `<1>`、`<heart/>` 這類東西），不要放這裡：
  放這裡會被當成原始字串，和新版的原始字串比，幾乎每一條都會被報成修改。
  這種情況請把這個資料夾留空，讓程式第一次改用 `strings/` 比對。
- 本說明檔不參與比對；下一次 workflow 跑完會被新版內容取代。
