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
    ("forceload", "forceload add -64 -64 112 112"),
    ("wait-load", 30),
    ("loaded-q", "forceload query 0 0"),
    ("loaded-if", "execute in minecraft:overworld if loaded 24 80 24"),
    ("place", "RETRY execute in minecraft:overworld run place structure americium:store 24 80 24"),
    ("wait", None),
    ("pos", "data get entity @e[type=minecraft:villager,limit=1,sort=nearest,x=24,y=80,z=24] Pos"),
    ("COUNT", None),
    ("probe", "execute in minecraft:overworld if block 28 61 8 minecraft:light_gray_concrete"),
    ("template-place", "RETRY execute in minecraft:overworld run place template americium:store/main 8 150 8"),
    ("COUNT2", None),
    ("villager-count", "execute in minecraft:overworld if entity @e[type=minecraft:villager]"),
    ("offers", "data get entity @e[type=minecraft:villager,limit=1,sort=nearest,x=24,y=80,z=24] Offers"),
    ("name", "data get entity @e[type=minecraft:villager,limit=1,sort=nearest,x=24,y=80,z=24] CustomName"),
    ("locate", "locate structure americium:store"),
    ("old-camp", "locate structure minecraft:abandoned_camp_forest"),
]
for title, cmd in cmds:
    if title in ("COUNT", "COUNT2"):
        totals = {}
        yrange = range(0, 192, 8) if title == "COUNT" else range(144, 176, 8)
        for blk in ("gray_concrete", "light_gray_concrete", "blue_concrete", "white_concrete", "sea_lantern"):
            n = 0
            for y0 in yrange:
                try:
                    _, o = rcon(s, 2, 2, "execute in minecraft:overworld run fill 0 %d 0 63 %d 63 minecraft:air replace minecraft:%s" % (y0, y0 + 7, blk))
                except Exception as e:  # noqa
                    o = ""
                m = re.search(r"filled (\d+)", o)
                if m:
                    n += int(m.group(1))
            totals[blk] = n
        note("notice", "smoke-blocks-" + title, "blocks found after place (x 0..63, z 0..63, y 0..191): %r" % totals)
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
