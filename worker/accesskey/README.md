# accesskey Worker

accesskey 不放在 GitHub，只存在 **Workers KV**（Workers 免費方案就有，不需要信用卡）。
朋友透過這個 Worker、帶上自己的 token 讀取。

```
GitHub Actions ──Cloudflare API（PUT）──▶ Workers KV：國際服 accesskey/latest.json、accesskey/<版本>.json
（國際服、國服各自一次 run）                            國服   accesskey/netease/latest.json、accesskey/netease/<版本>.json
                                              ▲
朋友 ──Bearer token 或瀏覽器登入 cookie──▶ Worker ─┘（KV binding，Worker 內不放任何 API 金鑰）
```

兩服各寫各的 key，不會互相覆蓋；`/accesskey.json` 是 Worker 讀取時把兩邊的 latest 合併出來的。

免費額度：每天讀取 100,000 次、寫入 1,000 次（UTC 00:00 重置），超過只會失敗、不會收費。
每個版本只寫 2 次；每次讀 `/accesskey.json` 用 2 次讀取（兩服各一）。Worker 先驗證 token 才讀 KV，被拒絕的請求不吃讀取額度。

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

可以先連續 `new` 好幾個名稱，最後只上傳一次 `TOKENS`（每次上傳都是整份覆蓋）。

撤銷：

```powershell
python token.py revoke friend-a
Get-Content tokens.hashes.json -Raw | npx wrangler secret put TOKENS
```

### 5. 開啟瀏覽器登入（選用）

讓朋友用瀏覽器開網址、貼一次 token，之後直接開 `/accesskey.json` 就好。
cookie 有效 400 天（Chrome / Edge 的上限），而且發出超過一天後再讀取就會自動續期，
所以只要 400 天內有開過一次，就等於永久登入。

```powershell
python token.py session-key                 # 印出一串隨機值（只顯示一次）
npx wrangler secret put SESSION_KEY          # 貼上剛剛那串
```

- 沒設 `SESSION_KEY` 時 `/login` 回 503，Bearer 照常可用。
- 換掉 `SESSION_KEY` = 所有人的瀏覽器登入一起失效（token 不受影響）。
- 想縮短登入有效期：`wrangler.toml` 加 `[vars]` → `SESSION_MAX_AGE = "604800"`（秒；預設也是上限 400 天，設更大會被截斷）。
  這是「多久沒用就失效」，有在用一樣會續期。
- 想強制所有人重新登入：換掉 `SESSION_KEY`；只踢一個人：`token.py revoke` 或換他的 token。

## 先手動放一份測試

workflow 只在處理新版本時才上傳。想先測 Worker：

```powershell
New-Item -ItemType Directory -Force ..\..\work | Out-Null     # work\ 在 .gitignore 裡，剛 clone 時不存在
'{"version":"test","accesskey":"TEST"}' | Set-Content ..\..\work\test.json -Encoding ascii
npx wrangler kv key put --binding KV "accesskey/latest.json" --path ..\..\work\test.json --remote
curl.exe -H "Authorization: Bearer <token>" https://skydownload-accesskey.<子網域>.workers.dev/accesskey.json
```

`--remote` 一定要加：wrangler v4 預設只寫本機模擬環境。

測完刪掉假資料（不然在真的 key 上傳前，朋友會讀到 `TEST`）：

```powershell
npx wrangler kv key delete --binding KV "accesskey/latest.json" --remote
```

## 朋友怎麼讀

```bash
curl -H "Authorization: Bearer <token>" https://skydownload-accesskey.<子網域>.workers.dev/accesskey.json
# 指定版本（單服格式 {"version", "accesskey"}）
curl -H "Authorization: Bearer <token>" https://.../accesskey/0.35.5_431758.json          # 國際服
curl -H "Authorization: Bearer <token>" https://.../netease/accesskey/0.16.8.json         # 國服
```

`/accesskey.json` 回傳（某服還沒有值就是 `null`）：

```json
{
  "tgc":     { "version": "0.35.5 (431758)", "accesskey": "TGC_ACCESS_KEY_VALUE" },
  "netease": { "version": "0.16.8",          "accesskey": "NETEASE_ACCESS_KEY_VALUE" }
}
```

瀏覽器：開 `https://skydownload-accesskey.<子網域>.workers.dev/login`，貼上 token 登入，
會跳到 `/accesskey.json`。之後直接開網址即可；登出在 `/login` 頁面按「登出」。

```python
import json, urllib.request
req = urllib.request.Request(URL, headers={"Authorization": "Bearer " + TOKEN})
data = json.load(urllib.request.urlopen(req))
tgc_key = data["tgc"]["accesskey"] if data["tgc"] else None
netease_key = data["netease"]["accesskey"] if data["netease"] else None
```

token 請放在伺服器端或本機腳本；**不要寫進網頁前端**（任何人打開開發者工具都看得到）。

## 行為

| 請求 | 回應 |
|---|---|
| 有效 token 或登入 cookie，`/accesskey.json`（兩服合併）、`/accesskey/<版本>.json`、`/netease/accesskey/<版本>.json` | 200，JSON，`Cache-Control: no-store` |
| `/accesskey.json` 但兩服都還沒有值 | 404 |
| 沒帶 token、token 錯、名稱不存在、已撤銷 | 401（不區分原因） |
| 同上但是瀏覽器開的（`Accept: text/html`）且有設 `SESSION_KEY` | 303 轉到 `/login` |
| `GET /login` / `POST /login`（表單欄位 `token`）/ `POST /logout` | 登入頁 / 303 + 設 cookie / 303 + 清 cookie |
| 其他網站送來的 POST（`Origin` 不同） | 403 |
| `http://` | 301 轉 `https://` |
| 其他路徑、不存在的版本 | 404 |
| GET / HEAD 以外的方法 | 405 |

- 登入 cookie 是 `__Host-ak`（`Secure; HttpOnly; SameSite=Strict`），內容是「名稱、到期時間、token 雜湊前 16 碼」
  加上 `SESSION_KEY` 的 HMAC-SHA256 簽章。Worker 不存 session：竄改或過期就驗不過；
  `token.py revoke`／換新 token 後，舊 cookie 立刻失效（雜湊對不上）。
- 被偷的 cookie 在到期前跟 token 一樣好用。共用電腦用完記得按登出。
- Worker 只存 token 的 SHA-256；比對用 `crypto.subtle.timingSafeEqual`，名稱不存在時也照樣比一次。
- 每次讀取、拒絕、登入都會留下 `accesskey_read`（含 `via`: bearer/cookie）/ `accesskey_denied` /
  `login_ok` / `login_failed` 紀錄（名稱、路徑、IP），
  在後台 Workers → skydownload-accesskey → Logs 查。
- KV 是最終一致（eventually consistent）：新版寫入後，各地可能要一分鐘左右才讀得到新值。
- 本機測試：`.dev.vars` 寫 `TOKENS='{"friend-a":"<hash>"}'` 和 `SESSION_KEY=<隨機值>`，
  `npx wrangler kv key put --binding KV "accesskey/latest.json" --path <檔案> --local`，
  再 `npx wrangler dev --local`。`http://127.0.0.1` / `localhost` 不會被轉 https，
  但瀏覽器對 `__Host-` + `Secure` cookie 的處理在 http 上不一定一致，用 curl 測比較準。
