/**
 * accesskey Worker：從 Workers KV 讀 accesskey，只回給持有個人 token 的人。
 * （KV 在 Workers 免費方案就有，不需要綁信用卡；R2 需要。）
 *
 * 路由：
 *   GET/HEAD /accesskey.json                 -> 兩服合併：{"tgc": <國際服 latest>, "netease": <國服 latest>}
 *                                               讀 KV accesskey/latest.json 與 accesskey/netease/latest.json；
 *                                               某服還沒有值就是 null
 *   GET/HEAD /accesskey/<版本>.json          -> KV key: accesskey/<版本>.json             國際服指定版本，例：/accesskey/0.35.5_431758.json
 *   GET/HEAD /netease/accesskey/<版本>.json  -> KV key: accesskey/netease/<版本>.json     國服指定版本，例：/netease/accesskey/0.16.8.json
 *   各服的 KV key 分開寫，兩個 workflow run 不會互相覆蓋；合併只在讀取時做。
 *   GET      /login                  登入頁（瀏覽器用）
 *   POST     /login                  驗證 token，成功就發 cookie
 *   POST     /logout                 清掉 cookie
 *
 * 兩種驗證方式（都要有效的個人 token）：
 *   1. 腳本：Authorization: Bearer <名稱>.<密鑰>
 *   2. 瀏覽器：在 /login 輸入一次 token，之後靠 cookie（400 天，有在用會自動續期）
 *
 * token：env.TOKENS（wrangler secret）是 JSON {"<名稱>": "<整串 token 的 SHA-256 hex>"}。
 *   Worker 只存雜湊；比對用 crypto.subtle.timingSafeEqual，名稱不存在時也照樣比一次。
 *
 * cookie：v1.<名稱>.<到期 unix 秒>.<token 雜湊前 16 字>.<HMAC-SHA256(SESSION_KEY)>
 *   - 無狀態：Worker 不存 session，只驗簽章與到期時間
 *   - 含 token 指紋：revoke 或換掉某人的 token，他的 cookie 立刻失效
 *   - 換掉 SESSION_KEY：所有人一起登出
 */

const NAME_RE = /^[a-z0-9][a-z0-9-]{0,31}$/;
const SECRET_RE = /^[A-Za-z0-9_-]{32,128}$/;
const SLUG_RE = /^[0-9A-Za-z._-]{1,64}$/;
// 伺服器 → KV key 前綴（與 extract-data.yml 的 KV_PREFIX 對應）
const SERVERS = { tgc: "accesskey/", netease: "accesskey/netease/" };
const DUMMY_HASH = new Uint8Array(32); // 名稱不存在時拿來比對的假雜湊
const COOKIE = "__Host-ak";            // __Host- 前綴：強制 Secure、Path=/、不能指定 Domain
// Chrome / Edge 會把 cookie 壽命截在 400 天，設更久也沒用，所以上限就是 400 天。
const MAX_COOKIE_AGE = 400 * 24 * 3600;
const DEFAULT_MAX_AGE = MAX_COOKIE_AGE;
// 滑動續期：cookie 發出超過這麼久，下次讀取時就重簽一張新的（有在用就永遠不會過期）
const RENEW_AFTER = 24 * 3600;
const enc = new TextEncoder();

const BASE_HEADERS = {
  "Cache-Control": "no-store",
  "X-Content-Type-Options": "nosniff",
  "Referrer-Policy": "no-referrer",
};
const HTML_HEADERS = {
  "Content-Type": "text/html; charset=utf-8",
  "Content-Security-Policy":
    "default-src 'none'; style-src 'unsafe-inline'; form-action 'self'; frame-ancestors 'none'; base-uri 'none'",
  "X-Frame-Options": "DENY",
};

function isLocal(url) {
  return ["localhost", "127.0.0.1", "[::1]"].includes(url.hostname);
}

function reply(status, body, extra = {}, url = null) {
  const headers = { ...BASE_HEADERS, ...extra };
  if (url && url.protocol === "https:") {
    headers["Strict-Transport-Security"] = "max-age=31536000";
  }
  return new Response(body, { status, headers });
}

// ---------------------------------------------------------------- token
function hexToBytes(hex) {
  if (typeof hex !== "string" || !/^[0-9a-f]{64}$/i.test(hex)) return null;
  const out = new Uint8Array(32);
  for (let i = 0; i < 32; i++) out[i] = parseInt(hex.slice(i * 2, i * 2 + 2), 16);
  return out;
}

let tokenCache = null; // 同一個 isolate 內只解析一次
function loadTokens(env) {
  if (tokenCache) return tokenCache;
  const map = new Map();
  try {
    const raw = JSON.parse(env.TOKENS || "{}");
    for (const [name, hex] of Object.entries(raw)) {
      const bytes = hexToBytes(hex);
      if (NAME_RE.test(name) && bytes) map.set(name, { bytes, hex: hex.toLowerCase() });
    }
  } catch {
    // TOKENS 格式錯誤：當作沒有任何 token
  }
  tokenCache = map;
  return map;
}

/** 驗證一整串 token，成功回傳名稱，失敗回傳 null。 */
async function verifyToken(token, env) {
  token = (token || "").trim();
  const dot = token.indexOf(".");
  const name = dot > 0 ? token.slice(0, dot) : "";
  const secret = dot > 0 ? token.slice(dot + 1) : "";
  const wellFormed = NAME_RE.test(name) && SECRET_RE.test(secret);
  const digest = new Uint8Array(await crypto.subtle.digest("SHA-256", enc.encode(token)));
  const entry = wellFormed ? loadTokens(env).get(name) : undefined;
  const equal = crypto.subtle.timingSafeEqual(digest, entry ? entry.bytes : DUMMY_HASH);
  return wellFormed && entry && equal ? name : null;
}

// ---------------------------------------------------------------- cookie session
function b64url(buf) {
  let s = "";
  for (const b of new Uint8Array(buf)) s += String.fromCharCode(b);
  return btoa(s).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");
}

async function hmac(env, msg) {
  const key = await crypto.subtle.importKey(
    "raw", enc.encode(env.SESSION_KEY), { name: "HMAC", hash: "SHA-256" }, false, ["sign"]);
  return b64url(await crypto.subtle.sign("HMAC", key, enc.encode(msg)));
}

function maxAge(env) {
  const n = parseInt(env.SESSION_MAX_AGE || "", 10);
  return Number.isFinite(n) && n > 0 ? Math.min(n, MAX_COOKIE_AGE) : DEFAULT_MAX_AGE;
}

async function makeSession(name, env) {
  const exp = Math.floor(Date.now() / 1000) + maxAge(env);
  const fp = loadTokens(env).get(name).hex.slice(0, 16);
  const body = `v1.${name}.${exp}.${fp}`;
  return `${body}.${await hmac(env, body)}`;
}

function getCookie(request, name) {
  const header = request.headers.get("Cookie") || "";
  for (const part of header.split(";")) {
    const i = part.indexOf("=");
    if (i > 0 && part.slice(0, i).trim() === name) return part.slice(i + 1).trim();
  }
  return null;
}

/** 驗證 cookie，成功回傳 {name, exp}，失敗回傳 null。 */
async function verifySession(request, env) {
  if (!env.SESSION_KEY) return null;
  const v = getCookie(request, COOKIE);
  if (!v) return null;
  const parts = v.split(".");
  if (parts.length !== 5 || parts[0] !== "v1") return null;
  const [, name, expStr, fp, sig] = parts;
  const exp = parseInt(expStr, 10);
  const entry = NAME_RE.test(name) ? loadTokens(env).get(name) : undefined;
  const expected = await hmac(env, `v1.${name}.${expStr}.${fp}`);
  const a = enc.encode(sig), b = enc.encode(expected);
  const sigOk = a.length === b.length ? crypto.subtle.timingSafeEqual(a, b)
                                      : !crypto.subtle.timingSafeEqual(b, b);
  if (!sigOk || !entry) return null;
  if (!Number.isFinite(exp) || exp < Date.now() / 1000) return null;   // 過期
  if (entry.hex.slice(0, 16) !== fp) return null;                       // token 已被換掉或撤銷後重建
  return { name, exp };
}

function sessionCookie(value, env) {
  return `${COOKIE}=${value}; Max-Age=${maxAge(env)}; Path=/; Secure; HttpOnly; SameSite=Strict`;
}
const CLEAR_COOKIE = `${COOKIE}=; Max-Age=0; Path=/; Secure; HttpOnly; SameSite=Strict`;

/** Bearer 或 cookie，回傳 {who, via} 或 null。 */
async function authenticate(request, env) {
  const m = /^Bearer\s+(\S+)$/.exec(request.headers.get("Authorization") || "");
  if (m) {
    const who = await verifyToken(m[1], env);
    return who ? { who, via: "bearer" } : null;
  }
  const s = await verifySession(request, env);
  if (!s) return null;
  // 發出超過 RENEW_AFTER 就續期；同一天內重複讀取不會每次都重簽
  const renew = s.exp - Date.now() / 1000 < maxAge(env) - RENEW_AFTER;
  return { who: s.name, via: "cookie", renew };
}

// ---------------------------------------------------------------- 頁面
function esc(s) {
  return String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
}

function page(title, inner) {
  return `<!doctype html><html lang="zh-Hant"><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1"><title>${esc(title)}</title>
<style>body{font:16px system-ui,sans-serif;max-width:28rem;margin:4rem auto;padding:0 1rem}
input,button{font:inherit;padding:.5rem;width:100%;box-sizing:border-box;margin:.25rem 0}
.err{color:#b00}a{color:inherit}</style>
<h1>${esc(title)}</h1>${inner}</html>`;
}

function loginPage(msg = "") {
  return page("accesskey 登入", `
${msg ? `<p class="err">${esc(msg)}</p>` : ""}
<form method="post" action="/login">
  <label>token<input type="password" name="token" autocomplete="current-password" required autofocus></label>
  <button type="submit">登入</button>
</form>`);
}

function loggedInPage(who) {
  return page("已登入", `
<p>目前登入：<b>${esc(who)}</b></p>
<p><a href="/accesskey.json">/accesskey.json</a>（國際服＋國服）</p>
<form method="post" action="/logout"><button type="submit">登出</button></form>`);
}

/** POST 擋跨站（CSRF）。優先用 Sec-Fetch-Site（瀏覽器設定、JS 無法偽造，最可靠）：
 *  same-origin / none（自家表單、直接開）放行，same-site / cross-site 擋。
 *  舊瀏覽器沒有這標頭時，退回比對 Origin：沒帶就放行，有帶就必須等於自己。 */
function sameOrigin(request, url) {
  const site = request.headers.get("Sec-Fetch-Site");
  if (site) return site === "same-origin" || site === "none";
  const origin = request.headers.get("Origin");
  return !origin || origin === url.origin;
}

function wantsHtml(request) {
  return (request.headers.get("Accept") || "").includes("text/html");
}

/** 路徑 → "all" 或單一 KV key；其他回傳 null。 */
function resolveKey(pathname) {
  if (pathname === "/accesskey.json") return "all";
  const m = /^(?:\/(netease))?\/accesskey\/([^/]+)\.json$/.exec(pathname);
  if (!m) return null;
  const prefix = SERVERS[m[1] || "tgc"];
  if (SLUG_RE.test(m[2]) && m[2] !== "latest" && !m[2].includes("..")) return `${prefix}${m[2]}.json`;
  return null;
}

/** 讀各服 latest 組成一份；壞掉的 JSON 當作沒有。全部沒有回傳 null。 */
async function readAll(env) {
  const names = Object.keys(SERVERS);
  const raws = await Promise.all(names.map((n) => env.KV.get(`${SERVERS[n]}latest.json`, { type: "text" })));
  const out = {};
  let any = false;
  names.forEach((n, i) => {
    let v = null;
    if (raws[i] !== null) {
      try { v = JSON.parse(raws[i]); any = true; } catch { v = null; }
    }
    out[n] = v;
  });
  return any ? JSON.stringify(out, null, 2) + "\n" : null;
}

// ---------------------------------------------------------------- main
export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const ip = request.headers.get("CF-Connecting-IP") || "";
    const log = (o) => console.log(JSON.stringify({ ...o, ip }));

    // 明文 HTTP：先轉 HTTPS，不跳登入、不讀任何憑證（本機開發例外）
    if (url.protocol === "http:" && !isLocal(url)) {
      url.protocol = "https:";
      return reply(301, null, { Location: url.toString() });
    }

    // ---- 登入 / 登出
    if (url.pathname === "/login" || url.pathname === "/logout") {
      if (!env.SESSION_KEY) {
        return reply(503, "瀏覽器登入尚未啟用（未設定 SESSION_KEY）\n",
                     { "Content-Type": "text/plain; charset=utf-8" }, url);
      }
      if (url.pathname === "/login" && request.method === "GET") {
        const s = await verifySession(request, env);
        return reply(200, s ? loggedInPage(s.name) : loginPage(), HTML_HEADERS, url);
      }
      if (request.method !== "POST") {
        return reply(405, "Method Not Allowed\n", { Allow: url.pathname === "/login" ? "GET, POST" : "POST" }, url);
      }
      if (!sameOrigin(request, url)) return reply(403, "Forbidden\n", {}, url);

      if (url.pathname === "/logout") {
        return reply(303, null, { Location: "/login", "Set-Cookie": CLEAR_COOKIE }, url);
      }
      let token = "";
      try {
        token = String((await request.formData()).get("token") || "");
      } catch {
        // 不是表單：當作空 token
      }
      const who = await verifyToken(token, env);
      if (!who) {
        log({ ev: "login_failed" });
        return reply(401, loginPage("token 不正確"), HTML_HEADERS, url);
      }
      log({ ev: "login_ok", who });
      return reply(303, null, {
        Location: "/accesskey.json",
        "Set-Cookie": sessionCookie(await makeSession(who, env), env),
      }, url);
    }

    // ---- accesskey
    if (request.method !== "GET" && request.method !== "HEAD") {
      return reply(405, "Method Not Allowed\n", { Allow: "GET, HEAD" }, url);
    }
    const key = resolveKey(url.pathname);
    if (!key) return reply(404, "Not Found\n", {}, url);

    const auth = await authenticate(request, env);
    if (!auth) {
      log({ ev: "accesskey_denied", path: url.pathname });
      // 瀏覽器導去登入頁；腳本回 401
      if (wantsHtml(request) && env.SESSION_KEY) {
        return reply(303, null, { Location: "/login" }, url);
      }
      return reply(401, "Unauthorized\n", { "WWW-Authenticate": 'Bearer realm="accesskey"' }, url);
    }

    // 先驗證才讀 KV：被拒絕的請求不會消耗 KV 讀取額度
    const value = key === "all" ? await readAll(env) : await env.KV.get(key, { type: "text" });
    if (value === null) {
      log({ ev: "accesskey_missing", who: auth.who, via: auth.via, key });
      return reply(404, "Not Found\n", {}, url);
    }
    log({ ev: "accesskey_read", who: auth.who, via: auth.via, key, renew: !!auth.renew });
    const extra = { "Content-Type": "application/json; charset=utf-8" };
    if (auth.renew) extra["Set-Cookie"] = sessionCookie(await makeSession(auth.who, env), env);
    return reply(200, request.method === "HEAD" ? null : value, extra, url);
  },
};