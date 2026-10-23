execute store result score #cur am_tmp run clear @s minecraft:bread 0
scoreboard players operation #cur am_tmp -= @s am_b0
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:bread"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:apple 0
scoreboard players operation #cur am_tmp -= @s am_b1
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:apple"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:cooked_beef 0
scoreboard players operation #cur am_tmp -= @s am_b2
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:cooked_beef"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:cooked_porkchop 0
scoreboard players operation #cur am_tmp -= @s am_b3
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:cooked_porkchop"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:cooked_chicken 0
scoreboard players operation #cur am_tmp -= @s am_b4
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:cooked_chicken"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:baked_potato 0
scoreboard players operation #cur am_tmp -= @s am_b5
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:baked_potato"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:golden_carrot 0
scoreboard players operation #cur am_tmp -= @s am_b6
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:golden_carrot"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:cake 0
scoreboard players operation #cur am_tmp -= @s am_b7
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:cake"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:pumpkin_pie 0
scoreboard players operation #cur am_tmp -= @s am_b8
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:pumpkin_pie"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:cookie 0
scoreboard players operation #cur am_tmp -= @s am_b9
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:cookie"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:milk_bucket 0
scoreboard players operation #cur am_tmp -= @s am_b10
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:milk_bucket"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:leather_helmet 0
scoreboard players operation #cur am_tmp -= @s am_b11
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:leather_helmet"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:leather_chestplate 0
scoreboard players operation #cur am_tmp -= @s am_b12
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:leather_chestplate"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:leather_leggings 0
scoreboard players operation #cur am_tmp -= @s am_b13
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:leather_leggings"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:leather_boots 0
scoreboard players operation #cur am_tmp -= @s am_b14
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:leather_boots"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:white_wool 0
scoreboard players operation #cur am_tmp -= @s am_b15
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:white_wool"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:shears 0
scoreboard players operation #cur am_tmp -= @s am_b16
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:shears"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:white_bed 0
scoreboard players operation #cur am_tmp -= @s am_b17
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:white_bed"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:redstone 0
scoreboard players operation #cur am_tmp -= @s am_b18
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:redstone"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:repeater 0
scoreboard players operation #cur am_tmp -= @s am_b19
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:repeater"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:comparator 0
scoreboard players operation #cur am_tmp -= @s am_b20
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:comparator"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:piston 0
scoreboard players operation #cur am_tmp -= @s am_b21
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:piston"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:sticky_piston 0
scoreboard players operation #cur am_tmp -= @s am_b22
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:sticky_piston"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:observer 0
scoreboard players operation #cur am_tmp -= @s am_b23
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:observer"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:hopper 0
scoreboard players operation #cur am_tmp -= @s am_b24
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:hopper"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:daylight_detector 0
scoreboard players operation #cur am_tmp -= @s am_b25
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:daylight_detector"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:note_block 0
scoreboard players operation #cur am_tmp -= @s am_b26
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:note_block"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:lever 0
scoreboard players operation #cur am_tmp -= @s am_b27
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:lever"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:redstone_lamp 0
scoreboard players operation #cur am_tmp -= @s am_b28
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:redstone_lamp"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:redstone_torch 0
scoreboard players operation #cur am_tmp -= @s am_b29
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:redstone_torch"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:golden_apple 0
scoreboard players operation #cur am_tmp -= @s am_b30
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:golden_apple"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:honey_bottle 0
scoreboard players operation #cur am_tmp -= @s am_b31
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:honey_bottle"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:glistering_melon_slice 0
scoreboard players operation #cur am_tmp -= @s am_b32
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:glistering_melon_slice"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:sweet_berries 0
scoreboard players operation #cur am_tmp -= @s am_b33
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:sweet_berries"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:dried_kelp 0
scoreboard players operation #cur am_tmp -= @s am_b34
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:dried_kelp"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:rabbit_stew 0
scoreboard players operation #cur am_tmp -= @s am_b35
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:rabbit_stew"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:mushroom_stew 0
scoreboard players operation #cur am_tmp -= @s am_b36
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:mushroom_stew"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:beetroot_soup 0
scoreboard players operation #cur am_tmp -= @s am_b37
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:beetroot_soup"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:wheat_seeds 0
scoreboard players operation #cur am_tmp -= @s am_b38
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:wheat_seeds"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:beetroot_seeds 0
scoreboard players operation #cur am_tmp -= @s am_b39
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:beetroot_seeds"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:pumpkin_seeds 0
scoreboard players operation #cur am_tmp -= @s am_b40
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:pumpkin_seeds"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:melon_seeds 0
scoreboard players operation #cur am_tmp -= @s am_b41
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:melon_seeds"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:oak_sapling 0
scoreboard players operation #cur am_tmp -= @s am_b42
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:oak_sapling"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:birch_sapling 0
scoreboard players operation #cur am_tmp -= @s am_b43
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:birch_sapling"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:bone_meal 0
scoreboard players operation #cur am_tmp -= @s am_b44
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:bone_meal"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:poppy 0
scoreboard players operation #cur am_tmp -= @s am_b45
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:poppy"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:sunflower 0
scoreboard players operation #cur am_tmp -= @s am_b46
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:sunflower"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:hay_block 0
scoreboard players operation #cur am_tmp -= @s am_b47
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:hay_block"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:composter 0
scoreboard players operation #cur am_tmp -= @s am_b48
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:composter"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_hoe 0
scoreboard players operation #cur am_tmp -= @s am_b49
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:iron_hoe"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:bow 0
scoreboard players operation #cur am_tmp -= @s am_b50
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:bow"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:arrow 0
scoreboard players operation #cur am_tmp -= @s am_b51
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:arrow"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:crossbow 0
scoreboard players operation #cur am_tmp -= @s am_b52
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:crossbow"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:shield 0
scoreboard players operation #cur am_tmp -= @s am_b53
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:shield"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:fishing_rod 0
scoreboard players operation #cur am_tmp -= @s am_b54
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:fishing_rod"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:spyglass 0
scoreboard players operation #cur am_tmp -= @s am_b55
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:spyglass"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:compass 0
scoreboard players operation #cur am_tmp -= @s am_b56
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:compass"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:clock 0
scoreboard players operation #cur am_tmp -= @s am_b57
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:clock"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:snowball 0
scoreboard players operation #cur am_tmp -= @s am_b58
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:snowball"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:minecart 0
scoreboard players operation #cur am_tmp -= @s am_b59
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:minecart"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:rail 0
scoreboard players operation #cur am_tmp -= @s am_b60
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:rail"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:powered_rail 0
scoreboard players operation #cur am_tmp -= @s am_b61
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:powered_rail"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:detector_rail 0
scoreboard players operation #cur am_tmp -= @s am_b62
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:detector_rail"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:oak_boat 0
scoreboard players operation #cur am_tmp -= @s am_b63
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:oak_boat"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:carrot_on_a_stick 0
scoreboard players operation #cur am_tmp -= @s am_b64
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:carrot_on_a_stick"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:firework_rocket 0
scoreboard players operation #cur am_tmp -= @s am_b65
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:firework_rocket"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:book 0
scoreboard players operation #cur am_tmp -= @s am_b66
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:book"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:paper 0
scoreboard players operation #cur am_tmp -= @s am_b67
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:paper"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:writable_book 0
scoreboard players operation #cur am_tmp -= @s am_b68
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:writable_book"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:ink_sac 0
scoreboard players operation #cur am_tmp -= @s am_b69
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:ink_sac"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:feather 0
scoreboard players operation #cur am_tmp -= @s am_b70
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:feather"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:lectern 0
scoreboard players operation #cur am_tmp -= @s am_b71
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:lectern"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:bookshelf 0
scoreboard players operation #cur am_tmp -= @s am_b72
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:bookshelf"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:map 0
scoreboard players operation #cur am_tmp -= @s am_b73
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:map"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:chest 0
scoreboard players operation #cur am_tmp -= @s am_b74
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:chest"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:barrel 0
scoreboard players operation #cur am_tmp -= @s am_b75
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:barrel"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:lantern 0
scoreboard players operation #cur am_tmp -= @s am_b76
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:lantern"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:candle 0
scoreboard players operation #cur am_tmp -= @s am_b77
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:candle"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:flower_pot 0
scoreboard players operation #cur am_tmp -= @s am_b78
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:flower_pot"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:painting 0
scoreboard players operation #cur am_tmp -= @s am_b79
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:painting"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:item_frame 0
scoreboard players operation #cur am_tmp -= @s am_b80
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:item_frame"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:crafting_table 0
scoreboard players operation #cur am_tmp -= @s am_b81
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:crafting_table"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:furnace 0
scoreboard players operation #cur am_tmp -= @s am_b82
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:furnace"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:glass 0
scoreboard players operation #cur am_tmp -= @s am_b83
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:glass"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:oak_door 0
scoreboard players operation #cur am_tmp -= @s am_b84
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:oak_door"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:ladder 0
scoreboard players operation #cur am_tmp -= @s am_b85
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:ladder"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:gold_ingot 0
scoreboard players operation #cur am_tmp -= @s am_b86
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:gold_ingot"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:diamond 0
scoreboard players operation #cur am_tmp -= @s am_b87
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:diamond"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:emerald 0
scoreboard players operation #cur am_tmp -= @s am_b88
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:emerald"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:amethyst_shard 0
scoreboard players operation #cur am_tmp -= @s am_b89
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:amethyst_shard"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:lapis_lazuli 0
scoreboard players operation #cur am_tmp -= @s am_b90
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:lapis_lazuli"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:quartz 0
scoreboard players operation #cur am_tmp -= @s am_b91
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:quartz"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_ingot 0
scoreboard players operation #cur am_tmp -= @s am_b92
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:iron_ingot"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:copper_ingot 0
scoreboard players operation #cur am_tmp -= @s am_b93
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:copper_ingot"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:torch 0
scoreboard players operation #cur am_tmp -= @s am_b94
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:torch"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_pickaxe 0
scoreboard players operation #cur am_tmp -= @s am_b95
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:iron_pickaxe"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_axe 0
scoreboard players operation #cur am_tmp -= @s am_b96
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:iron_axe"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_shovel 0
scoreboard players operation #cur am_tmp -= @s am_b97
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:iron_shovel"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_sword 0
scoreboard players operation #cur am_tmp -= @s am_b98
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:iron_sword"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:bucket 0
scoreboard players operation #cur am_tmp -= @s am_b99
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:bucket"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
execute store result score #cur am_tmp run clear @s minecraft:flint_and_steel 0
scoreboard players operation #cur am_tmp -= @s am_b100
execute if score #cur am_tmp matches 1.. store result storage americium:tmp n int 1 run scoreboard players get #cur am_tmp
execute if score #cur am_tmp matches 1.. run data modify storage americium:tmp item set value "minecraft:flint_and_steel"
execute if score #cur am_tmp matches 1.. run function americium:rm with storage americium:tmp
tellraw @s [{"text":"You cannot pay for your goods. They need ","color":"red"},{"score":{"name":"#og","objective":"am_tmp"},"color":"gold"},{"text":"G ","color":"gold"},{"score":{"name":"#os","objective":"am_tmp"},"color":"gray"},{"text":"S ","color":"gray"},{"score":{"name":"#ob","objective":"am_tmp"},"color":"red"},{"text":"B. The goods were put back.","color":"red"}]
playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
function americium:snapshot
