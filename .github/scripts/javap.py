"""Prints method signatures of Minecraft classes (for writing a mixin) as annotations."""
import glob, os, re, subprocess, zipfile

def esc(s):
    return s.replace('%', '%25').replace('\r', '%0D').replace('\n', '%0A')

def notice(title, text):
    print("::notice title=%s::%s" % (title, esc(text[:3800])), flush=True)

home = os.path.expanduser("~/.gradle")
jars = glob.glob(home + "/**/minecraft-merged.jar", recursive=True)
if not jars:
    notice("jp-none", "no minecraft-merged.jar found")
    raise SystemExit(0)
jar = jars[0]

def javap(cls, pattern=None):
    out = subprocess.run(["javap", "-p", "-cp", jar, cls], capture_output=True, text=True).stdout
    lines = [l.strip() for l in out.splitlines() if l.strip()]
    if pattern:
        lines = [l for l in lines if re.search(pattern, l) or l.startswith("public class") or l.startswith("public abstract class")]
    return "\n".join(lines)

notice("jp-crafting-menu", javap("net.minecraft.world.inventory.CraftingMenu"))
notice("jp-inventory-menu", javap("net.minecraft.world.inventory.InventoryMenu", r"slotsChanged|Craft|craft|\(.*Player"))
notice("jp-result-slot", javap("net.minecraft.world.inventory.ResultSlot"))
notice("jp-entity-tags", javap("net.minecraft.world.entity.Entity", r"[Tt]ags"))
notice("jp-player", javap("net.minecraft.world.entity.player.Player", r"isCreative|isSpectator|getTags"))

hits = []
mix = []
for p in glob.glob(home + "/**/*.jar", recursive=True):
    try:
        z = zipfile.ZipFile(p)
    except Exception:
        continue
    base = os.path.basename(p)
    if not base.startswith("fabric-"):
        continue
    for n in z.namelist():
        if re.search(r"Craft", n) and n.endswith(".class") and "fabric/api" in n:
            hits.append(base + " : " + n)
        if n.endswith(".mixins.json") and not mix:
            mix.append(base + " : " + n + "\n" + z.read(n).decode()[:900])
notice("jp-fabric-craft", "\n".join(sorted(set(hits))[:40]) or "no Craft classes in the Fabric API api packages")
notice("jp-mixin-sample", "\n".join(mix) or "no mixins.json found")
