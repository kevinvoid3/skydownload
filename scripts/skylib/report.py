"""把 diff.py 的結果輸出成 Markdown。"""
import json


def _s(v):
    return v if isinstance(v, str) else json.dumps(v, ensure_ascii=False)


def code(v):
    """表格內的 inline code：保留 <b> 這類標記原樣顯示、換行轉 \\n、跳脫 |。"""
    s = _s(v).replace("\r", "\\r").replace("\n", "\\n").replace("|", "\\|")
    if s == "":
        return '`""`'
    if "`" in s:
        return "`` %s ``" % s
    return "`%s`" % s


def jline(o):
    return json.dumps(o, ensure_ascii=False)


def fence(lines, lang=""):
    # 內容若含 ``` 就加長圍欄
    fence_ = "````" if any("```" in x for x in lines) else "```"
    return [fence_ + lang] + list(lines) + [fence_]


def details(summary, body):
    return ["<details><summary>%s</summary>" % summary, ""] + body + ["", "</details>", ""]


# ----------------------------------------------------------------------
def render_strings(loc, r):
    out = []
    note = ""
    if r.get("missingOld"):
        note = "（舊版沒有這個語系）"
    elif r.get("missingNew"):
        note = "（新版沒有這個語系）"
    out.append("%d → %d 條；新增 %d、刪除 %d、修改 %d %s" % (
        r["countOld"], r["countNew"], len(r["added"]), len(r["removed"]), len(r["changed"]), note))
    out.append("")
    if r["changed"]:
        out += ["#### 修改（%d）" % len(r["changed"]), "", "| key | 舊 | 新 |", "|---|---|---|"]
        out += ["| %s | %s | %s |" % (code(k), code(a), code(b)) for k, (a, b) in r["changed"].items()]
        out.append("")
    if r["added"]:
        out += ["#### 新增（%d）" % len(r["added"]), "", "| key | 內容 |", "|---|---|"]
        out += ["| %s | %s |" % (code(k), code(v)) for k, v in r["added"].items()]
        out.append("")
    if r["removed"]:
        out += ["#### 刪除（%d）" % len(r["removed"]), "", "| key | 舊內容 |", "|---|---|"]
        out += ["| %s | %s |" % (code(k), code(v)) for k, v in r["removed"].items()]
        out.append("")
    return out


def render_fields(fields, indent="  "):
    return ["%s- %s：%s → %s" % (indent, code(f["field"]), code(f["old"]), code(f["new"])) for f in fields]


def change_count(r):
    k = r["kind"]
    if k == "keyed-json":
        return "+%d / -%d / 改 %d（%d → %d 筆）" % (len(r["added"]), len(r["removed"]), len(r["changed"]),
                                               r["countOld"], r["countNew"])
    if k == "behavior-tree":
        return "節點 %d → %d；+%d / -%d / 改 %d" % (r["nodeCountOld"], r["nodeCountNew"], len(r["addedNodes"]),
                                              len(r["removedNodes"]), len(r["changedNodes"]))
    if k == "lua-defs":
        s = "+%d / -%d / 改 %d（%d → %d 個定義）" % (len(r["added"]), len(r["removed"]), len(r["changed"]),
                                               r["countOld"], r["countNew"])
        if r["noiseChanged"]:
            s += "；另 %s 只是 atlas 重排（uv／image）" % "、".join("%s %d" % kv for kv in r["noiseChanged"].items())
        if r["otherLinesAdded"] or r["otherLinesRemoved"]:
            s += "；其他行 +%d / -%d" % (len(r["otherLinesAdded"]), len(r["otherLinesRemoved"]))
        return s
    if k == "json-fields":
        return "%d 個欄位" % len(r["fields"])
    if k == "text":
        return "%d 行 diff" % len(r["lines"])
    if k == "binary":
        return "二進位：%d → %d bytes；可讀字串 +%d / -%d" % (
            r["sizeOld"], r["sizeNew"], len(r["stringsAdded"]), len(r["stringsRemoved"]))
    if k == "wordlist":
        if r["orderChanged"]:
            return "%d 個項目，只有順序改變" % r["countNew"]
        return "%d → %d 個項目；+%d / -%d" % (r["countOld"], r["countNew"], len(r["added"]), len(r["removed"]))
    return k


def render_file(r):
    out = ["### `%s`" % r["path"], "", change_count(r), ""]
    k = r["kind"]
    if k == "keyed-json":
        out.append("配對欄位：`%s`" % r["keyField"])
        out.append("")
        if r["added"]:
            out += ["**新增（%d）**" % len(r["added"]), ""] + fence([jline(x) for x in r["added"]], "json") + [""]
        if r["removed"]:
            out += ["**刪除（%d）**" % len(r["removed"]), ""] + fence([jline(x) for x in r["removed"]], "json") + [""]
        if r["changed"]:
            out += ["**修改（%d）**" % len(r["changed"]), ""]
            for c in r["changed"]:
                out.append("- %s" % code(c["key"]))
                out += render_fields(c["fields"])
            out.append("")
        if r["moved"]:
            out += ["**順序移動**：%s" % "、".join(code(x) for x in r["moved"]), ""]
    elif k == "behavior-tree":
        bb = []
        if r["blackboardAdded"]:
            bb.append("新增 " + "、".join(code(x) for x in r["blackboardAdded"]))
        if r["blackboardRemoved"]:
            bb.append("刪除 " + "、".join(code(x) for x in r["blackboardRemoved"]))
        if r["blackboardChanged"]:
            bb.append("修改 " + "、".join(code(x["key"]) for x in r["blackboardChanged"]))
        if bb:
            out += ["- blackboard：" + "；".join(bb)]
        if r["sectionsOld"] != r["sectionsNew"]:
            out += ["- sections：%s → %s" % (" / ".join(map(str, r["sectionsOld"])) or "（無）",
                                              " / ".join(map(str, r["sectionsNew"])) or "（無）")]
        out.append("")
        if r["addedNodes"]:
            out += ["**新增節點（%d）**" % len(r["addedNodes"]), ""] + fence([jline(x) for x in r["addedNodes"]], "json") + [""]
        if r["removedNodes"]:
            out += ["**刪除節點（%d）**" % len(r["removedNodes"]), ""] + fence([jline(x) for x in r["removedNodes"]], "json") + [""]
        if r["changedNodes"]:
            out += ["**修改節點（%d）**" % len(r["changedNodes"]), ""]
            for c in r["changedNodes"]:
                t = c["type"] if not c["typeOld"] else "%s → %s" % (c["typeOld"], c["type"])
                out.append("- `%s` %s%s" % (c["id"], t, "（子節點變動）" if c["childrenChanged"] else ""))
                out += render_fields(c["fields"])
            out.append("")
    elif k == "lua-defs":
        if r["added"]:
            out += ["**新增（%d）**" % len(r["added"]), ""] + fence(r["added"], "lua") + [""]
        if r["removed"]:
            out += ["**刪除（%d）**" % len(r["removed"]), ""] + fence(r["removed"], "lua") + [""]
        if r["changed"]:
            out += ["**修改（%d）**" % len(r["changed"]), ""]
            for c in r["changed"]:
                out.append("- %s" % code(c["key"]))
                out += render_fields(c["fields"])
            out.append("")
        if r["otherLinesAdded"] or r["otherLinesRemoved"]:
            body = ["+ " + x for x in r["otherLinesAdded"]] + ["- " + x for x in r["otherLinesRemoved"]]
            out += ["**其他行**", ""] + fence(body, "diff") + [""]
    elif k == "json-fields":
        out += render_fields(r["fields"], "") + [""]
    elif k == "binary":
        out += ["- sha256：`%s` → `%s`" % (r["sha256Old"][:16], r["sha256New"][:16]),
                "- 可讀字串是從二進位檔裡抽出長度 ≥4 的 ASCII 片段（函式名、常數、路徑），只是參考，不是反組譯", ""]
        body = ["+ " + x for x in r["stringsAdded"]] + ["- " + x for x in r["stringsRemoved"]]
        if body:
            out += fence(body[:TEXT_LIMIT], "diff")
            if len(body) > TEXT_LIMIT:
                out.append("（另有 %d 行未列出）" % (len(body) - TEXT_LIMIT))
            out.append("")
    elif k == "wordlist":
        if r["added"]:
            out += ["**新增（%d）**：%s" % (len(r["added"]), "、".join(code(x) for x in r["added"])), ""]
        if r["removed"]:
            out += ["**刪除（%d）**：%s" % (len(r["removed"]), "、".join(code(x) for x in r["removed"])), ""]
    elif k == "text":
        out += fence(r["lines"], "diff")
        if r["truncated"]:
            out.append("（另有 %d 行未列出）" % r["truncated"])
        out.append("")
    return out


TEXT_LIMIT = 2000


def file_brief(f):
    if "sha256" in f:
        return "二進位，%d bytes，sha256 `%s`" % (f["bytes"], f["sha256"][:16])
    if "behaviorTree" in f:
        bt = f["behaviorTree"]
        return "行為樹 %s，%d 個節點，blackboard：%s" % (
            bt["treeID"], bt["nodeCount"], "、".join(bt["blackboard"]) or "（無）")
    if "entries" in f:
        return "%d 筆" % f["entries"]
    if "definitions" in f:
        return "%d 個定義" % f["definitions"]
    if "lines" in f:
        return "%d 行" % f["lines"]
    return "%d bytes" % f["bytes"]


# ----------------------------------------------------------------------
def tree_list(result):
    """result["trees"]：[{name, dir, prefix, skipped, diff}]；相容舊格式 result["resources"]。"""
    trees = list(result.get("trees") or [])
    if not trees and result.get("resources"):
        m = result["meta"]
        trees = [{"name": "Resources", "dir": "Resources", "prefix": m.get("resourcesPrefix"),
                  "skipped": m.get("resourcesSkipped") or [], "diff": result["resources"]}]
    return trees


def render_tree(t):
    res = t["diff"]
    name = t["name"]
    out = ["## %s" % name, ""]
    for n in res.get("pairNotes") or []:
        out.append("> ⚠️ " + n)
    if res.get("pairNotes"):
        out.append("")
    if res["added"]:
        out += ["### 新增檔案（%d）" % len(res["added"]), ""]
        out += ["- `%s`：%s" % (f["path"], file_brief(f)) for f in res["added"]] + [""]
    if res["removed"]:
        out += ["### 刪除檔案（%d）" % len(res["removed"]), ""]
        out += ["- `%s`：%s" % (f["path"], file_brief(f)) for f in res["removed"]] + [""]
    for r in res["changed"]:
        out += render_file(r)
    if res["cosmetic"]:
        out += ["### 只有格式不同（%d）" % len(res["cosmetic"]), ""]
        out += ["- `%s`（%s）" % (r["path"], "換行／BOM" if r["kind"] == "eol-only" else "JSON 排版")
                for r in res["cosmetic"]] + [""]
    skipped = t.get("skipped") or []
    if skipped:
        out += details("%s 內未收錄的檔案（%d）" % (name, len(skipped)),
                       ["- `%s`" % x for x in skipped[:500]] +
                       (["- …另 %d 個" % (len(skipped) - 500)] if len(skipped) > 500 else []))
    return out


def render(result):
    m = result["meta"]
    trees = tree_list(result)
    out = ["# 《光·遇》APK 資源差異 %s" % m["generatedAt"], ""]
    out += ["| | 舊（repo 現有） | 新（本次 APK） |", "|---|---|---|",
            "| 包名 | %s | %s |" % (m["package"], m["package"]),
            "| 版本 | %s | %s |" % (m.get("oldVersion") or "（未知）", m.get("newVersion") or "（未知）"),
            "| APK sha256 | | %s |" % (("`%s`" % m["apkSha256"]) if m.get("apkSha256") else "")]
    for t in trees:
        out.append("| %s 位置 | `%s/` | `%s` |" % (t["name"], t.get("dir") or t["name"], t.get("prefix") or ""))
    if m.get("archived"):
        out.append("| 本次封存 | | %s |" % "、".join("`%s`" % x for x in m["archived"]))
    out.append("")
    if m.get("notes"):
        out += ["> " + n for n in m["notes"]] + [""]

    s = result.get("strings") or {}

    # ---- 總覽 ----
    out += ["## 總覽", ""]
    out += ["| 項目 | 變動 |", "|---|---|"]
    for loc, r in s.items():
        out.append("| strings/%s | %d → %d；+%d / -%d / 改 %d |" % (
            loc, r["countOld"], r["countNew"], len(r["added"]), len(r["removed"]), len(r["changed"])))
    for t in trees:
        res = t.get("diff")
        if not res:
            continue
        out.append("| %s/ | %d → %d 檔；新增 %d、刪除 %d、修改 %d、只差格式 %d、相同 %d |" % (
            t.get("label") or t["name"], res["countOld"], res["countNew"], len(res["added"]), len(res["removed"]),
            len(res["changed"]), len(res["cosmetic"]), res["unchanged"]))
        for r in res["changed"]:
            out.append("| └ `%s` | %s |" % (r["path"], change_count(r).replace("|", "\\|")))
    out.append("")

    # ---- 字串 ----
    if s:
        locs = list(s)
        src = m.get("stringsSource")
        out += ["## 字串", ""]
        if src:
            out += ["比對來源：repo 內 %s vs 本次從 `resources.arsc` 抽出的同格式字串。" % src, ""]
        for i, loc in enumerate(locs):
            body = render_strings(loc, s[loc])
            if i == 0:
                out += ["### strings/%s" % loc, ""] + body
            else:
                r = s[loc]
                out += details("strings/%s：+%d / -%d / 改 %d" % (
                    loc, len(r["added"]), len(r["removed"]), len(r["changed"])), body)

    # ---- 各資料夾 ----
    for t in trees:
        if t.get("diff"):
            out += render_tree(t)
    return "\n".join(out).rstrip() + "\n"


def has_changes(result):
    s = result.get("strings") or {}
    if any(r["added"] or r["removed"] or r["changed"] for r in s.values()):
        return True
    for t in tree_list(result):
        res = t.get("diff") or {}
        if res and (res["added"] or res["removed"] or res["changed"]):
            return True
    return False
