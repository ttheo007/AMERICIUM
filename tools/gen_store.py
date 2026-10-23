#!/usr/bin/env python3
"""Generates the superstore as a vanilla structure template (NBT).

Usage: python3 tools/gen_store.py <DataVersion>
Writes: src/main/resources/data/americium/structure/store/main.nbt

Coordinates in this script are relative to the store floor: ry = 0 is the floor,
ry = -FOUND .. -1 is the foundation under it. The worldgen JSON uses
start_height = -FOUND, so the floor ends up level with the surface.
The front (parking lot and sign) is at z = 0. The sign text is mirrored along x on
purpose: a viewer in front of the building looks towards +z, and +x is then on the
viewer's left.
"""
import gzip
import os
import random
import struct
import sys

# ----------------------------------------------------------------------------
# Minimal NBT writer
# ----------------------------------------------------------------------------
TAG_BYTE, TAG_INT, TAG_FLOAT, TAG_DOUBLE, TAG_STRING, TAG_LIST, TAG_COMPOUND = 1, 3, 5, 6, 8, 9, 10


class B:  # byte
    def __init__(self, v): self.v = v


class I:  # int
    def __init__(self, v): self.v = v


class F:  # float
    def __init__(self, v): self.v = v


class D:  # double
    def __init__(self, v): self.v = v


class L:  # list with explicit element type
    def __init__(self, tag, items): self.tag, self.items = tag, items


def tag_of(v):
    if isinstance(v, B): return TAG_BYTE
    if isinstance(v, I): return TAG_INT
    if isinstance(v, F): return TAG_FLOAT
    if isinstance(v, D): return TAG_DOUBLE
    if isinstance(v, str): return TAG_STRING
    if isinstance(v, L): return TAG_LIST
    if isinstance(v, dict): return TAG_COMPOUND
    raise TypeError(type(v))


def w_str(out, s):
    b = s.encode("utf-8")
    out += struct.pack(">H", len(b)) + b


def w_payload(out, v):
    if isinstance(v, B): out += struct.pack(">b", v.v)
    elif isinstance(v, I): out += struct.pack(">i", v.v)
    elif isinstance(v, F): out += struct.pack(">f", v.v)
    elif isinstance(v, D): out += struct.pack(">d", v.v)
    elif isinstance(v, str): w_str(out, v)
    elif isinstance(v, L):
        out += struct.pack(">b", v.tag) + struct.pack(">i", len(v.items))
        for it in v.items:
            w_payload(out, it)
    elif isinstance(v, dict):
        for k, val in v.items():
            out += struct.pack(">b", tag_of(val))
            w_str(out, k)
            w_payload(out, val)
        out += b"\x00"
    else:
        raise TypeError(type(v))


def nbt_bytes(root):
    out = bytearray()
    out += struct.pack(">b", TAG_COMPOUND)
    w_str(out, "")
    w_payload(out, root)
    return bytes(out)


# ----------------------------------------------------------------------------
# Dimensions
# ----------------------------------------------------------------------------
FOUND = 4                        # foundation layers below the floor
SX, SZ = 95, 82                  # template size in x and z
SY = FOUND + 17                  # template height
WX0, WX1 = 1, 94                 # building walls, x range (WX1 exclusive)
WZ0, WZ1 = 26, 82                # building walls, z range (WZ1 exclusive)
ROOF = 9                         # roof layer (relative to the floor)
FACADE = 15                      # top of the front facade
cx = (WX0 + WX1) // 2            # centre x of the building

rng = random.Random(20261023)

blocks = {}                      # (x, y, z) -> state key, y already includes FOUND


def state(name, **props):
    return ("minecraft:" + name, tuple(sorted((k, str(v)) for k, v in props.items())))


def put(x, ry, z, st):
    assert 0 <= x < SX and 0 <= z < SZ and -FOUND <= ry < SY - FOUND, (x, ry, z)
    blocks[(x, ry + FOUND, z)] = st


AIR = state("air")
FOUNDATION = state("stone_bricks")
APRON = state("gray_concrete")
LINE = state("white_concrete")
SIDEWALK = state("light_gray_concrete")
CURB = state("stone_bricks")
TILE_A = state("light_gray_concrete")
TILE_B = state("white_concrete")
WALL = state("white_concrete")
BAND = state("blue_concrete")
LETTER = state("white_concrete")
SPARK = state("yellow_concrete")
GLASS = state("glass")
ROOFB = state("light_gray_concrete")
LAMP = state("sea_lantern")
COUNTER = state("smooth_stone")
SLAB = state("smooth_stone_slab", type="bottom")
BARREL = state("barrel", facing="up")
TRIM = state("stone_bricks")
BLACK = state("black_concrete")
POLE = state("polished_andesite")
WHEEL = state("black_concrete")
HEADLIGHT = state("glowstone")
TAILLIGHT = state("red_concrete")

# ----------------------------------------------------------------------------
# Foundation, parking lot, sidewalk
# ----------------------------------------------------------------------------
for x in range(SX):
    for z in range(SZ):
        for ry in range(-FOUND, 0):
            put(x, ry, z, FOUNDATION)

for x in range(SX):
    for z in range(0, WZ0):
        put(x, 0, z, APRON)
        for ry in range(1, 7):
            put(x, ry, z, AIR)          # clears trees on the lot

# sidewalk (3 deep) and curb in front of the building
for x in range(0, SX):
    put(x, 0, WZ0 - 4, CURB)
    for z in range(WZ0 - 3, WZ0):
        put(x, 0, z, SIDEWALK)

# parking rows: row A z 1..5, row B z 9..13, row C z 17..21 (cars are 5 long)
ROWS = [1, 9, 17]
CAR_X0 = [3 + 5 * i for i in range(18)]          # cars are 3 wide, 2 gap
for z0 in ROWS:
    for x0 in CAR_X0:
        for z in range(z0, z0 + 5):
            put(x0 - 1, 0, z, LINE)
for x0 in CAR_X0[-1:]:
    for z0 in ROWS:
        for z in range(z0, z0 + 5):
            put(x0 + 3 + 1, 0, z, LINE)

CAR_COLORS = ["red", "blue", "white", "black", "yellow", "lime", "orange", "gray",
              "light_blue", "purple", "cyan", "brown", "magenta", "green", "light_gray"]


def car(x0, z0, color, forward):
    """3 wide (x), 5 long (z). forward = +1: nose towards +z, -1: nose towards -z."""
    body = state(color + "_concrete")

    def zz(k):                       # k = 0 is the tail, 4 is the nose
        return z0 + k if forward > 0 else z0 + 4 - k

    for dx in range(3):
        for k in range(5):
            put(x0 + dx, 1, zz(k), body)
            put(x0 + dx, 2, zz(k), body)
    for dx in (0, 2):                # wheels
        for k in (1, 3):
            put(x0 + dx, 1, zz(k), WHEEL)
        put(x0 + dx, 2, zz(4), HEADLIGHT)
        put(x0 + dx, 2, zz(0), TAILLIGHT)
    for dx in range(3):              # trunk lid, cabin, roof
        put(x0 + dx, 3, zz(0), body)
        for k in (1, 2, 3):
            put(x0 + dx, 3, zz(k), GLASS)
            put(x0 + dx, 4, zz(k), body)


for ri, z0 in enumerate(ROWS):
    for x0 in CAR_X0:
        if rng.random() < 0.3:
            continue
        car(x0, z0, rng.choice(CAR_COLORS), 1 if ri % 2 == 0 else -1)

# lamp posts in the lanes
for lane_z in (7, 15):
    for x in (14, 39, 64, 89):
        for ry in range(1, 7):
            put(x, ry, lane_z, POLE)
        put(x, 7, lane_z, LAMP)

# ----------------------------------------------------------------------------
# Building shell
# ----------------------------------------------------------------------------
for x in range(WX0, WX1):
    for z in range(WZ0, WZ1):
        edge = x in (WX0, WX1 - 1) or z in (WZ0, WZ1 - 1)
        put(x, 0, z, TILE_A if ((x // 4) + (z // 4)) % 2 == 0 else TILE_B)
        for ry in range(1, ROOF):
            put(x, ry, z, WALL if edge else AIR)
        put(x, ROOF, z, ROOFB)
        if edge:
            put(x, ROOF + 1, z, TRIM)

# blue stripe along the side and back walls
for x in range(WX0, WX1):
    for z in range(WZ0, WZ1):
        if x in (WX0, WX1 - 1) or z == WZ1 - 1:
            put(x, 5, z, BAND)
            put(x, 6, z, BAND)

# front facade: blue band up to FACADE, glass storefront, entrance
for x in range(WX0, WX1):
    for ry in range(ROOF, FACADE + 1):
        put(x, ry, WZ0, WALL)
    for ry in range(5, FACADE + 1):
        put(x, ry, WZ0, BAND)
for x in range(WX0 + 3, WX1 - 3):
    for ry in range(1, 5):
        put(x, ry, WZ0, GLASS)
for dx in range(-3, 3):                       # 6 wide entrance
    for ry in range(1, 4):
        put(cx + dx, ry, WZ0, AIR)

# pixel sign: "AMERICIUM" + spark, 3x5 font drawn at scale 2
FONT = {
    "A": ["010", "101", "111", "101", "101"],
    "M": ["101", "111", "111", "101", "101"],
    "E": ["111", "100", "110", "100", "111"],
    "R": ["110", "101", "110", "101", "101"],
    "I": ["111", "010", "010", "010", "111"],
    "C": ["111", "100", "100", "100", "111"],
    "U": ["101", "101", "101", "101", "111"],
}
TEXT = "AMERICIUM"
SPARK_PIX = ["10101", "01110", "11111", "01110", "10101"]
SCALE = 2
ADV = 3 * SCALE + SCALE                       # letter width + gap
text_w = len(TEXT) * ADV - SCALE              # 70
total_w = text_w + 2 * SCALE + 5 * SCALE      # text + gap + spark = 84
start_view = (WX1 - WX0 - total_w) // 2
left_x = WX1 - 1 - start_view                 # viewer-left = largest x
SIGN_TOP = 14


def draw(pixels, col0, fill):
    for r, row in enumerate(pixels):
        for c, ch in enumerate(row):
            if ch != "1":
                continue
            for dx in range(SCALE):
                for dy in range(SCALE):
                    put(left_x - (col0 + c * SCALE + dx), SIGN_TOP - (r * SCALE + dy), WZ0, fill)


for i, letter in enumerate(TEXT):
    draw(FONT[letter], i * ADV, LETTER)
draw(SPARK_PIX, text_w + 2 * SCALE, SPARK)

# ceiling lights
for x in range(WX0 + 3, WX1 - 2, 6):
    for z in range(WZ0 + 3, WZ1 - 2, 6):
        put(x, ROOF, z, LAMP)

# checkout lanes
LANES = [WX0 + 6 + 11 * k for k in range(8)]
CASHIER_POS = []
for x in LANES:
    for dx in range(4):
        put(x + dx, 1, WZ0 + 6, COUNTER)
    put(x, 2, WZ0 + 6, BLACK)
    CASHIER_POS.append((x + 1, 1, WZ0 + 7))

# shelf rows with colourful goods
WOOLS = ["red", "yellow", "lime", "orange", "light_blue", "pink", "white", "cyan", "purple"]
SHELF_Z0 = [WZ0 + 14 + 6 * k for k in range(5)]
for row, z0 in enumerate(SHELF_Z0):
    for x in range(WX0 + 4, WX1 - 4):
        if (x - WX0) % 12 >= 9:
            continue                            # cross aisle
        wool = state(WOOLS[(x // 3 + row) % len(WOOLS)] + "_wool")
        for z in (z0, z0 + 1):
            put(x, 1, z, BARREL)
            put(x, 2, z, wool)
            put(x, 3, z, SLAB)

# ----------------------------------------------------------------------------
# Trading
# ----------------------------------------------------------------------------
BRONZE = "americium:americium_coin"           # worth 1
SILVER = "americium:americium_silver_coin"    # worth 10
GOLD = "americium:americium_gold_coin"        # worth 100


def item(i, count):
    return {"id": i, "count": I(count)}


def coin_stacks(units):
    g, rem = divmod(units, 100)
    s, b = divmod(rem, 10)
    stacks = []
    if g: stacks.append((GOLD, g))
    if s: stacks.append((SILVER, s))
    if b: stacks.append((BRONZE, b))
    assert 1 <= len(stacks) <= 2, "price %d needs more than two coin types" % units
    return stacks


def trade(buy, sell):
    """buy / sell: lists of (id, count); at most two buy stacks, one sell stack."""
    assert len(buy) <= 2 and len(sell) == 1
    t = {
        "buy": item(*buy[0]),
        "sell": item(*sell[0]),
        "maxUses": I(9999999),
        "uses": I(0),
        "xp": I(0),
        "rewardExp": B(0),
        "priceMultiplier": F(0.0),
        "demand": I(0),
        "specialPrice": I(0),
    }
    if len(buy) == 2:
        t["buyB"] = item(*buy[1])
    return t


def sell_for(units, product, count=1):
    return trade(coin_stacks(units), [("minecraft:" + product, count)])


def exchange(give, give_n, get, get_n):
    return trade([(give, give_n)], [(get, get_n)])


# Prices are in bronze coins (1 emerald = 10). Change them here and regenerate.
DEPARTMENTS = [
    ("Netherite Shop", "armorer", "black", [
        ("netherite_scrap", 1, 160), ("netherite_ingot", 1, 450),
        ("netherite_upgrade_smithing_template", 1, 300),
        ("netherite_helmet", 1, 520), ("netherite_chestplate", 1, 640),
        ("netherite_leggings", 1, 600), ("netherite_boots", 1, 500),
        ("netherite_sword", 1, 520), ("netherite_pickaxe", 1, 520),
        ("netherite_axe", 1, 520), ("netherite_shovel", 1, 400), ("netherite_hoe", 1, 360)]),
    ("Grocery", "butcher", "orange", [
        ("bread", 3, 10), ("apple", 3, 10), ("cooked_beef", 2, 20),
        ("cooked_porkchop", 2, 20), ("cooked_chicken", 2, 20), ("baked_potato", 4, 10),
        ("golden_carrot", 1, 40), ("cake", 1, 60), ("pumpkin_pie", 1, 30),
        ("cookie", 8, 10), ("milk_bucket", 1, 30)]),
    ("Clothing", "shepherd", "pink", [
        ("leather_helmet", 1, 30), ("leather_chestplate", 1, 50),
        ("leather_leggings", 1, 40), ("leather_boots", 1, 30),
        ("white_wool", 4, 20), ("shears", 1, 20), ("white_bed", 1, 40),
        ("leather_horse_armor", 1, 60)]),
    ("Electronics", "toolsmith", "yellow", [
        ("redstone", 8, 10), ("repeater", 1, 20), ("comparator", 1, 30),
        ("piston", 1, 30), ("sticky_piston", 1, 50), ("observer", 1, 40),
        ("hopper", 1, 50), ("daylight_detector", 1, 60), ("note_block", 1, 30),
        ("jukebox", 1, 120), ("redstone_lamp", 1, 30), ("lever", 2, 10)]),
    ("Pharmacy", "cleric", "white", [
        ("golden_apple", 1, 200), ("honey_bottle", 1, 30),
        ("glistering_melon_slice", 1, 40), ("sweet_berries", 4, 10),
        ("dried_kelp", 8, 10), ("rabbit_stew", 1, 40), ("mushroom_stew", 1, 20),
        ("beetroot_soup", 1, 20)]),
    ("Garden Center", "farmer", "lime", [
        ("wheat_seeds", 8, 10), ("beetroot_seeds", 8, 10), ("pumpkin_seeds", 4, 10),
        ("melon_seeds", 4, 10), ("oak_sapling", 2, 10), ("birch_sapling", 2, 10),
        ("bone_meal", 8, 20), ("iron_hoe", 1, 30), ("water_bucket", 1, 30),
        ("poppy", 4, 10), ("sunflower", 2, 10), ("hay_block", 1, 30), ("composter", 1, 30)]),
    ("Pet Shop", "leatherworker", "brown", [
        ("wolf_spawn_egg", 1, 400), ("cat_spawn_egg", 1, 300),
        ("parrot_spawn_egg", 1, 350), ("rabbit_spawn_egg", 1, 100),
        ("horse_spawn_egg", 1, 500), ("bone", 8, 10), ("lead", 1, 20),
        ("name_tag", 1, 60), ("saddle", 1, 300)]),
    ("Sporting Goods", "fisherman", "light_blue", [
        ("bow", 1, 40), ("arrow", 16, 20), ("crossbow", 1, 60), ("shield", 1, 50),
        ("fishing_rod", 1, 30), ("spyglass", 1, 120), ("compass", 1, 40),
        ("clock", 1, 40), ("snowball", 16, 10)]),
    ("Auto Center", "weaponsmith", "gray", [
        ("minecart", 1, 60), ("rail", 16, 60), ("powered_rail", 6, 80),
        ("detector_rail", 6, 60), ("oak_boat", 1, 20), ("carrot_on_a_stick", 1, 40),
        ("firework_rocket", 3, 30), ("elytra", 1, 2000)]),
    ("Books & Stationery", "librarian", "purple", [
        ("book", 1, 20), ("paper", 8, 10), ("writable_book", 1, 40),
        ("ink_sac", 2, 10), ("feather", 4, 10), ("lectern", 1, 40),
        ("bookshelf", 1, 40), ("map", 1, 20)]),
    ("Home & Furniture", "mason", "red", [
        ("chest", 1, 20), ("barrel", 1, 20), ("lantern", 1, 30), ("candle", 2, 10),
        ("flower_pot", 1, 10), ("painting", 1, 20), ("item_frame", 1, 20),
        ("crafting_table", 1, 20), ("furnace", 1, 20), ("glass", 8, 10),
        ("oak_door", 3, 10), ("ladder", 8, 10)]),
    ("Jewelry", "cleric", "cyan", [
        ("gold_ingot", 1, 40), ("diamond", 1, 100), ("emerald", 1, 20),
        ("amethyst_shard", 1, 20), ("lapis_lazuli", 4, 10), ("quartz", 4, 10),
        ("iron_ingot", 2, 10), ("copper_ingot", 4, 10)]),
    ("Villager Market", "fletcher", "magenta", [
        ("villager_spawn_egg", 1, 600)]),
]

CHANGE = [
    exchange(BRONZE, 10, SILVER, 1), exchange(SILVER, 10, GOLD, 1),
    exchange(SILVER, 1, BRONZE, 10), exchange(GOLD, 1, SILVER, 10),
]
BANK = CHANGE + [
    exchange("minecraft:emerald", 1, SILVER, 1),
    exchange("minecraft:diamond", 1, SILVER, 6),
    exchange("minecraft:gold_ingot", 1, SILVER, 3),
    exchange("minecraft:netherite_ingot", 1, GOLD, 4),
]


def villager(name, profession, offers, pos, rot, vtype="plains", level=5, silent=True):
    nbt = {
        "id": "minecraft:villager",
        "NoAI": B(1),
        "Invulnerable": B(1),
        "PersistenceRequired": B(1),
        "Silent": B(1 if silent else 0),
        "Rotation": L(TAG_FLOAT, [F(rot), F(0.0)]),
        "VillagerData": {
            "level": I(level),
            "profession": "minecraft:" + profession,
            "type": "minecraft:" + vtype,
        },
    }
    if name:
        nbt["CustomName"] = name
        nbt["CustomNameVisible"] = B(1)
    if offers:
        nbt["Xp"] = I(1000)
        nbt["Offers"] = {"Recipes": L(TAG_COMPOUND, offers)}
    bx, by, bz = pos
    return {
        "pos": L(TAG_DOUBLE, [D(bx + 0.5), D(by + FOUND), D(bz + 0.5)]),
        "blockPos": L(TAG_INT, [I(bx), I(by + FOUND), I(bz)]),
        "nbt": nbt,
    }


entities = []

# departments along the back wall: counter in front, coloured sign band behind
all_traders = DEPARTMENTS + [("Currency Exchange", "librarian", "blue", None)]
TRADER_X = [9 + 6 * k for k in range(len(all_traders))]
for tx, (name, prof, color, goods) in zip(TRADER_X, all_traders):
    for dx in range(-1, 2):
        put(tx + dx, 1, WZ1 - 7, COUNTER)
    for dx in range(-2, 3):
        for ry in range(3, 7):
            put(tx + dx, ry, WZ1 - 1, state(color + "_concrete"))
    offers = BANK if goods is None else [sell_for(p, it, n) for it, n, p in goods]
    entities.append(villager(name, prof, offers, (tx, 1, WZ1 - 6), 180.0))

# cashiers at the checkout lanes: make change
for pos in CASHIER_POS:
    entities.append(villager("Cashier", "cartographer", CHANGE, pos, 180.0))

# shoppers: no trades, not silent, so they mumble like normal villagers
TYPES = ["plains", "desert", "jungle", "savanna", "snow", "swamp", "taiga"]
JOBS = ["none", "none", "none", "nitwit", "farmer", "librarian", "shepherd", "butcher"]
taken = set(CASHIER_POS)
aisles = []
for z0 in SHELF_Z0[:-1]:
    aisles += [z0 + 2, z0 + 3, z0 + 4, z0 + 5]
aisles += [WZ0 + 9, WZ0 + 10, WZ0 + 11, WZ1 - 14, WZ1 - 13, WZ1 - 12]
placed = 0
while placed < 44:
    x = rng.randint(WX0 + 3, WX1 - 4)
    z = rng.choice(aisles)
    if (x, 1, z) in taken:
        continue
    taken.add((x, 1, z))
    entities.append(villager(None, rng.choice(JOBS), None, (x, 1, z),
                             float(rng.randint(0, 359)), rng.choice(TYPES), level=1, silent=False))
    placed += 1

# shopping carts at the entrance
for k in range(8):
    bx, bz = cx - 12 + 3 * k, WZ0 + 2
    entities.append({
        "pos": L(TAG_DOUBLE, [D(bx + 0.5), D(1 + FOUND), D(bz + 0.5)]),
        "blockPos": L(TAG_INT, [I(bx), I(1 + FOUND), I(bz)]),
        "nbt": {"id": "minecraft:minecart"},
    })


# ----------------------------------------------------------------------------
# Serialise
# ----------------------------------------------------------------------------
def main():
    data_version = int(sys.argv[1])
    keys, index, out_blocks = [], {}, []
    for (x, y, z), st in sorted(blocks.items(), key=lambda kv: (kv[0][1], kv[0][2], kv[0][0])):
        assert 0 <= x < SX and 0 <= y < SY and 0 <= z < SZ, (x, y, z)
        if st not in index:
            index[st] = len(keys)
            keys.append(st)
        out_blocks.append({"pos": L(TAG_INT, [I(x), I(y), I(z)]), "state": I(index[st])})

    palette = []
    for name, props in keys:
        # Minecraft 26.x uses lowercase keys here (older versions: Name / Properties).
        entry = {"id": name}
        if props:
            entry["properties"] = {k: v for k, v in props}
        palette.append(entry)

    root = {
        "DataVersion": I(data_version),
        "size": L(TAG_INT, [I(SX), I(SY), I(SZ)]),
        "palette": L(TAG_COMPOUND, palette),
        "blocks": L(TAG_COMPOUND, out_blocks),
        "entities": L(TAG_COMPOUND, entities),
    }
    target = os.path.normpath(os.path.join(
        os.path.dirname(__file__), "..", "src", "main", "resources",
        "data", "americium", "structure", "store", "main.nbt"))
    os.makedirs(os.path.dirname(target), exist_ok=True)
    with gzip.GzipFile(target, "wb", mtime=0) as f:
        f.write(nbt_bytes(root))
    print("wrote", target, len(out_blocks), "blocks,", len(entities), "entities,",
          os.path.getsize(target) // 1024, "KB")


if __name__ == "__main__":
    main()
