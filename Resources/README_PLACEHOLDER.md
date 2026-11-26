# Resources/（placeholder）

把舊版 APK 的 `assets/Data/Resources` 內容放在這裡，當作第一次 diff 的比對基準。

- 直接放檔案，不要多包一層資料夾：
  `Resources/OutfitDefs.json`、`Resources/BehaviorTrees/NPC_DailyQuestGiver.json` …
- 只會讀 `.json` 與 `.lua`，其他檔案（包含本說明檔）不參與比對。
- 下一次 workflow 跑完，整個資料夾會被新版內容覆蓋，本說明檔也會一起消失。
