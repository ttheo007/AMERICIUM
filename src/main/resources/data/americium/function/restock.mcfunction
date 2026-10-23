scoreboard players set #rs am_tmp 0
execute as @e[type=villager,tag=am_stocker] at @s as @e[type=item_display,tag=am_shelf,distance=..7] at @s run function americium:restock_one with entity @s item
