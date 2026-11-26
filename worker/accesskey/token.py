#!/usr/bin/env python3
"""
accesskey Worker 的 token 管理（只用標準庫）。

  python token.py new   <名稱>   產生新 token：原文只印一次（交給朋友），雜湊寫進 tokens.hashes.json
  python token.py revoke <名稱>  撤銷
  python token.py list           列出目前有哪些名稱
  python token.py session-key    產生瀏覽器登入用的 SESSION_KEY（換掉它 = 所有人登出）

改完後部署到 Worker：
  PowerShell： Get-Content tokens.hashes.json -Raw | npx wrangler secret put TOKENS
  bash / cmd： npx wrangler secret put TOKENS < tokens.hashes.json

tokens.hashes.json 只有雜湊、沒有 token 原文，但仍然不要 commit（已在 .gitignore）。
"""
import hashlib
import json
import re
import secrets
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
STORE = HERE / "tokens.hashes.json"
NAME_RE = re.compile(r"^[a-z0-9][a-z0-9-]{0,31}$")


def load():
    if STORE.is_file():
        return json.loads(STORE.read_text(encoding="utf-8"))
    return {}


def save(d):
    STORE.write_text(json.dumps(d, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def main(argv):
    if len(argv) < 2 or argv[1] not in ("new", "revoke", "list", "session-key"):
        print(__doc__)
        return 2
    if argv[1] == "session-key":
        print("SESSION_KEY（只顯示這一次；執行 npx wrangler secret put SESSION_KEY 後貼上）：")
        print()
        print("    " + secrets.token_urlsafe(32))
        print()
        print("換掉 SESSION_KEY 會讓所有人的瀏覽器登入一起失效；token 本身不受影響。")
        return 0
    cmd, d = argv[1], load()
    if cmd == "list":
        for name in sorted(d):
            print(name)
        return 0
    if len(argv) != 3 or not NAME_RE.match(argv[2]):
        print("名稱只能用小寫英數與 -，1～32 字，開頭不能是 -")
        return 2
    name = argv[2]
    if cmd == "revoke":
        if d.pop(name, None) is None:
            print("沒有這個名稱：%s" % name)
            return 1
        save(d)
        print("已撤銷 %s；重新執行下面這行才會生效：" % name)
        print("  PowerShell： Get-Content tokens.hashes.json -Raw | npx wrangler secret put TOKENS")
        return 0
    if name in d:
        print("%s 已存在；要換新 token 請先 revoke" % name)
        return 1
    token = "%s.%s" % (name, secrets.token_urlsafe(32))   # 256 bits 隨機
    d[name] = hashlib.sha256(token.encode()).hexdigest()
    save(d)
    print("給 %s 的 token（只會顯示這一次，請用私訊之類的方式交給本人）：" % name)
    print()
    print("    " + token)
    print()
    print("已寫入 %s；接著執行：" % STORE.name)
    print("  PowerShell： Get-Content tokens.hashes.json -Raw | npx wrangler secret put TOKENS")
    print("  bash / cmd： npx wrangler secret put TOKENS < tokens.hashes.json")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
