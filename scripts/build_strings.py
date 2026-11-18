#!/usr/bin/env python3
"""
從 resources.arsc（或 APK）抽字串 -> 正則清掉遊戲內嵌標記 -> 每語系輸出一檔到 strings/ -> git commit。

標記處理：
  - 排版標記 <b> <1> <warning> <apcolor> <small> <h3> ... 一律移除
  - 圖示標記 <candle/> <heart/> <button type="shout"/> 預設移除；--keep-icons 轉成 [candle] [btn:shout]
  - 變數佔位 {1} %s %1$s 保留不動
  - 移除標記後收斂多餘空白

用法：
  python scripts/build_strings.py resources.arsc
  python scripts/build_strings.py app.apk --format json --keep-icons
  python scripts/build_strings.py resources.arsc --no-commit         # 只產檔不 commit
"""
import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from extract_arsc_strings import load_arsc, walk_table, resolve, esc_strings

TAG_RE = re.compile(r"<[^>]*>")
ICON_RE = re.compile(r"<([a-zA-Z_][\w]*)\s*/>")
BTN_RE = re.compile(r'<button\s+type="([^"]+)"\s*/>')
WS_RE = re.compile(r"[ \t]{2,}")


def normalize(value, keep_icons=False):
    s = value
    if keep_icons:
        s = BTN_RE.sub(lambda m: "[btn:%s]" % m.group(1), s)
        s = ICON_RE.sub(lambda m: "[%s]" % m.group(1), s)
    # 其餘（含排版標記、以及未保留時的圖示）全部移除
    s = TAG_RE.sub("", s)
    # 收斂因移除標記產生的多餘空白（保留換行）
    s = WS_RE.sub(" ", s)
    s = "\n".join(line.strip() for line in s.split("\n"))
    return s.strip()


def repo_root(start):
    p = start.resolve()
    for cand in [p] + list(p.parents):
        if (cand / ".git").exists():
            return cand
    return None


def git(root, *args):
    return subprocess.run(["git", "-C", str(root), *args],
                          capture_output=True, text=True)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("input", help="resources.arsc 或 .apk")
    ap.add_argument("--out-subdir", default="strings", help="repo 內輸出目錄，預設 strings/")
    ap.add_argument("--format", choices=["strings", "json", "txt"], default="strings")
    ap.add_argument("--keep-icons", action="store_true", help="圖示標記轉成 [candle] 而非移除")
    ap.add_argument("--locale", nargs="*", help="只輸出這些語系")
    ap.add_argument("--no-commit", action="store_true", help="只產檔，不執行 git commit")
    ap.add_argument("--repo", default=".", help="repo 路徑，預設從當前目錄往上找 .git")
    args = ap.parse_args()

    data = load_arsc(args.input)
    value_pool, packages = walk_table(data)
    want = set(args.locale) if args.locale else None
    rows = resolve(value_pool, packages, want)

    # 分語系 + 正則清理
    by_loc = {}
    for r in rows:
        key = r["res"].split("/", 1)[1] if "/" in r["res"] else r["res"]
        val = normalize(r["value"], args.keep_icons)
        by_loc.setdefault(r["locale"], {})[key] = val

    root = repo_root(Path(args.repo)) or Path(args.repo).resolve()
    out_dir = root / args.out_subdir
    out_dir.mkdir(parents=True, exist_ok=True)

    ext = {"strings": "strings", "json": "json", "txt": "txt"}[args.format]
    written = []
    for loc in sorted(by_loc):
        kv = by_loc[loc]
        path = out_dir / ("%s.%s" % (loc, ext))
        if args.format == "json":
            path.write_text(json.dumps(kv, ensure_ascii=False, indent=2), encoding="utf-8")
        elif args.format == "strings":
            lines = ['"%s" = "%s";' % (esc_strings(k), esc_strings(v))
                     for k, v in sorted(kv.items())]
            path.write_text("\n".join(lines) + "\n", encoding="utf-8")
        else:  # txt
            lines = ["%s = %s" % (k, v.replace("\n", "\\n")) for k, v in sorted(kv.items())]
            path.write_text("\n".join(lines) + "\n", encoding="utf-8")
        written.append(path)
    print("wrote %d locale files -> %s/" % (len(written), out_dir))

    if args.no_commit:
        return

    rr = repo_root(out_dir)
    if rr is None:
        print("找不到 .git，略過 commit（可加 --no-commit 或在 repo 內執行）")
        return
    rel = out_dir.relative_to(rr)
    git(rr, "add", str(rel))
    status = git(rr, "diff", "--cached", "--quiet")
    if status.returncode == 0:
        print("strings/ 無變動，不 commit")
        return
    msg = "Update localized strings (%d locales)" % len(written)
    res = git(rr, "commit", "-m", msg)
    if res.returncode == 0:
        print("committed:", msg)
        print(git(rr, "log", "-1", "--oneline").stdout.strip())
    else:
        print("commit 失敗:", res.stderr.strip())


if __name__ == "__main__":
    main()