/**
 * accesskey Worker：從 Workers KV 讀 accesskey，只回給持有個人 token 的人。
 * （KV 在 Workers 免費方案就有，不需要綁信用卡；R2 需要。）
 *
 * 路由（只接受 GET / HEAD）：
 *   /accesskey.json              -> KV key: accesskey/latest.json
 *   /accesskey/<版本>.json       -> KV key: accesskey/<版本>.json   例：/accesskey/0.35.5_431758.json
 *
 * 驗證：Authorization: Bearer <名稱>.<密鑰>
 *   env.TOKENS（wrangler secret）是 JSON：{"<名稱>": "<整串 token 的 SHA-256 hex>"}
 *   Worker 只存雜湊；比對前先雜湊、再用 crypto.subtle.timingSafeEqual 比對。
 *   名稱不存在時也照樣做一次雜湊與比對，回應時間不洩漏「這個名稱是否存在」。
 */

const NAME_RE = /^[a-z0-9][a-z0-9-]{0,31}$/;
const SECRET_RE = /^[A-Za-z0-9_-]{32,128}$/;
const SLUG_RE = /^[0-9A-Za-z._-]{1,64}$/;
const DUMMY_HASH = new Uint8Array(32); // 名稱不存在時拿來比對的假雜湊

const BASE_HEADERS = {
  "Cache-Control": "no-store",
  "X-Content-Type-Options": "nosniff",
  "Referrer-Policy": "no-referrer",
};

function reply(status, body, extra = {}) {
  return new Response(body, { status, headers: { ...BASE_HEADERS, ...extra } });
}

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
      if (NAME_RE.test(name) && bytes) map.set(name, bytes);
    }
  } catch {
    // TOKENS 格式錯誤：當作沒有任何 token，一律 401
  }
  tokenCache = map;
  return map;
}

/** 回傳通過驗證的名稱，失敗回傳 null。 */
async function authenticate(request, env) {
  const header = request.headers.get("Authorization") || "";
  const m = /^Bearer\s+(\S+)$/.exec(header);
  if (!m) return null;
  const token = m[1];
  const dot = token.indexOf(".");
  const name = dot > 0 ? token.slice(0, dot) : "";
  const secret = dot > 0 ? token.slice(dot + 1) : "";
  const wellFormed = NAME_RE.test(name) && SECRET_RE.test(secret);

  const digest = new Uint8Array(
    await crypto.subtle.digest("SHA-256", new TextEncoder().encode(token)),
  );
  const expected = (wellFormed && loadTokens(env).get(name)) || DUMMY_HASH;
  const equal = crypto.subtle.timingSafeEqual(digest, expected);
  return wellFormed && expected !== DUMMY_HASH && equal ? name : null;
}

function resolveKey(pathname) {
  if (pathname === "/accesskey.json") return "accesskey/latest.json";
  const m = /^\/accesskey\/([^/]+)\.json$/.exec(pathname);
  if (m && SLUG_RE.test(m[1]) && m[1] !== "latest" && !m[1].includes("..")) {
    return `accesskey/${m[1]}.json`;
  }
  return null;
}

export default {
  async fetch(request, env) {
    if (request.method !== "GET" && request.method !== "HEAD") {
      return reply(405, "Method Not Allowed\n", { Allow: "GET, HEAD" });
    }
    const url = new URL(request.url);
    const key = resolveKey(url.pathname);
    if (!key) return reply(404, "Not Found\n");

    const who = await authenticate(request, env);
    const ip = request.headers.get("CF-Connecting-IP") || "";
    if (!who) {
      console.log(JSON.stringify({ ev: "accesskey_denied", path: url.pathname, ip }));
      return reply(401, "Unauthorized\n", { "WWW-Authenticate": 'Bearer realm="accesskey"' });
    }

    // 先驗證才讀 KV：被拒絕的請求不會消耗 KV 讀取額度
    const value = await env.KV.get(key, { type: "text" });
    if (value === null) {
      console.log(JSON.stringify({ ev: "accesskey_missing", who, key, ip }));
      return reply(404, "Not Found\n");
    }
    console.log(JSON.stringify({ ev: "accesskey_read", who, key, ip }));
    return reply(200, request.method === "HEAD" ? null : value, {
      "Content-Type": "application/json; charset=utf-8",
    });
  },
};
