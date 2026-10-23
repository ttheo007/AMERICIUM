"""Shop catalogue shared by gen_store.py (shelves, labels) and gen_functions.py (checkout).

Prices are in bronze coins: bronze = 1, silver = 10, gold = 100.
Each product is (item id without namespace, price per piece, stock per shelf).
Prices are deliberately not all multiples of 10, so bronze coins are used.
Changing this file and re-running both generators updates the whole shop.
"""

# items that do not stack above 1
STACK1 = {
    "leather_helmet", "leather_chestplate", "leather_leggings", "leather_boots",
    "shears", "white_bed", "cake", "milk_bucket", "water_bucket", "rabbit_stew",
    "mushroom_stew", "beetroot_soup", "bow", "crossbow", "shield", "fishing_rod",
    "spyglass", "carrot_on_a_stick", "minecart", "oak_boat", "writable_book",
    "iron_hoe", "iron_pickaxe", "iron_axe", "iron_shovel", "iron_sword",
    "flint_and_steel",
}
STACK16 = {"bucket", "honey_bottle", "snowball"}

# (department, wool colour, [(item, price, stock?)])  stock None = default
DEPARTMENTS = [
    ("Grocery", "orange", [
        ("bread", 5), ("apple", 4), ("cooked_beef", 12), ("cooked_porkchop", 12),
        ("cooked_chicken", 9), ("baked_potato", 6), ("golden_carrot", 35),
        ("cake", 55), ("pumpkin_pie", 25), ("cookie", 2), ("milk_bucket", 28)]),
    ("Clothing", "pink", [
        ("leather_helmet", 28), ("leather_chestplate", 45), ("leather_leggings", 38),
        ("leather_boots", 25), ("white_wool", 6), ("shears", 18), ("white_bed", 38)]),
    ("Electronics", "yellow", [
        ("redstone", 3), ("repeater", 18), ("comparator", 27), ("piston", 29),
        ("sticky_piston", 47), ("observer", 38), ("hopper", 48),
        ("daylight_detector", 58), ("note_block", 28), ("lever", 4),
        ("redstone_lamp", 29), ("redstone_torch", 3)]),
    ("Pharmacy", "white", [
        ("golden_apple", 195), ("honey_bottle", 27), ("glistering_melon_slice", 38),
        ("sweet_berries", 3), ("dried_kelp", 2), ("rabbit_stew", 38),
        ("mushroom_stew", 18), ("beetroot_soup", 16)]),
    ("Garden Center", "lime", [
        ("wheat_seeds", 2), ("beetroot_seeds", 2), ("pumpkin_seeds", 3),
        ("melon_seeds", 3), ("oak_sapling", 4), ("birch_sapling", 4), ("bone_meal", 3),
        ("poppy", 2), ("sunflower", 3), ("hay_block", 28), ("composter", 29),
        ("iron_hoe", 28)]),
    ("Sporting Goods", "light_blue", [
        ("bow", 38), ("arrow", 2), ("crossbow", 58), ("shield", 48), ("fishing_rod", 28),
        ("spyglass", 118), ("compass", 38), ("clock", 38), ("snowball", 1)]),
    ("Auto Center", "gray", [
        ("minecart", 58), ("rail", 4), ("powered_rail", 14), ("detector_rail", 11),
        ("oak_boat", 18), ("carrot_on_a_stick", 38), ("firework_rocket", 8)]),
    ("Books & Stationery", "purple", [
        ("book", 18), ("paper", 2), ("writable_book", 38), ("ink_sac", 4),
        ("feather", 3), ("lectern", 38), ("bookshelf", 38), ("map", 18)]),
    ("Home & Furniture", "red", [
        ("chest", 18), ("barrel", 18), ("lantern", 28), ("candle", 5), ("flower_pot", 8),
        ("painting", 18), ("item_frame", 18), ("crafting_table", 18), ("furnace", 18),
        ("glass", 2), ("oak_door", 6), ("ladder", 3)]),
    ("Jewelry", "cyan", [
        ("gold_ingot", 38), ("diamond", 105), ("emerald", 25), ("amethyst_shard", 18),
        ("lapis_lazuli", 4), ("quartz", 5), ("iron_ingot", 8), ("copper_ingot", 3)]),
    ("Hardware", "brown", [
        ("torch", 2), ("iron_pickaxe", 38), ("iron_axe", 38), ("iron_shovel", 20),
        ("iron_sword", 38), ("bucket", 28), ("flint_and_steel", 25)]),
]


def stock_of(item):
    if item in STACK1:
        return 1
    if item in STACK16:
        return 16
    return 16


def pretty(item):
    return " ".join(w.capitalize() for w in item.split("_"))


def fmt(units):
    """e.g. 125 -> '1G 2S 5B'"""
    g, rem = divmod(units, 100)
    s, b = divmod(rem, 10)
    parts = []
    if g: parts.append("%dG" % g)
    if s: parts.append("%dS" % s)
    if b: parts.append("%dB" % b)
    return " ".join(parts)


def products():
    """Flat list of (department, colour, item, price) in shelf order."""
    out = []
    for dept, colour, items in DEPARTMENTS:
        for item, price in items:
            out.append((dept, colour, item, price))
    return out


def unique_items():
    """Items with their price, one entry per item id (first price wins)."""
    seen = {}
    for _, _, item, price in products():
        seen.setdefault(item, price)
    return list(seen.items())


if __name__ == "__main__":
    ps = products()
    print(len(ps), "products,", len(unique_items()), "distinct items")
    dup = [i for i, _ in unique_items() if sum(1 for p in ps if p[2] == i) > 1]
    print("duplicates (must have the same price):", dup)
