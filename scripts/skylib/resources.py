"""在 APK 內定位遊戲資料夾（Data/Resources、Data/Scripts…），抽出檔案；讀寫 repo 內的鏡像。

要多抽一個資料夾，在 TREES 加一筆即可：
  path     APK 內的固定路徑；找不到這個路徑時才用 markers 自動偵測（APK 改版搬位置時的備援）
  markers  用來辨識資料夾的標記檔；每一組是「任一個存在就算」，所有組都要滿足
  prefer   有多個候選時優先選結尾是這個路徑的
  exts     要收錄的副檔名；None 代表全部收錄（含 .luac 這類二進位檔）
"""
import shutil
import zipfile
from pathlib import PurePosixPath, Path

TREES = {
    "Resources": {
        "path": "assets/Data/Resources",
        "markers": (("Persistent.lua",), ("OutfitDefs.json",)),
        "prefer": "Data/Resources",
        "exts": (".json", ".lua"),
        "archive": "Resources",
    },
    "Scripts": {
        "path": "assets/Data/Scripts",
        "markers": (("LoadLevel.lua", "LoadLevel.lua.luac"),
                    ("LevelSelect.lua", "LevelSelect.lua.luac")),
        "prefer": "Data/Scripts",
        "exts": None,
        "archive": "Scripts",
    },
}

# 相容舊呼叫
MARKER_FILES = ("Persistent.lua", "OutfitDefs.json")
DEFAULT_EXTS = (".json", ".lua")

# 鏡像資料夾裡的說明檔，不參與比對
IGNORED_NAMES = {"README_PLACEHOLDER.md"}


def _match_ext(name, exts):
    return exts is None or name.lower().endswith(tuple(e.lower() for e in exts))


def find_prefix(names, markers=TREES["Resources"]["markers"], prefer="Data/Resources"):
    """從 zip 檔名清單找出滿足所有標記組的資料夾，回傳 'assets/Data/Resources/' 這類前綴；
    標記檔就在 zip 根目錄時回傳 ''；找不到回傳 None。"""
    found = {}
    for n in names:
        p = PurePosixPath(n)
        for gi, group in enumerate(markers):
            if p.name in group:
                found.setdefault(str(p.parent), set()).add(gi)
    hits = [d for d, groups in found.items() if len(groups) == len(markers)]
    if not hits:
        return None
    hits.sort(key=lambda d: (not d.endswith(prefer), d.count("/"), len(d), d))
    if hits[0] in (".", ""):
        return ""
    return hits[0].rstrip("/") + "/"


def find_resources_prefix(names):
    return find_prefix(names)


def extract_from_apk(apk_path, prefix=None, exts=DEFAULT_EXTS, tree="Resources", detected=None):
    """回傳 (prefix, files, skipped)。files: {相對路徑: bytes}；skipped: 因副檔名或路徑不安全而略過的相對路徑。
    detected 若給 list，固定路徑不存在、改用自動偵測時會 append 說明。"""
    spec = TREES[tree]
    with zipfile.ZipFile(apk_path) as zf:
        names = zf.namelist()
        if prefix is None and spec.get("path"):
            fixed = spec["path"].rstrip("/") + "/"
            if any(n.startswith(fixed) for n in names):
                prefix = fixed
        if prefix is None:
            prefix = find_prefix(names, spec["markers"], spec["prefer"])
            if prefix is not None and spec.get("path") and detected is not None:
                detected.append("APK 內沒有 `%s/`，改用自動偵測找到 `%s`" % (spec["path"], prefix))
        if prefix is None:
            raise RuntimeError(
                "APK 內找不到 %s 資料夾（標記檔：%s）；可用 --%s-prefix 指定"
                % (tree, " + ".join("/".join(g) for g in spec["markers"]), tree.lower()))
        if prefix and not prefix.endswith("/"):
            prefix += "/"
        files, skipped = {}, []
        for info in zf.infolist():
            if info.is_dir() or not info.filename.startswith(prefix):
                continue
            rel = info.filename[len(prefix):]
            parts = PurePosixPath(rel).parts
            if not parts or rel.startswith("/") or ".." in parts or "\\" in rel:
                # zip slip 防護：不接受會跳出目標資料夾的路徑
                skipped.append("[unsafe path] " + rel)
                continue
            if _match_ext(rel, exts):
                files[rel] = zf.read(info)
            else:
                skipped.append(rel)
    return prefix, files, sorted(skipped)


def load_dir(path, exts=DEFAULT_EXTS):
    """讀 repo 內的鏡像 -> {相對路徑: bytes}；不存在回傳 {}。"""
    root = Path(path)
    if not root.is_dir():
        return {}
    out = {}
    for f in sorted(root.rglob("*")):
        if f.is_file() and f.name not in IGNORED_NAMES and _match_ext(f.name, exts):
            out[f.relative_to(root).as_posix()] = f.read_bytes()
    return out


def write_dir(files, path):
    """整個覆蓋：先清掉舊鏡像再寫入，確保已被刪除的檔案也跟著消失。"""
    root = Path(path)
    if root.exists():
        shutil.rmtree(root)
    for rel, data in files.items():
        dest = root / rel
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_bytes(data)
    return len(files)
