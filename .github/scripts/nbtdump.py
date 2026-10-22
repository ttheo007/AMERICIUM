import glob, gzip, io, os, re, struct, sys, zipfile

def esc(s):
    return s.replace('%', '%25').replace('\r', '%0D').replace('\n', '%0A')

class R:
    def __init__(s, b): s.b, s.i = b, 0
    def u(s, f):
        n = struct.calcsize(f); v = struct.unpack_from(f, s.b, s.i)[0]; s.i += n; return v
    def st(s):
        n = s.u(">H"); v = s.b[s.i:s.i+n].decode(); s.i += n; return v

NAMES = {1: "byte", 2: "short", 3: "int", 4: "long", 5: "float", 6: "double", 7: "bytearr", 8: "str", 9: "list", 10: "compound", 11: "intarr", 12: "longarr"}

def payload(r, t, depth, lines, limit=2):
    pad = "  " * depth
    if t == 1: return r.u(">b")
    if t == 2: return r.u(">h")
    if t == 3: return r.u(">i")
    if t == 4: return r.u(">q")
    if t == 5: return r.u(">f")
    if t == 6: return r.u(">d")
    if t == 8: return repr(r.st())
    if t == 7:
        n = r.u(">i"); r.i += n; return "bytearr[%d]" % n
    if t == 11:
        n = r.u(">i"); r.i += 4 * n; return "intarr[%d]" % n
    if t == 12:
        n = r.u(">i"); r.i += 8 * n; return "longarr[%d]" % n
    if t == 9:
        et = r.u(">b"); n = r.u(">i")
        lines.append("%s<list of %s, len %d>" % (pad, NAMES.get(et, et), n))
        for k in range(n):
            if k < limit:
                lines.append("%s  [%d]" % (pad, k))
                v = payload(r, et, depth + 2, lines, limit)
                if v is not None: lines.append("%s    = %s" % (pad, v))
            else:
                skip(r, et)
        return None
    if t == 10:
        while True:
            tt = r.u(">b")
            if tt == 0: break
            name = r.st()
            lines.append("%s%s: %s" % (pad, name, NAMES.get(tt, tt)))
            v = payload(r, tt, depth + 1, lines, limit)
            if v is not None: lines.append("%s   = %s" % (pad, v))
        return None

def skip(r, t):
    payload(r, t, 0, [], 0)

def dump(b):
    r = R(b); t = r.u(">b"); r.st(); lines = []
    payload(r, t, 0, lines); return "\n".join(lines)

home = os.path.expanduser("~/.gradle")
jar = None
for p in glob.glob(home + "/**/*.jar", recursive=True):
    if os.path.getsize(p) < 10_000_000: continue
    try:
        z = zipfile.ZipFile(p)
        if any(n.startswith("data/minecraft/worldgen/structure/") for n in z.namelist()):
            jar = z; break
    except Exception: pass
names = jar.namelist()
cand = [n for n in names if n.startswith("data/minecraft/structure/abandoned_camp/") and n.endswith(".nbt")][:1]
cand += [n for n in names if n.startswith("data/minecraft/structure/village/plains/houses/") and n.endswith(".nbt")][:1]
for n in cand:
    print("::notice title=nbt-vanilla::%s" % esc((n + "\n" + dump(gzip.decompress(jar.read(n))))[:3800]))
mine = "src/main/resources/data/americium/structure/store/main.nbt"
print("::notice title=nbt-mine::%s" % esc(("mine\n" + dump(gzip.open(mine).read()))[:3800]))
