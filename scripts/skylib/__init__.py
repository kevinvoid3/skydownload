"""
skylib：《光·遇》APK 拆解工具組（零依賴，純標準庫）。

依類別分模組：
  apk        取得 APK：讀 history.json、下載、sha256、zip 讀取、版本字串處理
  dex        DEX 解析與 accesskey 抽取
  arsc       resources.arsc 解析、字串清標記、輸出 strings/
  resources  在 APK 內定位 Data/Resources、建立／讀取快照（snapshot）
  diff       兩份快照的差異比對（字串、JSON 定義檔、行為樹、Lua 定義檔）
  report     差異結果輸出成 Markdown
"""
