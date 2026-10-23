scoreboard players set #t am_tmp 0
# players entering and leaving the store area
execute as @a at @s if predicate americium:in_store unless entity @s[tag=am_in] run function americium:enter
execute as @a[tag=am_in] at @s unless predicate americium:in_store run function americium:leave
# self checkout at the exit gate
execute as @a[tag=am_in] at @s if entity @e[type=marker,tag=am_exit_gate,distance=..3] run function americium:checkout
# keep the store villagers inside
execute as @e[type=villager,tag=am_npc] at @s if entity @e[type=marker,tag=am_exit_gate,distance=..2.5] run tp @s @e[type=marker,tag=am_aisle,sort=random,limit=1]
# stock clerks refill the shelves they are next to, every 8 rounds (about 2 seconds)
scoreboard players add #rs am_tmp 1
execute if score #rs am_tmp matches 8.. run function americium:restock
