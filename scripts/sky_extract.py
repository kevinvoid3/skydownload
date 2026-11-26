#!/usr/bin/env python3
"""
《光·遇》APK 拆解與差異比對（唯一入口；實作在 scripts/skylib/）。

子指令：
  run        完整流程（給 GitHub Actions 用）：
             讀 history.json 最新紀錄 → 下載 APK、驗 sha256
             → DEX 抓 accesskey（accesskey.json）
             → resources.arsc 抽字串（strings/）
             → 抽 assets/Data/Resources（Resources/）與 assets/Data/Scripts（GameScripts/）
             → 與 repo 內現有的 strings/、Resources/ 比對，輸出 md/<時間戳>_<服>.md（_tgc / _netease）
  diff       本機比對兩份資料（資料夾、.zip、.apk 都可以），輸出 md
  accesskey  只掃本機 APK 的 DEX
  strings    只從本機 APK / resources.arsc 產 strings/
  arsc       arsc 原始傾印（舊 extract_arsc_strings.py 的功能：--grep、--split、--dump-pools）

所有 run 參數都可用環境變數設定（括號內），方便 workflow 傳入。
"""
import argparse
import json
import os
import re
import shutil
import sys
import traceback
import zipfile
from datetime import datetime, timezone, timedelta
from pathlib import Path

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from skylib import apk, arsc, dex, diff, report, resources  # noqa: E402

CST = timezone(timedelta(hours=8))


def env(name, default=""):
    v = os.getenv(name)
    return default if v is None or v == "" else v


def env_flag(name):
    return env(name) not in ("", "0", "false", "False")


def env_list(name, default=""):
    return env(name, default).split()


def gh_output(**kv):
    """寫入 GitHub Actions step output（本機執行時略過）。"""
    path = os.getenv("GITHUB_OUTPUT")
    if not path:
        return
    with open(path, "a", encoding="utf-8") as f:
        for k, v in kv.items():
            f.write("%s=%s\n" % (k, v))


# ----------------------------------------------------------------------
# md/ 輸出與索引
# ----------------------------------------------------------------------
def load_index(md_dir):
    p = Path(md_dir) / "index.json"
    if p.is_file():
        try:
            return json.loads(p.read_text(encoding="utf-8"))
        except ValueError:
            pass
    return []


def last_entry(index, package):
    for e in reversed(index):
        if e.get("package") == package:
            return e
    return None


# md 檔名後綴：一眼分出是哪一服的報告；不在表內的包名直接用包名（把 . 換成 -）
PACKAGE_TAGS = {
    "com.tgc.sky.android.huawei": "tgc",
    "com.netease.sky.huawei": "netease",
}


def package_tag(package):
    return PACKAGE_TAGS.get(package) or re.sub(r"[^0-9A-Za-z_-]+", "-", package or "unknown")


def write_md(result, md_dir, ts, extra_out_dir=None):
    md_dir = Path(md_dir)
    md_dir.mkdir(parents=True, exist_ok=True)
    stem = "%s_%s" % (ts.strftime("%Y-%m-%d_%H-%M-%S"), package_tag(result["meta"].get("package")))
    name, n = stem + ".md", 2
    while (md_dir / name).exists():       # 同一秒跑兩次時不要互相覆蓋
        name, n = "%s_%d.md" % (stem, n), n + 1
    text = report.render(result)
    (md_dir / name).write_text(text, encoding="utf-8")
    if extra_out_dir:
        Path(extra_out_dir).mkdir(parents=True, exist_ok=True)
        (Path(extra_out_dir) / name).write_text(text, encoding="utf-8")
    return md_dir / name


def archive_into(parent, base, writer):
    """把新內容寫進 parent/base（或 base_2、base_3…），絕不覆蓋內容不同的既有備份。
    writer(path) 負責把內容寫到指定資料夾。回傳 (最終路徑, "new" | "same" | "suffixed")。"""
    parent.mkdir(parents=True, exist_ok=True)
    tmp = parent / (".%s.tmp" % base)
    if tmp.exists():
        shutil.rmtree(tmp)
    writer(tmp)
    new = resources.load_dir(tmp, None)
    n = 1
    while True:
        cand = parent / (base if n == 1 else "%s_%d" % (base, n))
        if not cand.exists():
            tmp.rename(cand)
            return cand, ("new" if n == 1 else "suffixed")
        if resources.load_dir(cand, None) == new:
            shutil.rmtree(tmp)            # 已有一模一樣的備份（例如同版本重跑），不重複存
            return cand, "same"
        n += 1


def summary_counts(result):
    s = result.get("strings") or {}
    out = {"strings": {loc: {"added": len(r["added"]), "removed": len(r["removed"]),
                             "changed": len(r["changed"])} for loc, r in s.items()}}
    for t in report.tree_list(result):
        res = t.get("diff")
        if res:
            out[t["name"]] = {"added": len(res["added"]), "removed": len(res["removed"]),
                              "changed": len(res["changed"])}
    return out


# ----------------------------------------------------------------------
# run
# ----------------------------------------------------------------------
def cmd_run(a):
    failures = []
    ts = datetime.now(CST)
    md_index = load_index(a.md_dir)
    prev = last_entry(md_index, a.package_name)

    # 1. 決定 APK
    record = {}
    apk_url = a.apk_url
    if not apk_url:
        history = apk.load_history(a.history_url)
        record = apk.get_latest_record(history, a.package_name)
        apk_url = record["downUrl"]
    version = record.get("version", "manual-url")

    # 舊版本號：md/index.json 上一筆，沒有就看 accesskey.json。
    # accesskey.json 沒記包名、以前只存國際服，所以這條退路只給國際服用
    # （國服 0.16.x 拿去跟國際服 0.35.x 比會被當成舊版而跳過）
    old_version = prev.get("version") if prev else None
    if (not old_version and not a.no_accesskey and a.package_name == "com.tgc.sky.android.huawei"
            and Path(a.public_file).is_file()):
        try:
            old_version = json.loads(Path(a.public_file).read_text(encoding="utf-8")).get("version")
        except ValueError:
            pass

    # 只處理比 repo 基準「新」的版本：
    #   相同 → 略過（--force 可重跑）
    #   比較舊 → 一律略過（例：手動放了其他管道的 0.35.6 基準，華為還停在 0.35.5），
    #           避免用舊版覆蓋基準與當天封存；真的要跑舊版用 --allow-older
    if record and old_version and Path(a.resources_dir).is_dir():
        cmp = apk.compare_versions(version, old_version)
        if cmp == 0 and not a.force:
            print("版本 %s 與 repo 基準相同，略過（要強制重跑請加 --force / FORCE=1）" % version)
            gh_output(skipped="true", version=version)
            return 0
        if cmp == -1 and not a.allow_older:
            print("history 最新版 %s 比 repo 基準 %s 舊，略過（等 %s 之後的版本；真的要跑請加 --allow-older）"
                  % (version, old_version, old_version))
            gh_output(skipped="true", version=version)
            return 0
        if cmp is None:
            print("無法比較版本 %r 與 %r 的新舊，照常執行" % (version, old_version))

    # 2. 下載
    work_dir = Path(a.work_dir)
    work_dir.mkdir(parents=True, exist_ok=True)
    apk_path = work_dir / ("%s.%s.apk" % (a.package_name, apk.version_slug(version)))
    print("Downloading APK: %s" % apk_url)
    apk.download_file(apk_url, apk_path)
    apk_sha = apk.sha256_file(apk_path)
    if record.get("sha256") and record["sha256"].lower() != apk_sha.lower():
        raise SystemExit("APK sha256 mismatch: expected %s, got %s" % (record["sha256"], apk_sha))
    print("APK sha256: %s" % apk_sha)

    # 3. 先讀 repo 內的舊資料（之後會被覆蓋）
    diff_locales = a.diff_locales or None
    # 優先用保留標記的原始字串比對；第一次跑還沒有時，退回清過標記的 strings/
    old_strings = arsc.load_strings_dir(a.raw_strings_dir, diff_locales) if a.raw_strings_dir else {}
    strings_raw_mode = bool(old_strings)
    if not old_strings:
        old_strings = arsc.load_strings_dir(a.strings_dir, diff_locales)
    # 要抽的資料夾：(名稱, repo 內鏡像, APK 內路徑覆寫, 副檔名篩選)
    trees = [t for t in (
        ("Resources", a.resources_dir, a.resources_prefix, a.resources_ext or None),
        ("Scripts", a.scripts_dir, a.scripts_prefix, None),
    ) if t[1]]
    old_trees = {name: resources.load_dir(d, exts) for name, d, _, exts in trees}

    meta = {"generatedAt": ts.strftime("%Y-%m-%d %H:%M:%S"), "package": a.package_name,
            "oldVersion": old_version, "newVersion": version, "apkSha256": apk_sha, "notes": []}
    result = {"meta": meta}

    # 4. accesskey
    if not a.no_accesskey:
        try:
            selected = dex.scan_apk(apk_path, version, a.package_name, apk_url=apk_url,
                                    history_url=a.history_url, apk_sha=apk_sha,
                                    patterns=a.pattern, accesskey_patterns=a.accesskey_regex,
                                    context_radius=a.context_radius, out_dir=a.out_dir,
                                    public_file=a.public_file)
            # 給 workflow 判斷要不要上傳到 Workers KV；只輸出有無與檔案位置，不輸出 key 本身
            gh_output(accesskey_found="true" if selected else "false",
                      accesskey_file=str(a.public_file),
                      version_slug=apk.version_slug(version))
        except BaseException as e:  # SystemExit 也要接住，不影響後面步驟
            failures.append("accesskey: %s" % e)
            traceback.print_exc()

    # 5. strings
    new_strings = None
    raw_by_loc = None
    try:
        raw = arsc.read_arsc_from_apk(apk_path)
        if raw is None:
            meta["notes"].append("APK 內沒有 resources.arsc，未比對字串。")
        else:
            by_loc = arsc.strings_by_locale(raw, a.strings_locale or None,
                                            keep_icons=a.strings_keep_icons)
            if not a.no_strings:
                n = arsc.write_strings_dir(by_loc, a.strings_dir, a.strings_format)
                print("字串抽取：%d 語系 -> %s/" % (n, a.strings_dir))
            raw_by_loc = arsc.strings_by_locale(raw, diff_locales, normalize_values=False)
            if a.raw_strings_dir:
                # strings_raw/ 完全由程式管理：先清空，避免殘留 placeholder 或已移除的語系
                if Path(a.raw_strings_dir).is_dir():
                    shutil.rmtree(a.raw_strings_dir)
                arsc.write_strings_dir(raw_by_loc, a.raw_strings_dir, "strings")
                print("原始字串（保留標記）：%d 語系 -> %s/" % (len(raw_by_loc), a.raw_strings_dir))
            if strings_raw_mode:
                new_strings = raw_by_loc
                meta["stringsSource"] = "`%s/`（保留遊戲標記的原始字串）" % a.raw_strings_dir
            else:
                new_strings = {k: v for k, v in by_loc.items() if not diff_locales or k in diff_locales}
                meta["stringsSource"] = "`%s/`（清過標記）" % a.strings_dir
                if old_strings:
                    meta["notes"].append(
                        "本次字串是拿清過標記的 strings/ 比對（repo 內還沒有 %s/），"
                        "只差在 <b>、<heart/> 這類標記的改動看不出來；下次起改用原始字串比對。"
                        % a.raw_strings_dir)
    except Exception as e:
        failures.append("strings: %s" % e)
        traceback.print_exc()

    # 6. 遊戲資料夾（Resources、Scripts）
    new_trees, tree_info = {}, {}
    for name, d, prefix_override, exts in trees:
        try:
            detected = []
            prefix, files, skipped = resources.extract_from_apk(
                apk_path, prefix_override or None, exts, tree=name, detected=detected)
            meta["notes"].extend(detected)
            resources.write_dir(files, d)
            new_trees[name] = files
            tree_info[name] = {"name": name, "label": d, "dir": d, "prefix": prefix, "skipped": skipped}
            print("%s：%s -> %s/（%d 檔，略過 %d）" % (name, prefix, d, len(files), len(skipped)))
        except Exception as e:
            failures.append("%s: %s" % (name, e))
            traceback.print_exc()

    # 6b. 封存：archive/Resources/Resources_YYYY-MM-DD/、archive/Scripts/Scripts_…/、archive/Strings/Strings_…/
    #     絕不覆蓋既有備份：當天已有內容相同的就沿用；內容不同（例如手動放的其他版本，
    #     或同一天出了兩個版本）就另存成 _2、_3…
    archived = []
    if not a.no_archive:
        day = ts.strftime("%Y-%m-%d")
        try:
            for name, files in new_trees.items():
                kind = resources.TREES[name]["archive"]
                ad, state = archive_into(Path(a.archive_dir) / kind, "%s_%s" % (kind, day),
                                         lambda d, f=files: resources.write_dir(f, d))
                archived.append("%s/%s" % (kind, ad.name))
                if state == "suffixed":
                    meta["notes"].append("`%s/%s/` 已有內容不同的備份，這次另存成 `%s/`。"
                                         % (kind, "%s_%s" % (kind, day), ad.name))
            if raw_by_loc and not a.no_archive_strings:
                ad, state = archive_into(Path(a.archive_dir) / "Strings", "Strings_%s" % day,
                                         lambda d: arsc.write_strings_dir(raw_by_loc, d, "strings"))
                archived.append("Strings/%s" % ad.name)
                if state == "suffixed":
                    meta["notes"].append("`Strings/Strings_%s/` 已有內容不同的備份，這次另存成 `%s/`。"
                                         % (day, ad.name))
            if archived:
                print("封存：%s/{%s}" % (a.archive_dir, ",".join(archived)))
        except Exception as e:
            failures.append("archive: %s" % e)
            traceback.print_exc()
    meta["archived"] = ["%s/%s/" % (a.archive_dir, x) for x in archived]

    # 7. 比對
    if new_strings is not None:
        if not old_strings:
            meta["notes"].append("repo 內還沒有 strings/，本次建立基準，未比對字串。")
        else:
            result["strings"] = diff.diff_strings(old_strings, new_strings, diff_locales)
    result["trees"] = []
    for name, d, _, _ in trees:
        if name not in new_trees:
            continue
        info = dict(tree_info[name])
        if not old_trees.get(name):
            meta["notes"].append("repo 內還沒有 %s/，本次建立基準，未比對 %s。" % (d, name))
            info["diff"] = None
        else:
            info["diff"] = diff.diff_resources(old_trees[name], new_trees[name])
        result["trees"].append(info)
    if not report.has_changes(result) and result.get("strings") is not None:
        meta["notes"].append("與 repo 現有內容相比沒有差異。")
    for f in failures:
        meta["notes"].append("⚠️ 步驟失敗：" + f)

    md_path = write_md(result, a.md_dir, ts, a.out_dir)
    md_index.append({"package": a.package_name, "version": version, "oldVersion": old_version,
                     "apkSha256": apk_sha, "generatedAt": meta["generatedAt"],
                     "md": md_path.name, "archive": meta["archived"],
                     "changes": summary_counts(result)})
    (Path(a.md_dir) / "index.json").write_text(
        json.dumps(md_index, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print("Wrote %s" % md_path)
    gh_output(skipped="false", version=version, md=str(md_path))

    if not a.keep_apk:
        apk_path.unlink(missing_ok=True)
    if failures:
        print("有步驟失敗：\n  " + "\n  ".join(failures))
        return 1
    return 0


# ----------------------------------------------------------------------
# diff（本機）
# ----------------------------------------------------------------------
def load_res_source(path, prefix=None, exts=resources.DEFAULT_EXTS, tree="Resources"):
    p = Path(path)
    if p.is_dir():
        return resources.load_dir(p, exts), str(p)
    if zipfile.is_zipfile(p):
        pre, files, _ = resources.extract_from_apk(p, prefix, exts, tree=tree)
        return files, "%s!/%s" % (p.name, pre)
    raise SystemExit("不是資料夾也不是 zip/apk：%s" % path)


def load_strings_source(specs, locales):
    """specs：資料夾、單一檔案、locale=檔案，或 APK（取保留標記的原始字串）。"""
    out = {}
    for spec in specs or []:
        loc = None
        if "=" in spec and not Path(spec).exists():
            loc, spec = spec.split("=", 1)
        p = Path(spec)
        if p.is_dir():
            out.update(arsc.load_strings_dir(p, locales))
        elif p.suffix.lower() in (".apk", ".arsc"):
            # 取原始字串（保留遊戲標記），才能跟 strings_raw/、archive/Strings/ 對得上
            raw = arsc.load_arsc(p)
            out.update(arsc.strings_by_locale(raw, locales, normalize_values=False))
        else:
            out[loc or p.stem] = arsc.load_strings_file(p)
    return out


def cmd_diff(a):
    ts = datetime.now(CST)
    locales = a.locale or None
    result = {"meta": {"generatedAt": ts.strftime("%Y-%m-%d %H:%M:%S"), "package": a.package_name,
                       "oldVersion": a.old_version, "newVersion": a.new_version, "notes": []}}
    if a.old_strings or a.new_strings:
        old_s = load_strings_source(a.old_strings, locales)
        new_s = load_strings_source(a.new_strings, locales)
        result["strings"] = diff.diff_strings(old_s, new_s, locales)
    result["trees"] = []
    for name, old_src, new_src, pre, exts in (
            ("Resources", a.old_resources, a.new_resources, a.resources_prefix, resources.DEFAULT_EXTS),
            ("Scripts", a.old_scripts, a.new_scripts, a.scripts_prefix, None)):
        if old_src and new_src:
            old_r, owhere = load_res_source(old_src, pre, exts, name)
            new_r, nwhere = load_res_source(new_src, pre, exts, name)
            result["trees"].append({"name": name, "label": name, "dir": owhere, "prefix": nwhere, "skipped": [],
                                    "diff": diff.diff_resources(old_r, new_r)})
    text = report.render(result)
    if a.out:
        Path(a.out).parent.mkdir(parents=True, exist_ok=True)
        Path(a.out).write_text(text, encoding="utf-8")
        print("Wrote %s" % a.out)
    else:
        md = write_md(result, a.md_dir, ts)
        print("Wrote %s" % md)
    if a.json:
        Path(a.json).write_text(json.dumps(result, ensure_ascii=False, indent=1), encoding="utf-8")
    return 0


# ----------------------------------------------------------------------
# 單項工具
# ----------------------------------------------------------------------
def cmd_accesskey(a):
    sha = apk.sha256_file(a.apk)
    dex.scan_apk(a.apk, a.version, a.package_name, apk_sha=sha, patterns=a.pattern,
                 accesskey_patterns=a.accesskey_regex, context_radius=a.context_radius,
                 out_dir=a.out_dir, public_file=a.public_file)
    return 0


def cmd_strings(a):
    raw = arsc.load_arsc(a.input)
    by_loc = arsc.strings_by_locale(raw, a.locale or None, keep_icons=a.keep_icons)
    n = arsc.write_strings_dir(by_loc, a.out_dir, a.format)
    print("wrote %d locale files -> %s/" % (n, a.out_dir))
    return 0


def cmd_arsc(a):
    data = arsc.load_arsc(a.input)
    value_pool, packages = arsc.walk_table(data)
    rows = arsc.resolve(value_pool, packages, set(a.locale) if a.locale else None)
    if a.grep:
        rx = re.compile(a.grep, re.IGNORECASE)
        rows = [r for r in rows if rx.search(r["value"])]

    def line_of(r):
        if a.format == "strings":
            key = r["res"].split("/", 1)[1] if "/" in r["res"] else r["res"]
            return '"%s" = "%s";' % (arsc.esc_strings(key), arsc.esc_strings(r["value"]))
        return "%s = %s" % (r["res"], r["value"].replace("\n", "\\n"))

    ext = "strings" if a.format == "strings" else "txt"
    out = Path(a.out_dir)
    out.mkdir(parents=True, exist_ok=True)
    (out / "strings.json").write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")
    by_loc = {}
    for r in rows:
        by_loc.setdefault(r["locale"], []).append(r)
    lines = []
    for loc in sorted(by_loc):
        lines.append("===== locale: %s (%d) =====" % (loc, len(by_loc[loc])))
        lines += [line_of(r) for r in sorted(by_loc[loc], key=lambda x: x["res"])]
        lines.append("")
    (out / ("strings.%s" % ext)).write_text("\n".join(lines), encoding="utf-8")
    if a.split:
        loc_dir = out / "by_locale"
        loc_dir.mkdir(parents=True, exist_ok=True)
        for loc, items in by_loc.items():
            (loc_dir / ("%s.%s" % (loc, ext))).write_text(
                "".join(line_of(r) + "\n" for r in sorted(items, key=lambda x: x["res"])), encoding="utf-8")
    if a.dump_pools:
        dump = ["# value-pool (%d)" % len(value_pool)] + value_pool + [""]
        for pkg in packages:
            for label in ("type_names", "key_names"):
                dump += ["# %s/%s (%d)" % (pkg["name"], label, len(pkg[label]))] + pkg[label] + [""]
        (out / "all_pools.txt").write_text("\n".join(dump), encoding="utf-8")
    print("packages: %d, value-pool strings: %d" % (len(packages), len(value_pool)))
    print("string resources: %d across %d locales" % (len(rows), len(by_loc)))
    return 0


# ----------------------------------------------------------------------
def add_dex_args(p):
    p.add_argument("--out-dir", default=env("OUT_DIR", "out"), help="report.json / report.md 輸出目錄 (OUT_DIR)")
    p.add_argument("--public-file", default=env("PUBLIC_FILE", "accesskey.json"), help="(PUBLIC_FILE)")
    p.add_argument("--context-radius", type=int, default=int(env("CONTEXT_RADIUS", "3")))
    p.add_argument("--pattern", action="append", default=[],
                   help="DEX string table 掃描用 regex，可重複")
    p.add_argument("--accesskey-regex", action="append",
                   default=[env("ACCESSKEY_REGEX")] if env("ACCESSKEY_REGEX") else [],
                   help="抽 accesskey 的 regex，取第 1 個捕獲群組 (ACCESSKEY_REGEX)")


def build_parser():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("run", help="完整流程（GitHub Actions）")
    p.add_argument("--history-url", default=env("HISTORY_URL", apk.DEFAULT_HISTORY_URL))
    p.add_argument("--package-name", default=env("PACKAGE_NAME", apk.DEFAULT_PACKAGE))
    p.add_argument("--apk-url", default=env("APK_URL"))
    p.add_argument("--work-dir", default=env("WORK_DIR", "work"))
    add_dex_args(p)
    p.add_argument("--strings-dir", default=env("STRINGS_DIR", "strings"))
    p.add_argument("--strings-format", default=env("STRINGS_FORMAT", "strings"), choices=["strings", "json", "txt"])
    p.add_argument("--strings-keep-icons", action="store_true", default=env_flag("STRINGS_KEEP_ICONS"))
    p.add_argument("--strings-locale", nargs="*", default=env_list("STRINGS_LOCALE"),
                   help="只輸出這些語系（預設全部）(STRINGS_LOCALE)")
    p.add_argument("--raw-strings-dir", default=env("RAW_STRINGS_DIR", "strings_raw"),
                   help="比對用、保留遊戲標記的原始字串（只存 DIFF_LOCALES）；給空字串停用 (RAW_STRINGS_DIR)")
    p.add_argument("--resources-dir", default=env("RESOURCES_DIR", "Resources"), help="repo 內 Resources 鏡像 (RESOURCES_DIR)")
    p.add_argument("--scripts-dir", default=env("SCRIPTS_DIR", "GameScripts"),
                   help="repo 內 Scripts 鏡像（.lua / .luac 全收）。不叫 Scripts/ 是因為 Windows 不分大小寫，會跟程式碼的 scripts/ 撞名；給空字串停用 (SCRIPTS_DIR)")
    p.add_argument("--scripts-prefix", default=env("SCRIPTS_PREFIX"),
                   help="APK 內 Scripts 路徑，預設 assets/Data/Scripts/ (SCRIPTS_PREFIX)")
    p.add_argument("--archive-dir", default=env("ARCHIVE_DIR", "archive"),
                   help="各版本備份：<dir>/Resources/Resources_YYYY-MM-DD/、<dir>/Scripts/Scripts_…/、<dir>/Strings/Strings_…/ (ARCHIVE_DIR)")
    p.add_argument("--no-archive", action="store_true", default=env_flag("NO_ARCHIVE"))
    p.add_argument("--no-archive-strings", action="store_true", default=env_flag("NO_ARCHIVE_STRINGS"),
                   help="只封存 Resources，不封存字串 (NO_ARCHIVE_STRINGS)")
    p.add_argument("--resources-prefix", default=env("RESOURCES_PREFIX"),
                   help="APK 內 Resources 路徑，預設 assets/Data/Resources/，找不到才自動偵測 (RESOURCES_PREFIX)")
    p.add_argument("--resources-ext", nargs="*", default=env_list("RESOURCES_EXT", ".json .lua"),
                   help="要收錄的副檔名 (RESOURCES_EXT)")
    p.add_argument("--md-dir", default=env("MD_DIR", "md"), help="差異報告輸出目錄 (MD_DIR)")
    p.add_argument("--diff-locales", nargs="*", default=env_list("DIFF_LOCALES", "zh-CN zh-TW default"),
                   help="要比對的語系，第一個完整展開、其餘收合 (DIFF_LOCALES)")
    p.add_argument("--no-accesskey", action="store_true", default=env_flag("NO_ACCESSKEY"))
    p.add_argument("--no-strings", action="store_true", default=env_flag("NO_STRINGS"),
                   help="不覆寫 strings/（仍會拿來比對）")
    p.add_argument("--force", action="store_true", default=env_flag("FORCE"), help="版本相同也重跑 (FORCE)")
    p.add_argument("--allow-older", action="store_true", default=env_flag("ALLOW_OLDER"),
                   help="history 最新版比 repo 基準舊時也照跑（會用舊版覆蓋基準，通常不需要）(ALLOW_OLDER)")
    p.add_argument("--keep-apk", action="store_true", default=env_flag("KEEP_APK"))
    p.set_defaults(func=cmd_run)

    p = sub.add_parser("diff", help="本機比對（資料夾 / .zip / .apk）")
    p.add_argument("--old-resources")
    p.add_argument("--new-resources")
    p.add_argument("--resources-prefix")
    p.add_argument("--old-scripts", help="資料夾、.zip 或 .apk")
    p.add_argument("--new-scripts")
    p.add_argument("--scripts-prefix")
    p.add_argument("--old-strings", nargs="*", help="資料夾、檔案、locale=檔案，或 APK")
    p.add_argument("--new-strings", nargs="*")
    p.add_argument("--locale", nargs="*")
    p.add_argument("--old-version")
    p.add_argument("--new-version")
    p.add_argument("--package-name", default=apk.DEFAULT_PACKAGE)
    p.add_argument("--md-dir", default="md")
    p.add_argument("--out", help="指定輸出檔名（不給就寫 md/<時間戳>_<服>.md）")
    p.add_argument("--json", help="另存結構化結果")
    p.set_defaults(func=cmd_diff)

    p = sub.add_parser("accesskey", help="只掃本機 APK 的 DEX")
    p.add_argument("apk")
    p.add_argument("--version", default="local")
    p.add_argument("--package-name", default=apk.DEFAULT_PACKAGE)
    add_dex_args(p)
    p.set_defaults(func=cmd_accesskey)

    p = sub.add_parser("strings", help="從 APK / resources.arsc 產 strings/")
    p.add_argument("input")
    p.add_argument("--out-dir", default="strings")
    p.add_argument("--format", choices=["strings", "json", "txt"], default="strings")
    p.add_argument("--keep-icons", action="store_true")
    p.add_argument("--locale", nargs="*")
    p.set_defaults(func=cmd_strings)

    p = sub.add_parser("arsc", help="arsc 原始傾印")
    p.add_argument("input")
    p.add_argument("--out-dir", default="out_arsc")
    p.add_argument("--locale", nargs="*")
    p.add_argument("--grep")
    p.add_argument("--dump-pools", action="store_true")
    p.add_argument("--split", action="store_true")
    p.add_argument("--format", choices=["txt", "strings"], default="txt")
    p.set_defaults(func=cmd_arsc)
    return ap


def main(argv=None):
    a = build_parser().parse_args(argv)
    return a.func(a) or 0


if __name__ == "__main__":
    sys.exit(main())
