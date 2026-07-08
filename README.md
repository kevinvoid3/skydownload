# Sky光·遇 APK 下载历史记录

[English](./README_EN_.md) | 简体中文

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
├── index.html      # 主页面（本文件，包含界面、多语言文案与渲染逻辑）
└── history.json     # 版本更新历史数据（由外部脚本/爬虫定期生成）
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

## ⚠️ 免责声明

- 本页面提供的下载链接来自华为 CDN 镜像，仅供**备份与历史版本查阅**使用
- 请在安装前自行核对 SHA256 校验值，确认文件安全性
- 本项目与 That Game Company（TGC）、网易官方无任何关联，仅为第三方历史存档工具

## 🐛 问题反馈

如有问题、建议或错误回报，欢迎前往 [GitHub 项目页面](https://github.com/kevinvoid3/skydownload/issues) 提交 Issue，或发送邮件至 [adam105195@gmail.com](mailto:adam105195@gmail.com)。

## 📜 License

本项目仅用于个人学习与历史存档目的，请勿用于任何商业用途。
