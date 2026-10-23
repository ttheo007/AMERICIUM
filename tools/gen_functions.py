#!/usr/bin/env python3
"""Generates the shop logic as data pack functions (they run on every server, no
command blocks needed).

Writes into src/main/resources/data/americium/ (function/, predicate/) and
src/main/resources/data/minecraft/tags/function/.

How it works
- A player entering the store area gets the tag am_in and a snapshot of how many of
  every catalogue item they carry (scores am_b<i>).
- At the exit gate (markers tagged am_exit_gate) or when the player leaves the store
  area, everything carried above the snapshot is added up with the catalogue prices.
- If the player has enough coins they are paid (change is given back), otherwise the
  surplus goods are taken away again.
- Stock clerks (villagers tagged am_stocker) refill the shelves they walk past.
"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))
import catalog  # noqa: E402

ROOT = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", "src", "main", "resources", "data"))
FUNC = os.path.join(ROOT, "americium", "function")
BRONZE = "americium:americium_coin"
SILVER = "americium:americium_silver_coin"
GOLD = "americium:americium_gold_coin"

items = catalog.unique_items()          # [(item, price)]


def write(path, text):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(text.rstrip("\n") + "\n")


def fn(name, lines):
    write(os.path.join(FUNC, name + ".mcfunction"), "\n".join(lines))


# --- load -------------------------------------------------------------------
load = [
    "scoreboard objectives add am_tmp dummy",
    "scoreboard objectives add am_const dummy",
    "scoreboard players set #100 am_const 100",
    "scoreboard players set #10 am_const 10",
]
for i, (item, price) in enumerate(items):
    load.append("scoreboard objectives add am_b%d dummy" % i)
    load.append("scoreboard players set #p%d am_const %d" % (i, price))
fn("load", load)

# --- tick / slow --------------------------------------------------------------
fn("tick", [
    "scoreboard players add #t am_tmp 1",
    "execute if score #t am_tmp matches 5.. run function americium:slow",
])
fn("slow", [
    "scoreboard players set #t am_tmp 0",
    "# players entering and leaving the store area",
    "execute as @a at @s if predicate americium:in_store unless entity @s[tag=am_in] run function americium:enter",
    "execute as @a[tag=am_in] at @s unless predicate americium:in_store run function americium:leave",
    "# self checkout at the exit gate",
    "execute as @a[tag=am_in] at @s if entity @e[type=marker,tag=am_exit_gate,distance=..3] run function americium:checkout",
    "# keep the store villagers inside",
    "execute as @e[type=villager,tag=am_npc] at @s if entity @e[type=marker,tag=am_exit_gate,distance=..2.5] run tp @s @e[type=marker,tag=am_aisle,sort=random,limit=1]",
    "# stock clerks refill the shelves they are next to, every 8 rounds (about 2 seconds)",
    "scoreboard players add #rs am_tmp 1",
    "execute if score #rs am_tmp matches 8.. run function americium:restock",
])

# --- enter / leave ------------------------------------------------------------
fn("enter", [
    "tag @s add am_in",
    "function americium:snapshot",
    'title @s actionbar {"text":"Welcome! Take what you like from the shelves. You pay automatically at the exit.","color":"gold"}',
])
fn("leave", [
    "function americium:checkout",
    "tag @s remove am_in",
])

# --- snapshot -----------------------------------------------------------------
fn("snapshot", [
    "execute store result score @s am_b%d run clear @s minecraft:%s 0" % (i, item)
    for i, (item, _) in enumerate(items)
])

# --- checkout -----------------------------------------------------------------
co = ["scoreboard players set #owed am_tmp 0"]
for i, (item, _) in enumerate(items):
    co += [
        "execute store result score #cur am_tmp run clear @s minecraft:%s 0" % item,
        "scoreboard players operation #cur am_tmp -= @s am_b%d" % i,
        "execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p%d am_const" % i,
        "execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp",
    ]
co += [
    "# split the total into gold / silver / bronze for the messages",
    "scoreboard players operation #og am_tmp = #owed am_tmp",
    "scoreboard players operation #og am_tmp /= #100 am_const",
    "scoreboard players operation #or am_tmp = #owed am_tmp",
    "scoreboard players operation #or am_tmp %= #100 am_const",
    "scoreboard players operation #os am_tmp = #or am_tmp",
    "scoreboard players operation #os am_tmp /= #10 am_const",
    "scoreboard players operation #ob am_tmp = #or am_tmp",
    "scoreboard players operation #ob am_tmp %= #10 am_const",
    "execute if score #owed am_tmp matches 1.. run function americium:pay",
    "execute if score #owed am_tmp matches ..0 run function americium:snapshot",
]
fn("checkout", co)

# --- pay ----------------------------------------------------------------------
fn("pay", [
    "execute store result score #g am_tmp run clear @s %s 0" % GOLD,
    "execute store result score #s am_tmp run clear @s %s 0" % SILVER,
    "execute store result score #b am_tmp run clear @s %s 0" % BRONZE,
    "scoreboard players operation #w am_tmp = #g am_tmp",
    "scoreboard players operation #w am_tmp *= #100 am_const",
    "scoreboard players operation #t2 am_tmp = #s am_tmp",
    "scoreboard players operation #t2 am_tmp *= #10 am_const",
    "scoreboard players operation #w am_tmp += #t2 am_tmp",
    "scoreboard players operation #w am_tmp += #b am_tmp",
    "scoreboard players set #ok am_tmp 0",
    "execute if score #w am_tmp >= #owed am_tmp run scoreboard players set #ok am_tmp 1",
    "execute if score #ok am_tmp matches 1 run function americium:pay_ok",
    "execute if score #ok am_tmp matches 0 run function americium:pay_fail",
])

fn("pay_ok", [
    "clear @s %s" % GOLD,
    "clear @s %s" % SILVER,
    "clear @s %s" % BRONZE,
    "scoreboard players operation #w am_tmp -= #owed am_tmp",
    "scoreboard players operation #g am_tmp = #w am_tmp",
    "scoreboard players operation #g am_tmp /= #100 am_const",
    "scoreboard players operation #r am_tmp = #w am_tmp",
    "scoreboard players operation #r am_tmp %= #100 am_const",
    "scoreboard players operation #s am_tmp = #r am_tmp",
    "scoreboard players operation #s am_tmp /= #10 am_const",
    "scoreboard players operation #b am_tmp = #r am_tmp",
    "scoreboard players operation #b am_tmp %= #10 am_const",
    "execute store result storage americium:tmp g int 1 run scoreboard players get #g am_tmp",
    "execute store result storage americium:tmp s int 1 run scoreboard players get #s am_tmp",
    "execute store result storage americium:tmp b int 1 run scoreboard players get #b am_tmp",
    "function americium:give_change with storage americium:tmp",
    'tellraw @s [{"text":"You paid ","color":"green"},{"score":{"name":"#og","objective":"am_tmp"},"color":"gold"},{"text":"G ","color":"gold"},{"score":{"name":"#os","objective":"am_tmp"},"color":"gray"},{"text":"S ","color":"gray"},{"score":{"name":"#ob","objective":"am_tmp"},"color":"red"},{"text":"B. Thank you for shopping!","color":"green"}]',
    "playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1",
    "function americium:snapshot",
])

fn("give_change", [
    "$give @s %s $(g)" % GOLD,
    "$give @s %s $(s)" % SILVER,
    "$give @s %s $(b)" % BRONZE,
])

pf = []
for i, (item, _) in enumerate(items):
    pf += [
        "execute store result score #cur am_tmp run clear @s minecraft:%s 0" % item,
        "scoreboard players operation #cur am_tmp -= @s am_b%d" % i,
        "execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp",
        'execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:%s"' % item,
        "execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp",
    ]
pf += [
    'tellraw @s [{"text":"You cannot pay for your goods. They need ","color":"red"},{"score":{"name":"#og","objective":"am_tmp"},"color":"gold"},{"text":"G ","color":"gold"},{"score":{"name":"#os","objective":"am_tmp"},"color":"gray"},{"text":"S ","color":"gray"},{"score":{"name":"#ob","objective":"am_tmp"},"color":"red"},{"text":"B. The goods were put back.","color":"red"}]',
    "playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1",
    "function americium:snapshot",
]
fn("pay_fail", pf)
fn("rm", ["$clear @s $(item) $(n)"])

# --- restock ------------------------------------------------------------------
fn("restock", [
    "scoreboard players set #rs am_tmp 0",
    "execute as @e[type=villager,tag=am_stocker] at @s as @e[type=item_display,tag=am_shelf,distance=..7] at @s run function americium:restock_one with entity @s item",
])
fn("restock_one", [
    "$execute positioned ~ ~-3 ~ run item replace block ~ ~ ~ container.0 with $(id) $(count)",
])

# --- predicate and tags ---------------------------------------------------------
write(os.path.join(ROOT, "americium", "predicate", "in_store.json"), json.dumps(
    {"type": "minecraft:location_check", "predicate": {"structures": "americium:store"}}, indent=2))
write(os.path.join(ROOT, "minecraft", "tags", "function", "load.json"), json.dumps(
    {"values": ["americium:load"]}, indent=2))
write(os.path.join(ROOT, "minecraft", "tags", "function", "tick.json"), json.dumps(
    {"values": ["americium:tick"]}, indent=2))
print("wrote functions for", len(items), "catalogue items")
