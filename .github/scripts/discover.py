import glob, json, os, re, sys, zipfile

def esc(s):
    return s.replace('%', '%25').replace('\r', '%0D').replace('\n', '%0A')

def notice(title, text):
    print("::notice title=%s::%s" % (title, esc(text[:3800])))

home = os.path.expanduser("~/.gradle")
jar = None
for p in glob.glob(home + "/**/*.jar", recursive=True):
    if os.path.getsize(p) < 10_000_000:
        continue
    try:
        z = zipfile.ZipFile(p)
        if any(n.startswith("data/minecraft/worldgen/structure/") for n in z.namelist()):
            jar = (p, z)
            break
    except Exception:
        pass
if not jar:
    notice("disc-none", "no minecraft jar with worldgen data found")
    sys.exit(0)

path, z = jar
names = z.namelist()
for vn in ("version.json",):
    if vn in names:
        notice("disc-version", z.read(vn).decode("utf-8"))
camp = [n for n in names if re.search(r"camp", n, re.I)]
notice("disc-jar", path + "\n" + str(len(names)) + " entries\n" + "\n".join(camp))

def dump(title, pattern, limit=3800):
    out = []
    for n in names:
        if re.search(pattern, n):
            try:
                out.append("# " + n + "\n" + json.dumps(json.loads(z.read(n)), separators=(",", ":")))
            except Exception:
                out.append("# " + n + " (unreadable)")
    notice(title, "\n".join(out) if out else "no match for " + pattern)

dump("disc-structure", r"^data/minecraft/worldgen/structure/[^/]*camp[^/]*\.json$")
dump("disc-structure-set", r"^data/minecraft/worldgen/structure_set/[^/]*camp[^/]*\.json$")
dump("disc-biome-tag", r"^data/minecraft/tags/worldgen/biome/has_structure/[^/]*camp[^/]*\.json$")
dump("disc-pools", r"^data/minecraft/worldgen/template_pool/.*camp.*\.json$")
# village structure_set as reference for the JSON format
sets = [n for n in names if n.startswith("data/minecraft/worldgen/structure_set/")]
notice("disc-all-sets", "\n".join(sets))
