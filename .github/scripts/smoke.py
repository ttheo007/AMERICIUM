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


RESULTS = []


def note(level, title, text):
    if level == "error":
        print("::%s title=%s::%s" % (level, title, esc(text[:3800])), flush=True)
    else:
        RESULTS.append("[%s] %s" % (title.replace("smoke-", ""), text[:700]))


def flush_results():
    buf = ""
    n = 0
    for r in RESULTS + [""]:
        if r and len(buf) + len(r) < 3500:
            buf += r + "\n"
            continue
        if buf:
            n += 1
            print("::notice title=smoke-result-%d::%s" % (n, esc(buf)), flush=True)
        buf = r + "\n" if r else ""


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
    ("ground", "execute in minecraft:overworld positioned 24 0 24 positioned over world_surface run summon minecraft:marker ~ ~ ~ {Tags:[\"g\"]}"),
    ("ground-pos", "data get entity @e[type=minecraft:marker,tag=g,limit=1] Pos"),
    ("place", "RETRY execute in minecraft:overworld run place structure americium:store 24 80 24"),
    ("wait", None),
    ("zone-markers", "execute in minecraft:overworld if entity @e[type=minecraft:marker,tag=am_zone_marker]"),
    ("villagers", "execute in minecraft:overworld if entity @e[type=minecraft:villager]"),
    ("minecarts", "execute in minecraft:overworld if entity @e[type=minecraft:minecart]"),
    ("item-displays", "execute in minecraft:overworld if entity @e[type=minecraft:item_display,tag=am_shelf]"),
    ("text-displays", "execute in minecraft:overworld if entity @e[type=minecraft:text_display]"),
    ("no-ai", "data get entity @e[type=minecraft:villager,tag=am_npc,limit=1] NoAI"),
    ("clerk-pos-1", "data get entity @e[type=minecraft:villager,tag=am_stocker,limit=1] Pos"),
    ("pet-shop", "data get entity @e[type=minecraft:villager,name=\"Pet Shop\",limit=1] Offers.Recipes[0]"),
    ("label", "data get entity @e[type=minecraft:text_display,limit=1] text"),
    ("transform", "data get entity @e[type=minecraft:item_display,limit=1] transformation"),
    ("barrel", "execute as @e[type=minecraft:item_display,tag=am_shelf,limit=1] at @s positioned ~ ~-3 ~ run data get block ~ ~ ~ Items"),
    ("barrel-clear", "execute as @e[type=minecraft:item_display,tag=am_shelf,limit=1] at @s positioned ~ ~-3 ~ run item replace block ~ ~ ~ container.0 with minecraft:air"),
    ("barrel-empty", "execute as @e[type=minecraft:item_display,tag=am_shelf,limit=1] at @s positioned ~ ~-3 ~ run data get block ~ ~ ~ Items"),
    ("restock-one", "execute as @e[type=minecraft:item_display,tag=am_shelf,limit=1] at @s run function americium:restock_one with entity @s item"),
    ("barrel-after", "execute as @e[type=minecraft:item_display,tag=am_shelf,limit=1] at @s positioned ~ ~-3 ~ run data get block ~ ~ ~ Items"),
    ("gate-in-store", "execute as @e[type=minecraft:marker,tag=am_exit_gate,limit=1] at @s if predicate americium:in_store run summon minecraft:marker ~ ~ ~ {Tags:[\"inz\"]}"),
    ("gate-in-store-check", "execute if entity @e[type=minecraft:marker,tag=inz]"),
    ("lot-in-store", "execute as @e[type=minecraft:marker,tag=g,limit=1] at @s if predicate americium:in_store run summon minecraft:marker ~ ~ ~ {Tags:[\"inl\"]}"),
    ("lot-in-store-check", "execute if entity @e[type=minecraft:marker,tag=inl]"),
    ("nat-forceload", "forceload add -1100 -400 -1040 -340"),
    ("nat-wait", 45),
    ("nat-in-store", "execute in minecraft:overworld positioned -1072 0 -368 positioned over world_surface if predicate americium:in_store run summon minecraft:marker ~ ~ ~ {Tags:[\"nat\"]}"),
    ("nat-check", "execute if entity @e[type=minecraft:marker,tag=nat]"),
    ("nat-villagers", "execute in minecraft:overworld positioned -1072 0 -368 if entity @e[type=minecraft:villager,distance=..80]"),
    ("far-not-in-store", "execute in minecraft:overworld positioned 5000 100 5000 if predicate americium:in_store"),
    ("objectives", "scoreboard objectives list"),
    ("slow-run", "function americium:slow"),
    ("wait-move", 25),
    ("clerk-pos-2", "data get entity @e[type=minecraft:villager,tag=am_stocker,limit=1] Pos"),
    ("LAYERS", None),
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
flush_results()
