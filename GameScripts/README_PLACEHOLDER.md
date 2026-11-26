# GameScripts/（placeholder）

把舊版 APK 的 `assets/Data/Scripts` 內容放在這裡，當作第一次 diff 的比對基準。

- 直接放檔案，不要多包一層資料夾：`GameScripts/LoadLevel.lua`、`GameScripts/LoadLevel.lua.luac`、`GameScripts/Bin/AllLevelList.lua` …
- `.lua` 與 `.luac` 都要放（全部檔案都會比對；本說明檔除外）。
- 資料夾不叫 `Scripts/`：Windows 不分大小寫，會和放程式碼的 `scripts/` 撞名。
- 下一次 workflow 跑完，整個資料夾會被新版內容覆蓋，本說明檔也會一起消失。
