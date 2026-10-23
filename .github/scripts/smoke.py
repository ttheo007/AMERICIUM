"""Starts a dedicated server with the mod, runs a few commands over RCON and
prints the results as GitHub annotations. Exit code is 1 if the server fails."""
import os, re, socket, struct, subprocess, sys, time

RUN = "run"
os.makedirs(RUN, exist_ok=True)
open(RUN + "/eula.txt", "w").write("eula=true\n")
open(RUN + "/server.properties", "w").write("\n".join([
    "online-mode=false", "enable-rcon=true", "rcon.port=25575", "rcon.password=ci",
    "level-seed=1234", "view-distance=4", "simulation-distance=4",
    "spawn-protection=0", "pause-when-empty-seconds=-1", "motd=ci", ""]))


def esc(s):
    return s.replace('%', '%25').replace('\r', '%0D').replace('\n', '%0A')


def note(level, title, text):
    print("::%s title=%s::%s" % (level, title, esc(text[:3800])), flush=True)


log = open("server.log", "w")
proc = subprocess.Popen(["gradle", "runServer", "--no-daemon", "--console=plain"],
                        stdout=log, stderr=subprocess.STDOUT)


def read_log():
    return open("server.log", errors="replace").read()


deadline = time.time() + 420
started = False
while time.time() < deadline and proc.poll() is None:
    if re.search(r"Done \(", read_log()):
        started = True
        break
    time.sleep(3)

if not started:
    txt = read_log()
    note("error", "smoke-start-failed", "\n".join(txt.splitlines()[-40:]))
    proc.kill()
    sys.exit(1)


def rcon(sock, rid, ptype, body):
    data = struct.pack("<ii", rid, ptype) + body.encode() + b"\x00\x00"
    sock.sendall(struct.pack("<i", len(data)) + data)
    raw = b""
    while len(raw) < 4:
        raw += sock.recv(4 - len(raw))
    n = struct.unpack("<i", raw)[0]
    buf = b""
    while len(buf) < n:
        buf += sock.recv(n - len(buf))
    return struct.unpack("<ii", buf[:8]), buf[8:-2].decode(errors="replace")


s = socket.create_connection(("127.0.0.1", 25575), timeout=120)
rcon(s, 1, 3, "ci")
cmds = [
    ("forceload", "forceload add -96 -96 128 128"),
    ("wait-load", 40),
    ("ground", "execute in minecraft:overworld positioned 24 0 24 over world_surface run summon minecraft:marker ~ ~ ~ {Tags:[\"g\"]}"),
    ("ground-pos", "data get entity @e[type=minecraft:marker,tag=g,limit=1] Pos"),
    ("place", "RETRY execute in minecraft:overworld run place structure americium:store 24 80 24"),
    ("wait", None),
    ("villager-count", "execute in minecraft:overworld if entity @e[type=minecraft:villager]"),
    ("minecarts", "execute in minecraft:overworld if entity @e[type=minecraft:minecart]"),
    ("cashier-pos", "data get entity @e[type=minecraft:villager,name=\"Cashier\",limit=1] Pos"),
    ("grocery", "data get entity @e[type=minecraft:villager,name=\"Grocery\",limit=1] Offers[0]"),
    ("netherite", "data get entity @e[type=minecraft:villager,name=\"Netherite Shop\",limit=1] Offers[1]"),
    ("exchange", "data get entity @e[type=minecraft:villager,name=\"Currency Exchange\",limit=1] Offers[7]"),
    ("LAYERS", None),
    ("COUNT", None),
    ("locate", "locate structure americium:store"),
    ("old-camp", "locate structure minecraft:abandoned_camp_forest"),
]
for title, cmd in cmds:
    if title == "LAYERS":
        layers = {}
        for y in range(40, 111):
            n = 0
            for (xa, xb) in ((-96, 16), (17, 128)):
                try:
                    _, o = rcon(s, 2, 2, "execute in minecraft:overworld run fill %d %d -96 %d %d 128 minecraft:air replace minecraft:gray_concrete" % (xa, y, xb, y))
                except Exception:
                    o = ""
                m = re.search(r"filled (\d+)", o)
                if m:
                    n += int(m.group(1))
            if n:
                layers[y] = n
        note("notice", "smoke-apron-layers", "gray_concrete (apron, the floor level) per y: %r" % layers)
        continue
    if title == "COUNT":
        totals = {}
        for blk in ("light_gray_concrete", "blue_concrete", "glowstone", "polished_andesite", "barrel"):
            n = 0
            for y0 in range(40, 111):
                for (xa, xb) in ((-96, 16), (17, 128)):
                    try:
                        _, o = rcon(s, 2, 2, "execute in minecraft:overworld run fill %d %d -96 %d %d 128 minecraft:air replace minecraft:%s" % (xa, y0, xb, y0, blk))
                    except Exception:
                        o = ""
                    m = re.search(r"filled (\d+)", o)
                    if m:
                        n += int(m.group(1))
            totals[blk] = n
        note("notice", "smoke-blocks", "blocks found: %r" % totals)
        continue
    if cmd is None or isinstance(cmd, int):
        time.sleep(cmd or 5)
        continue
    retry = cmd.startswith("RETRY ")
    if retry:
        cmd = cmd[6:]
    out = ""
    for attempt in range(8 if retry else 1):
        try:
            _, out = rcon(s, 2, 2, cmd)
        except Exception as e:  # noqa
            out = "rcon error: %r" % (e,)
        if not (retry and "not loaded" in out):
            break
        time.sleep(10)
    out = "(attempts: %d) %s" % (attempt + 1, out)
    note("notice", "smoke-" + title, cmd + "\n=> " + out)
try:
    rcon(s, 3, 2, "stop")
except Exception:
    pass
try:
    proc.wait(timeout=90)
except Exception:
    proc.kill()

txt = read_log()
bad = [l for l in txt.splitlines() if re.search(r"\[(ERROR|WARN)\]|Exception|Failed to|Couldn't|Unknown|Invalid", l)]
note("warning" if bad else "notice", "smoke-log", "\n".join(bad[:40]) if bad else "no warnings or errors in server log")
