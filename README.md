# Sky光·遇 APK 下载历史记录

[English](./README_EN.md) | 简体中文

一个自动追踪并记录 **Sky: Children of the Light（光·遇）** 华为渠道服 APK 版本更新的静态网页，方便查阅历史版本、下载链接与文件校验信息。

在线预览：`index.html`（配合 `history.json` 数据文件使用）

[連結](https://kevinvoid3.github.io/skydownload)

## ✨ 功能特性

- **多应用支持**：同时追踪国际服（TGC）与国服（网易）两个华为渠道包
- **历史记录留存**：每次版本更新会追加记录，不会覆盖或删除历史数据
- **多语言界面**：内置简体中文 / 繁体中文 / English / 日本語 / 한국어 五种语言，自动根据浏览器语言检测，也可手动切换并记住选择
- **文件完整性校验**：提供每个版本的 SHA256 值，可与下载后的文件进行比对，确认文件未被篡改或损坏
- **文件大小展示**：自动将字节数格式化为可读单位（KB/MB/GB）
- **一键复制哈希值**：点击按钮即可复制 SHA256，方便命令行核对
- **纯静态实现**：无需后端服务，仅依赖一个 `history.json` 数据文件即可运行，方便部署在 GitHub Pages 等静态托管平台

## 📁 项目结构

```
.
├── index.html          # 主页面（本文件，包含界面、多语言文案与渲染逻辑）
├── history.json        # 版本更新历史数据（由外部脚本/爬虫定期生成）
├── strings/            # resources.arsc 字串（已清标记，各语系一档）
├── strings_raw/        # 保留标记的原始字串（diff 用）
├── Resources/          # APK 内 assets/Data/Resources 的 .json / .lua
├── GameScripts/        # APK 内 assets/Data/Scripts 的 .lua / .luac（不叫 Scripts/：Windows 不分大小写，会和 scripts/ 撞名）
├── archive/            # 各版本备份：Resources/、Scripts/、Strings/ 下各放 <种类>_YYYY-MM-DD/
├── md/                 # 每次版本更新的差异报告（<时间戳>_tgc.md / <时间戳>_netease.md）与 index.json
├── worker/accesskey/    # 读取 accesskey 的 Cloudflare Worker（Workers KV + 个人 token）
└── scripts/
    ├── sky_extract.py  # 唯一入口（run / diff / accesskey / strings / arsc）
    └── skylib/         # 依类别拆分的实现：apk、dex、arsc、resources、diff、report
```

## 📄 history.json 数据格式

页面兼容两种数据格式：

**新版（推荐）：按包名分组的字典格式**

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

**旧版（兼容）：单一数组格式**，将被默认视为国际服（TGC）数据：

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

| 字段 | 说明 |
|------|------|
| `timestamp` | 更新时间，页面统一以 UTC+8 显示 |
| `version` | 版本号 |
| `size` | 文件大小（字节） |
| `sha256` | 文件的 SHA256 哈希值 |
| `downUrl` | APK 下载链接（来自华为 CDN 镜像） |

## 🚀 部署方式

1. 将 `index.html` 与 `history.json` 放在同一目录下
2. 部署到任意静态网页托管服务（GitHub Pages、Netlify、Vercel 等均可）
3. 通过定时任务/爬虫脚本持续更新 `history.json`，页面会自动读取最新数据并按时间倒序展示

## 🔎 自动拆 APK / 资源 diff

仓库内置 GitHub Actions：`Extract Sky APK data and diff`（`.github/workflows/extract-data.yml`）。

- `deploy.yml` 跑完后自动接着运行（`workflow_run`），国际服、国服依序各跑一次；手动 push `history.json` 也会触发
- 手动运行（Run workflow）可勾选 `tgc` / `netease`（默认两个都勾）；指定 `apk_url` 时只能勾一个服
- 下载 APK 遇到超时、断线会重试最多 5 次并断点续传；403/404/410 视为链接失效，不重试
- 读取 `history.json` 最新记录；只处理比仓库基准**更新**的版本：相同版本在下载 APK 之前就跳过（手动运行可勾选 `force`），比基准旧的版本（例如手动放了其他渠道的新版基准、华为还没更新）一律跳过，不会用旧版覆盖基准
- 下载 APK 并核对 SHA256，一次下载产出以下全部内容：

| 输出 | 内容 |
|------|------|
| accesskey（**不进 git**） | 解析 DEX（string table、static fields），优先识别 `BuildConfig.SKY_ACCESS_KEY`；只写入 Workers KV，经 `worker/accesskey/` 的 Worker 加个人 token 读取 |
| `strings/<语系>.strings` | `resources.arsc` 全部语系字串，已清除游戏内嵌标记，供其他仓库引用 |
| `strings_raw/<语系>.strings` | 保留标记的原始字串（只存 `DIFF_LOCALES`），给 diff 用 |
| `Resources/` | APK 内 `assets/Data/Resources` 的 `.json` / `.lua` |
| `GameScripts/` | APK 内 `assets/Data/Scripts` 的全部文件（`.lua` 源码与 `.luac` 字节码） |
| `archive/<种类>/<种类>_YYYY-MM-DD/`（种类：Resources、Scripts、Strings） | 每个版本的备份（以运行日期命名，不参与比对） |
| `md/<时间戳>_<服>.md` | 与仓库原有 `strings_raw/`、`Resources/` 的差异报告；`md/index.json` 为清单 |

差异报告的比对方式：

- 字串：以 key 比对新增／删除／修改，第一个语系完整展开，其余收合
- JSON 定义档（`OutfitDefs.json` 等）：以 `name` / `id` 配对条目，逐栏位列出变动
- 行为树（`BehaviorTrees/*.json`）：以节点 `instanceID` 配对，忽略编辑器座标
- Lua 定义档（`MeshDefs.lua` 等）：以 `resource "类型" "名称"` 配对，逐栏位比对，忽略对齐空白；`UIPackedAtlas.lua` 的 atlas 重排只计数
- Scripts：`.lua` 逐行 diff；`.luac` 比对 sha256／大小与可读字串的增减；单行清单（`Bin/AllLevelList.lua`）比对增删项目；`X.lua` 与 `X.lua.luac` 只变一边时会警告

本地运行（Python 3.12+，无第三方依赖）：

```bash
python scripts/sky_extract.py run                       # 完整流程，与 Actions 相同
APK_URL="https://example.com/app.apk" python scripts/sky_extract.py run
python scripts/sky_extract.py diff \
  --old-resources Resources_old.zip --new-resources app.apk \
  --old-strings zh-CN=old.strings --new-strings app.apk --locale zh-CN
python scripts/sky_extract.py accesskey app.apk         # 只扫 DEX
python scripts/sky_extract.py strings app.apk           # 只产 strings/
python scripts/sky_extract.py arsc app.apk --grep http  # arsc 原始倾印
```

程序位于 `scripts/skylib/`，依类别拆分：`apk`（下载／校验）、`dex`、`arsc`、`resources`、`diff`、`report`。

accesskey 不再通过 GitHub Pages 公开，改存 Workers KV（国际服 `accesskey/`、国服 `accesskey/netease/`，各有 `latest.json` 与 `<版本>.json`；Workers 免费方案即可，不需信用卡），
需要带个人 token 通过 Worker 读取，设置方式见 [`worker/accesskey/README.md`](worker/accesskey/README.md)：

```bash
curl -H "Authorization: Bearer <token>" https://skydownload-accesskey.<子域>.workers.dev/accesskey.json
```

浏览器也可以：打开 `/login` 贴一次 token，之后直接开 `/accesskey.json`（cookie 400 天，有在用会自动续期）（需先设 `SESSION_KEY`，见 `worker/accesskey/README.md`）。

`/accesskey.json` 同时返回两服（还没有值的服为 `null`）：

```json
{
  "tgc":     { "version": "0.35.5 (431758)", "accesskey": "TGC_ACCESS_KEY_VALUE" },
  "netease": { "version": "0.16.8",          "accesskey": "NETEASE_ACCESS_KEY_VALUE" }
}
```

指定版本：`/accesskey/0.35.5_431758.json`（国际服）、`/netease/accesskey/0.16.8.json`（国服），格式为单服的 `{"version", "accesskey"}`。

没有匹配到值时不会上传（KV 里保留上一个版本）。手动运行时可以通过 `accesskey_regex` 提供自定义正则，捕获组 1 作为候选值。

## ⚠️ 免责声明

- 本页面提供的下载链接来自华为 CDN 镜像，仅供**备份与历史版本查阅**使用
- 请在安装前自行核对 SHA256 校验值，确认文件安全性
- 本项目与 That Game Company（TGC）、网易官方无任何关联，仅为第三方历史存档工具

## 🐛 问题反馈

如有问题、建议或错误回报，欢迎前往 [GitHub 项目页面](https://github.com/kevinvoid3/skydownload/issues) 提交 Issue，或发送邮件至 [adam105195@gmail.com](mailto:adam105195@gmail.com)。

## 📜 License

本项目仅用于个人学习与历史存档目的，请勿用于任何商业用途。
