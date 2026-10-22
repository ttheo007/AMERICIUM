#!/usr/bin/env python3
"""Generates the store building as a vanilla structure template (NBT).

Usage: python3 tools/gen_store.py <DataVersion>
Writes: src/main/resources/data/americium/structure/store/main.nbt

Layout (x = width, z = depth, y = up). The front (parking lot and sign) is at z = 0.
The sign text is mirrored along x on purpose: a viewer standing in front of the
building looks towards +z, and +x is then on the viewer's left.
"""
import gzip
import os
import struct
import sys

# ----------------------------------------------------------------------------
# Minimal NBT writer
# ----------------------------------------------------------------------------
TAG_END, TAG_BYTE, TAG_SHORT, TAG_INT, TAG_LONG, TAG_FLOAT, TAG_DOUBLE = 0, 1, 2, 3, 4, 5, 6
TAG_STRING, TAG_LIST, TAG_COMPOUND = 8, 9, 10


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
# Building
# ----------------------------------------------------------------------------
SX, SZ, SY = 47, 32, 13          # template size
WX0, WX1 = 1, 46                 # building walls (x range, WX1 exclusive)
WZ0, WZ1 = 7, 31                 # building walls (z range, WZ1 exclusive)
ROOF = 8                         # roof layer

blocks = {}                      # (x, y, z) -> state key
palette_keys = []                # list of (name, props tuple)


def state(name, **props):
    return ("minecraft:" + name, tuple(sorted((k, str(v)) for k, v in props.items())))


def put(x, y, z, st):
    blocks[(x, y, z)] = st


AIR = state("air")
FLOOR = state("light_gray_concrete")
APRON = state("gray_concrete")
LINE = state("white_concrete")
WALL = state("white_concrete")
BAND = state("blue_concrete")
LETTER = state("white_concrete")
SPARK = state("yellow_concrete")
GLASS = state("glass")
ROOFB = state("light_gray_concrete")
LAMP = state("sea_lantern")
COUNTER = state("smooth_stone")
SLAB = state("smooth_stone_slab", type="bottom", waterlogged="false")
BARREL = state("barrel", facing="up", open="false")
TRIM = state("stone_bricks")
BLACK = state("black_concrete")

# apron / parking lot (y = 0), z in [0, WZ0)
for x in range(SX):
    for z in range(0, WZ0):
        put(x, 0, z, APRON)
for x in range(2, SX - 1, 5):
    for z in range(1, 5):
        put(x, 0, z, LINE)

# curb in front of the building
for x in range(WX0, WX1):
    put(x, 0, WZ0 - 1, TRIM)

# building volume: floor, air, walls, roof
for x in range(WX0, WX1):
    for z in range(WZ0, WZ1):
        edge = x in (WX0, WX1 - 1) or z in (WZ0, WZ1 - 1)
        put(x, 0, z, FLOOR)
        for y in range(1, ROOF):
            put(x, y, z, WALL if edge else AIR)
        put(x, ROOF, z, ROOFB)

# parapet on the roof
for x in range(WX0, WX1):
    for z in range(WZ0, WZ1):
        if x in (WX0, WX1 - 1) or z in (WZ0, WZ1 - 1):
            put(x, ROOF + 1, z, TRIM)

# blue band across the front: y 4..8 on the front wall
for x in range(WX0, WX1):
    for y in range(4, ROOF + 1):
        put(x, y, WZ0, BAND)

# glass storefront with two open doorways
for x in range(WX0 + 4, WX1 - 4):
    for y in range(1, 4):
        put(x, y, WZ0, GLASS)
cx = (WX0 + WX1) // 2            # centre x
for dx in (-3, -2, 2, 3):
    for y in range(1, 3):
        put(cx + dx, y, WZ0, AIR)

# pixel sign: "AMERICIUM" + spark. 3x5 font, front face (z = WZ0 - 1 is outside),
# the letters are placed on the band surface itself (z = WZ0), replacing blue blocks.
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

text_w = len(TEXT) * 3 + (len(TEXT) - 1)       # 35
total_w = text_w + 3 + 5                       # text + gap + spark
start_view = (WX1 - WX0 - total_w) // 2        # margin from the viewer's left edge
# viewer-left corresponds to the largest x of the wall
left_x = WX1 - 1 - start_view
SIGN_Y_TOP = 8                                 # top row of the letters


def draw(pixels, col0, fill):
    for r, row in enumerate(pixels):
        for c, ch in enumerate(row):
            if ch == "1":
                put(left_x - (col0 + c), SIGN_Y_TOP - r, WZ0, fill)


col = 0
for i, letter in enumerate(TEXT):
    draw(FONT[letter], col, LETTER)
    col += 3 + 1
draw(SPARK_PIX, text_w + 3, SPARK)

# lighting: sea lanterns embedded in the ceiling
for x in range(WX0 + 3, WX1 - 2, 6):
    for z in range(WZ0 + 3, WZ1 - 2, 6):
        put(x, ROOF, z, LAMP)

# checkout counters near the entrance (z = WZ0 + 4)
for x in range(WX0 + 6, WX1 - 6, 6):
    for dx in range(3):
        put(x + dx, 1, WZ0 + 4, COUNTER)
    put(x, 2, WZ0 + 4, BLACK)

# shelf rows (barrel + slab), running along x
for z in (WZ0 + 9, WZ0 + 13, WZ0 + 17):
    for x in range(WX0 + 4, WX1 - 4):
        if (x - WX0) % 8 in (3, 4):
            continue                           # gaps for walking
        put(x, 1, z, BARREL)
        put(x, 2, z, SLAB)

# trader booths along the back wall: counter in front of each trader
TRADER_X = [cx - 12, cx, cx + 12]
for tx in TRADER_X:
    for dx in range(-1, 2):
        put(tx + dx, 1, WZ1 - 6, COUNTER)
    put(tx, 1, WZ1 - 5, AIR)
    put(tx, 2, WZ1 - 5, AIR)

# cashier at the first counter
CASHIER = (WX0 + 7, 1, WZ0 + 5)


# ----------------------------------------------------------------------------
# Traders (vanilla villagers with fixed offers; vanilla trading = server side)
# ----------------------------------------------------------------------------
def item(i, count):
    return {"id": i, "count": I(count)}


def offer(buy, buy_count, sell, sell_count, max_uses=9999999):
    return {
        "buy": item(buy, buy_count),
        "sell": item(sell, sell_count),
        "maxUses": I(max_uses),
        "uses": I(0),
        "xp": I(0),
        "rewardExp": B(0),
        "priceMultiplier": F(0.0),
        "demand": I(0),
        "specialPrice": I(0),
    }


COIN = "americium:americium_coin"


def villager(name, profession, offers, pos, rot):
    nbt = {
        "id": "minecraft:villager",
        "NoAI": B(1),
        "Invulnerable": B(1),
        "PersistenceRequired": B(1),
        "Silent": B(1),
        "CustomName": name,
        "CustomNameVisible": B(1),
        "Rotation": L(TAG_FLOAT, [F(rot), F(0.0)]),
        "Xp": I(1000),
        "VillagerData": {
            "level": I(5),
            "profession": "minecraft:" + profession,
            "type": "minecraft:plains",
        },
        "Offers": {"Recipes": L(TAG_COMPOUND, offers)},
    }
    bx, by, bz = pos
    return {
        "pos": L(TAG_DOUBLE, [D(bx + 0.5), D(by), D(bz + 0.5)]),
        "blockPos": L(TAG_INT, [I(bx), I(by), I(bz)]),
        "nbt": nbt,
    }


# Prices are placeholders for a survival SMP; change them here and regenerate.
NETHERITE = [
    ("minecraft:netherite_scrap", 1, 16),
    ("minecraft:netherite_ingot", 1, 48),
    ("minecraft:netherite_upgrade_smithing_template", 1, 32),
    ("minecraft:netherite_helmet", 1, 56),
    ("minecraft:netherite_chestplate", 1, 64),
    ("minecraft:netherite_leggings", 1, 60),
    ("minecraft:netherite_boots", 1, 52),
    ("minecraft:netherite_sword", 1, 52),
    ("minecraft:netherite_pickaxe", 1, 52),
    ("minecraft:netherite_axe", 1, 52),
    ("minecraft:netherite_shovel", 1, 40),
    ("minecraft:netherite_hoe", 1, 36),
]
netherite_offers = [offer(COIN, price, it, n) for it, n, price in NETHERITE]

# Villager spawn eggs: using the egg spawns a normal villager at the player.
VILLAGERS = [offer(COIN, 64, "minecraft:villager_spawn_egg", 1)]

# Currency exchange: emeralds and diamonds for coins.
EXCHANGE = [
    offer("minecraft:emerald", 1, COIN, 1),
    offer("minecraft:diamond", 1, COIN, 6),
    offer("minecraft:netherite_ingot", 1, COIN, 40),
]

entities = [
    villager("Netherite Shop", "armorer", netherite_offers,
             (TRADER_X[0], 1, WZ1 - 5), 180.0),
    villager("Villager Market", "librarian", VILLAGERS,
             (TRADER_X[1], 1, WZ1 - 5), 180.0),
    villager("Currency Exchange", "cleric", EXCHANGE,
             (TRADER_X[2], 1, WZ1 - 5), 180.0),
    villager("Cashier", "cartographer", EXCHANGE,
             CASHIER, 180.0),
]

# ----------------------------------------------------------------------------
# Serialise
# ----------------------------------------------------------------------------
def main():
    data_version = int(sys.argv[1])
    keys = []
    index = {}
    out_blocks = []
    for (x, y, z), st in sorted(blocks.items(), key=lambda kv: (kv[0][1], kv[0][2], kv[0][0])):
        assert 0 <= x < SX and 0 <= y < SY and 0 <= z < SZ, (x, y, z)
        if st not in index:
            index[st] = len(keys)
            keys.append(st)
        out_blocks.append({"pos": L(TAG_INT, [I(x), I(y), I(z)]), "state": I(index[st])})

    palette = []
    for name, props in keys:
        entry = {"Name": name}
        if props:
            entry["Properties"] = {k: v for k, v in props}
        palette.append(entry)

    root = {
        "DataVersion": I(data_version),
        "size": L(TAG_INT, [I(SX), I(SY), I(SZ)]),
        "palette": L(TAG_COMPOUND, palette),
        "blocks": L(TAG_COMPOUND, out_blocks),
        "entities": L(TAG_COMPOUND, entities),
    }
    target = os.path.join(os.path.dirname(__file__), "..", "src", "main", "resources",
                          "data", "americium", "structure", "store", "main.nbt")
    target = os.path.normpath(target)
    os.makedirs(os.path.dirname(target), exist_ok=True)
    with gzip.GzipFile(target, "wb", mtime=0) as f:
        f.write(nbt_bytes(root))
    print("wrote", target, len(out_blocks), "blocks,", len(entities), "entities")


if __name__ == "__main__":
    main()
