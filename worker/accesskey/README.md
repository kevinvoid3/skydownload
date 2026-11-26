# accesskey Worker

accesskey 不放在 GitHub，只存在 **Workers KV**（Workers 免費方案就有，不需要信用卡）。
朋友透過這個 Worker、帶上自己的 token 讀取。

```
GitHub Actions ──Cloudflare API（PUT）──▶ Workers KV：accesskey/latest.json、accesskey/<版本>.json
                                              ▲
朋友 ──Bearer token──▶ Worker ────────────────┘（KV binding，Worker 內不放任何 API 金鑰）
```

免費額度：每天讀取 100,000 次、寫入 1,000 次（UTC 00:00 重置），超過只會失敗、不會收費。
每個版本只寫 2 次；Worker 先驗證 token 才讀 KV，被拒絕的請求不吃讀取額度。

以下指令都在 `worker/accesskey/` 執行（PowerShell）。需要先裝 Node.js（LTS）。

## 一次性設定

### 1. 登入並建立 KV namespace

```powershell
npx wrangler login
npx wrangler kv namespace create accesskey
```

把印出來的 `id` 填進 `wrangler.toml` 的 `[[kv_namespaces]]` → `id`。

### 2. 部署 Worker

```powershell
npx wrangler deploy        # 完成後印出 https://skydownload-accesskey.<子網域>.workers.dev
```

### 3. 給 GitHub Actions 的 Cloudflare API token（只能寫 KV）

Cloudflare 後台右上角頭像 → **My Profile → API Tokens → Create Token → Create Custom Token**：

- Permissions：**Account → Workers KV Storage → Edit**（只要這一項）
- Account Resources：只選你自己的帳號
- TTL：視需要設定

建立後 token 只顯示一次。放進 GitHub repo → Settings → Secrets and variables → Actions：

| Secret | 值 |
|---|---|
| `CF_API_TOKEN` | 剛建的 API token |
| `CF_ACCOUNT_ID` | Cloudflare 帳號 ID（Workers 頁面右側，或 `npx wrangler whoami`） |
| `CF_KV_NAMESPACE_ID` | 第 1 步的 namespace id |

沒設這三個 secret 時，workflow 只會出現警告並略過上傳，不會失敗。

### 4. 發 token 給朋友

```powershell
python token.py new friend-a                                           # 印出 token（只顯示一次）
Get-Content tokens.hashes.json -Raw | npx wrangler secret put TOKENS   # bash / cmd：... < tokens.hashes.json
```

token 用私訊交給本人。`tokens.hashes.json` 只有雜湊，但一樣不要 commit（已在 .gitignore）。

撤銷：

```powershell
python token.py revoke friend-a
Get-Content tokens.hashes.json -Raw | npx wrangler secret put TOKENS
```

## 先手動放一份測試

workflow 只在處理新版本時才上傳。想先測 Worker：

```powershell
'{"version":"test","accesskey":"TEST"}' | Set-Content ..\..\work\test.json -Encoding ascii
npx wrangler kv key put --binding KV "accesskey/latest.json" --path ..\..\work\test.json --remote
curl.exe -H "Authorization: Bearer <token>" https://skydownload-accesskey.<子網域>.workers.dev/accesskey.json
```

```
npx wrangler kv key put --binding KV "accesskey/latest.json" --path ../../work/test.json --remote
```

`--remote` 一定要加：wrangler v4 預設只寫本機模擬環境。

## 朋友怎麼讀

```bash
curl -H "Authorization: Bearer <token>" https://skydownload-accesskey.<子網域>.workers.dev/accesskey.json
# 指定版本
curl -H "Authorization: Bearer <token>" https://.../accesskey/0.35.5_431758.json
```

```python
import json, urllib.request
req = urllib.request.Request(URL, headers={"Authorization": "Bearer " + TOKEN})
accesskey = json.load(urllib.request.urlopen(req))["accesskey"]
```

token 請放在伺服器端或本機腳本；**不要寫進網頁前端**（任何人打開開發者工具都看得到）。

## 行為

| 請求 | 回應 |
|---|---|
| 有效 token，`/accesskey.json` 或 `/accesskey/<版本>.json` | 200，JSON，`Cache-Control: no-store` |
| 沒帶 token、token 錯、名稱不存在、已撤銷 | 401（不區分原因） |
| 其他路徑、不存在的版本 | 404 |
| GET / HEAD 以外的方法 | 405 |

- Worker 只存 token 的 SHA-256；比對用 `crypto.subtle.timingSafeEqual`，名稱不存在時也照樣比一次。
- 每次讀取與拒絕都會留下 `accesskey_read` / `accesskey_denied` 紀錄（名稱、路徑、IP），
  在後台 Workers → skydownload-accesskey → Logs 查。
- KV 是最終一致（eventually consistent）：新版寫入後，各地可能要一分鐘左右才讀得到新值。
- 本機測試：`.dev.vars` 寫 `TOKENS='{"friend-a":"<hash>"}'`，
  `npx wrangler kv key put --binding KV "accesskey/latest.json" --path <檔案> --local`，
  再 `npx wrangler dev --local`。
