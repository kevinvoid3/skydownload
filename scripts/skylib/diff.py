"""兩個版本之間的差異比對：字串、Resources（JSON 定義檔、行為樹、Lua 定義檔、其他文字檔）。

全部只產生結構化結果（dict），輸出成 Markdown 交給 report.py。
"""
import difflib
import hashlib
import json
import re
from collections import Counter

MISSING = "<none>"


# ======================================================================
# 字串
# ======================================================================
def diff_kv(old, new):
    added = {k: new[k] for k in sorted(new) if k not in old}
    removed = {k: old[k] for k in sorted(old) if k not in new}
    changed = {k: [old[k], new[k]] for k in sorted(old) if k in new and old[k] != new[k]}
    return {"countOld": len(old), "countNew": len(new),
            "added": added, "removed": removed, "changed": changed}


def diff_strings(old_by_loc, new_by_loc, locales=None):
    locs = locales or sorted(set(old_by_loc) | set(new_by_loc))
    out = {}
    for loc in locs:
        if loc not in old_by_loc and loc not in new_by_loc:
            continue
        r = diff_kv(old_by_loc.get(loc, {}), new_by_loc.get(loc, {}))
        r["missingOld"] = loc not in old_by_loc
        r["missingNew"] = loc not in new_by_loc
        out[loc] = r
    return out


# ======================================================================
# 共用：巢狀結構攤平
# ======================================================================
def flatten(o, prefix=""):
    """dict 逐層展開成 a.b.c；元素全是 dict 的 list 展開成 a[0].b；其餘（純值 list）整個當一個值。"""
    if isinstance(o, dict):
        if not o and prefix:
            yield prefix, o
        for k, v in o.items():
            yield from flatten(v, "%s.%s" % (prefix, k) if prefix else str(k))
    elif isinstance(o, list) and o and all(isinstance(x, dict) for x in o):
        for i, v in enumerate(o):
            yield from flatten(v, "%s[%d]" % (prefix, i))
    else:
        yield prefix, o


def field_changes(a, b):
    fa, fb = dict(flatten(a)), dict(flatten(b))
    out = []
    for f in sorted(set(fa) | set(fb)):
        va, vb = fa.get(f, MISSING), fb.get(f, MISSING)
        if va != vb:
            out.append({"field": f, "old": va, "new": vb})
    return out


# ======================================================================
# JSON：條目陣列（以 name / id 等欄位配對）
# ======================================================================
KEY_CANDIDATES = ("name", "id", "treeID", "key", "Name", "ID")


def detect_key_ok(items, k):
    """k 在 items 裡每筆都有、型別是 str/int、而且不重複。"""
    if not all(isinstance(x, dict) for x in items):
        return False
    vals = [x.get(k) for x in items]
    return all(isinstance(v, (str, int)) for v in vals) and len(set(vals)) == len(vals)


def detect_key(items):
    if not items or not all(isinstance(x, dict) for x in items):
        return None
    for k in KEY_CANDIDATES:
        if detect_key_ok(items, k):
            return k
    for k in sorted(set().union(*[x.keys() for x in items])):
        if detect_key_ok(items, k):
            return k
    return None


def _moved(old_keys, new_keys):
    """共同條目的相對順序變動：找出被移位的 key。"""
    common_new = set(new_keys)
    oc = [k for k in old_keys if k in common_new]
    common_old = set(old_keys)
    nc = [k for k in new_keys if k in common_old]
    if oc == nc:
        return []
    sm = difflib.SequenceMatcher(a=oc, b=nc, autojunk=False)
    stay = set()
    for blk in sm.get_matching_blocks():
        stay.update(oc[blk.a:blk.a + blk.size])
    return [k for k in nc if k not in stay]


def diff_keyed(old, new, key):
    om = {x[key]: x for x in old}
    nm = {x[key]: x for x in new}
    ok_ = [x[key] for x in old]
    nk_ = [x[key] for x in new]
    changed = []
    for k in ok_:
        if k in nm and om[k] != nm[k]:
            changed.append({"key": k, "fields": field_changes(om[k], nm[k])})
    return {
        "kind": "keyed-json",
        "keyField": key,
        "countOld": len(old),
        "countNew": len(new),
        "added": [nm[k] for k in nk_ if k not in om],
        "removed": [om[k] for k in ok_ if k not in nm],
        "changed": changed,
        "moved": _moved(ok_, nk_),
    }


# ======================================================================
# JSON：行為樹（BehaviorTrees/*.json）
# ======================================================================
def is_behavior_tree(o):
    return isinstance(o, dict) and "root" in o and "blackboard" in o


def bt_nodes(tree):
    out = {}

    def walk(n):
        if isinstance(n, dict):
            iid = n.get("instanceID")
            if iid is not None and "type" in n:
                kids = n.get("children") or ([n["child"]] if isinstance(n.get("child"), dict) else [])
                out[iid] = {
                    "type": n.get("type"),
                    "properties": n.get("properties"),
                    "notes": n.get("notes"),
                    "children": [c.get("instanceID") for c in kids if isinstance(c, dict)],
                }
            for k, v in n.items():
                if k != "position":
                    walk(v)
        elif isinstance(n, list):
            for x in n:
                walk(x)

    walk(tree.get("root"))
    return out


def bt_summary(tree):
    nodes = bt_nodes(tree)
    return {
        "treeID": tree.get("treeID"),
        "nodeCount": len(nodes),
        "nodeTypes": dict(Counter(n["type"] for n in nodes.values()).most_common()),
        "blackboard": {k: (v.get("type") if isinstance(v, dict) else v)
                       for k, v in (tree.get("blackboard") or {}).items()},
        "sections": [s.get("title") for s in tree.get("sections", []) if isinstance(s, dict)],
    }


def diff_behavior_tree(old, new):
    na, nb = bt_nodes(old), bt_nodes(new)
    bba, bbb = old.get("blackboard") or {}, new.get("blackboard") or {}
    changed = []
    for iid in na:
        if iid in nb and na[iid] != nb[iid]:
            a, b = na[iid], nb[iid]
            changed.append({
                "id": iid,
                "type": b["type"],
                "typeOld": a["type"] if a["type"] != b["type"] else None,
                "fields": field_changes({"properties": a["properties"], "notes": a["notes"]},
                                        {"properties": b["properties"], "notes": b["notes"]}),
                "childrenChanged": a["children"] != b["children"],
            })
    strip = lambda n: {"type": n["type"], "properties": n["properties"]}
    return {
        "kind": "behavior-tree",
        "treeID": [old.get("treeID"), new.get("treeID")],
        "nodeCountOld": len(na),
        "nodeCountNew": len(nb),
        "blackboardAdded": {k: bbb[k] for k in bbb if k not in bba},
        "blackboardRemoved": {k: bba[k] for k in bba if k not in bbb},
        "blackboardChanged": [{"key": k, "old": bba[k], "new": bbb[k]}
                              for k in bba if k in bbb and bba[k] != bbb[k]],
        "sectionsOld": [s.get("title") for s in old.get("sections", []) if isinstance(s, dict)],
        "sectionsNew": [s.get("title") for s in new.get("sections", []) if isinstance(s, dict)],
        "addedNodes": [strip(nb[k]) for k in nb if k not in na],
        "removedNodes": [strip(na[k]) for k in na if k not in nb],
        "changedNodes": changed,
    }


# ======================================================================
# Lua 定義檔：resource / resourcedef "Type" "Name" { k = v, ... }
# ======================================================================
LUA_DEF = re.compile(r'^\s*(resource|resourcedef)\s+"([^"]+)"\s+"([^"]+)"\s*\{(.*)\}\s*(?:--.*)?$')
# 只改這些欄位的條目視為「自動重排」，只計數不逐條列出
# （UIPackedAtlas.lua 由 uiatlas 工具產生，每次重新打包圖示都會整批改 uv、換到別張 atlas）
LUA_NOISE_FIELDS = {"ImageRegion": {"uv", "image"}}


def _split_top(body):
    """以最外層逗號切開 body（忽略 {} () 與字串內的逗號）。"""
    parts, depth, cur, quote = [], 0, [], None
    for ch in body:
        if quote:
            cur.append(ch)
            if ch == quote:
                quote = None
            continue
        if ch in "\"'":
            quote = ch
        elif ch in "{(":
            depth += 1
        elif ch in "})":
            depth -= 1
        elif ch == "," and depth == 0:
            parts.append("".join(cur))
            cur = []
            continue
        cur.append(ch)
    if "".join(cur).strip():
        parts.append("".join(cur))
    return parts


def _norm_ws(s):
    return re.sub(r"\s+", " ", s).strip()


def lua_fields(body):
    out = {}
    for i, part in enumerate(_split_top(body)):
        if "=" in part:
            k, v = part.split("=", 1)
            out[k.strip()] = _norm_ws(v)
        elif part.strip():
            out["[%d]" % i] = _norm_ws(part)
    return out


def parse_lua_defs(text):
    defs, order, others = {}, [], Counter()
    for line in text.splitlines():
        m = LUA_DEF.match(line)
        if m:
            key = '%s "%s"' % (m.group(2), m.group(3))
            base, n = key, 2
            while key in defs:
                key = "%s#%d" % (base, n)
                n += 1
            defs[key] = {"type": m.group(2), "name": m.group(3), "decl": m.group(1),
                         "fields": lua_fields(m.group(4))}
            order.append(key)
            continue
        s = _norm_ws(line)
        if s and not s.startswith("--"):
            others[s] += 1
    return defs, order, others


def diff_lua(old_text, new_text):
    da, oa, xa = parse_lua_defs(old_text)
    db, ob, xb = parse_lua_defs(new_text)
    if not da and not db:
        return None
    changed, noise = [], Counter()
    for k in oa:
        if k not in db:
            continue
        a, b = da[k], db[k]
        if a["fields"] == b["fields"] and a["decl"] == b["decl"]:
            continue
        fa, fb = a["fields"], b["fields"]
        fields = [{"field": f, "old": fa.get(f, MISSING), "new": fb.get(f, MISSING)}
                  for f in sorted(set(fa) | set(fb)) if fa.get(f, MISSING) != fb.get(f, MISSING)]
        if a["decl"] != b["decl"]:
            fields.insert(0, {"field": "(declaration)", "old": a["decl"], "new": b["decl"]})
        noisy = LUA_NOISE_FIELDS.get(b["type"])
        if noisy and fields and all(x["field"] in noisy for x in fields):
            noise[b["type"]] += 1
            continue
        changed.append({"key": k, "fields": fields})

    def render(d):
        return '%s "%s" "%s" { %s }' % (d["decl"], d["type"], d["name"],
                                        ", ".join("%s = %s" % kv for kv in d["fields"].items()))

    return {
        "kind": "lua-defs",
        "countOld": len(da),
        "countNew": len(db),
        "added": [render(db[k]) for k in ob if k not in da],
        "removed": [render(da[k]) for k in oa if k not in db],
        "changed": changed,
        "noiseChanged": dict(noise),
        "otherLinesAdded": sorted((xb - xa).elements()),
        "otherLinesRemoved": sorted((xa - xb).elements()),
    }


# ======================================================================
# 一般文字
# ======================================================================
TEXT_DIFF_LIMIT = 2000


def diff_text(old_text, new_text, name):
    lines = list(difflib.unified_diff(old_text.splitlines(), new_text.splitlines(),
                                      "a/" + name, "b/" + name, lineterm=""))
    return {"kind": "text", "lines": lines[:TEXT_DIFF_LIMIT],
            "truncated": max(0, len(lines) - TEXT_DIFF_LIMIT)}


# ======================================================================
# 二進位檔（.luac 等）：sha256、大小，加上可讀字串的增減
# ======================================================================
BINARY_EXTS = (".luac", ".bin", ".dat")
PRINTABLE_RE = re.compile(rb"[\x20-\x7e]{4,}")


def is_text(b, path=""):
    if path.lower().endswith(BINARY_EXTS) or b"\x00" in b[:8192]:
        return False
    try:
        b.decode("utf-8")
        return True
    except UnicodeDecodeError:
        return False


def printable_strings(b):
    return Counter(x.decode("ascii") for x in PRINTABLE_RE.findall(b))


def diff_binary(old_b, new_b):
    so, sn = printable_strings(old_b), printable_strings(new_b)
    return {
        "kind": "binary",
        "sizeOld": len(old_b), "sizeNew": len(new_b),
        "sha256Old": hashlib.sha256(old_b).hexdigest(),
        "sha256New": hashlib.sha256(new_b).hexdigest(),
        # 啟發式：只看長度 ≥4 的可讀 ASCII 片段（函式名、常數、路徑），不是反組譯
        "stringsAdded": sorted((sn - so).elements()),
        "stringsRemoved": sorted((so - sn).elements()),
    }


# ======================================================================
# 單行清單（例：Scripts/Bin/AllLevelList.lua 是空白分隔的關卡名）
# ======================================================================
WORDLIST_MIN_LINE = 400


def diff_wordlist(old_text, new_text):
    to, tn = old_text.split(), new_text.split()
    co, cn = Counter(to), Counter(tn)
    return {
        "kind": "wordlist",
        "countOld": len(to), "countNew": len(tn),
        "added": sorted((cn - co).elements()),
        "removed": sorted((co - cn).elements()),
        "orderChanged": co == cn and to != tn,
    }


# ======================================================================
# 資料夾整體
# ======================================================================
def decode(b):
    return b.decode("utf-8-sig", "replace").replace("\r\n", "\n")


def diff_file(path, old_b, new_b):
    if not (is_text(old_b, path) and is_text(new_b, path)):
        return diff_binary(old_b, new_b)
    ot, nt = decode(old_b), decode(new_b)
    if ot == nt:
        return {"kind": "eol-only"}     # 只有換行符號（CRLF/LF）或 BOM 不同
    low = path.lower()
    if low.endswith(".json"):
        try:
            oj, nj = json.loads(ot), json.loads(nt)
        except ValueError:
            return diff_text(ot, nt, path)
        if oj == nj:
            return {"kind": "format-only"}  # 內容相同，只有排版不同
        if is_behavior_tree(oj) and is_behavior_tree(nj):
            return diff_behavior_tree(oj, nj)
        if isinstance(oj, list) and isinstance(nj, list):
            k = detect_key(oj)
            if k and detect_key_ok(nj, k):
                return diff_keyed(oj, nj, k)
        if isinstance(oj, dict) and isinstance(nj, dict):
            return {"kind": "json-fields", "fields": field_changes(oj, nj)}
        return diff_text(json.dumps(oj, ensure_ascii=False, indent=1),
                         json.dumps(nj, ensure_ascii=False, indent=1), path)
    if low.endswith(".lua"):
        r = diff_lua(ot, nt)
        if r is not None:
            return r
    longest = max((len(x) for x in (ot + "\n" + nt).splitlines()), default=0)
    if longest >= WORDLIST_MIN_LINE and len(nt.splitlines()) <= 3:
        return diff_wordlist(ot, nt)
    return diff_text(ot, nt, path)


def summarize_file(path, b):
    """新增／刪除的檔案給個概要。"""
    info = {"path": path, "bytes": len(b)}
    if not is_text(b, path):
        info["sha256"] = hashlib.sha256(b).hexdigest()
        return info
    if path.lower().endswith(".json"):
        try:
            j = json.loads(decode(b))
        except ValueError:
            return info
        if is_behavior_tree(j):
            info["behaviorTree"] = bt_summary(j)
        elif isinstance(j, list):
            info["entries"] = len(j)
    elif path.lower().endswith(".lua"):
        defs, _, _ = parse_lua_defs(decode(b))
        if defs:
            info["definitions"] = len(defs)
        else:
            info["lines"] = len(decode(b).splitlines())
    return info


def diff_resources(old_files, new_files):
    added = [summarize_file(p, new_files[p]) for p in sorted(new_files) if p not in old_files]
    removed = [summarize_file(p, old_files[p]) for p in sorted(old_files) if p not in new_files]
    changed, unchanged, cosmetic = [], 0, []
    for p in sorted(old_files):
        if p not in new_files:
            continue
        if old_files[p] == new_files[p]:
            unchanged += 1
            continue
        r = diff_file(p, old_files[p], new_files[p])
        r["path"] = p
        if r["kind"] in ("eol-only", "format-only"):
            cosmetic.append(r)
        else:
            changed.append(r)
    return {"added": added, "removed": removed, "changed": changed,
            "cosmetic": cosmetic, "unchanged": unchanged,
            "countOld": len(old_files), "countNew": len(new_files),
            "pairNotes": pair_notes(old_files, new_files)}


def pair_notes(old_files, new_files):
    """X.lua 與 X.lua.luac 應該一起變；只變一邊代表原始碼和實際執行的 bytecode 可能不一致。"""
    notes = []
    for p in sorted(set(old_files) | set(new_files)):
        if not p.endswith(".luac"):
            continue
        src = p[:-len(".luac")]
        if src not in old_files and src not in new_files:
            continue
        bc_changed = old_files.get(p) != new_files.get(p)
        src_changed = old_files.get(src) != new_files.get(src)
        if bc_changed and not src_changed:
            notes.append("`%s` 變了，但 `%s` 沒變：實際執行的 bytecode 和附帶的原始碼可能不一致" % (p, src))
        elif src_changed and not bc_changed:
            notes.append("`%s` 變了，但 `%s` 沒變：原始碼有改，bytecode 卻沒重新編譯（或只改了註解）" % (src, p))
    return notes
