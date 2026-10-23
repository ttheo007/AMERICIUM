scoreboard players set #owed am_tmp 0
execute store result score #cur am_tmp run clear @s minecraft:bread 0
scoreboard players operation #cur am_tmp -= @s am_b0
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p0 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:apple 0
scoreboard players operation #cur am_tmp -= @s am_b1
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p1 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:cooked_beef 0
scoreboard players operation #cur am_tmp -= @s am_b2
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p2 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:cooked_porkchop 0
scoreboard players operation #cur am_tmp -= @s am_b3
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p3 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:cooked_chicken 0
scoreboard players operation #cur am_tmp -= @s am_b4
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p4 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:baked_potato 0
scoreboard players operation #cur am_tmp -= @s am_b5
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p5 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:golden_carrot 0
scoreboard players operation #cur am_tmp -= @s am_b6
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p6 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:cake 0
scoreboard players operation #cur am_tmp -= @s am_b7
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p7 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:pumpkin_pie 0
scoreboard players operation #cur am_tmp -= @s am_b8
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p8 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:cookie 0
scoreboard players operation #cur am_tmp -= @s am_b9
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p9 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:milk_bucket 0
scoreboard players operation #cur am_tmp -= @s am_b10
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p10 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:leather_helmet 0
scoreboard players operation #cur am_tmp -= @s am_b11
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p11 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:leather_chestplate 0
scoreboard players operation #cur am_tmp -= @s am_b12
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p12 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:leather_leggings 0
scoreboard players operation #cur am_tmp -= @s am_b13
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p13 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:leather_boots 0
scoreboard players operation #cur am_tmp -= @s am_b14
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p14 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:white_wool 0
scoreboard players operation #cur am_tmp -= @s am_b15
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p15 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:shears 0
scoreboard players operation #cur am_tmp -= @s am_b16
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p16 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:white_bed 0
scoreboard players operation #cur am_tmp -= @s am_b17
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p17 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:redstone 0
scoreboard players operation #cur am_tmp -= @s am_b18
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p18 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:repeater 0
scoreboard players operation #cur am_tmp -= @s am_b19
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p19 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:comparator 0
scoreboard players operation #cur am_tmp -= @s am_b20
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p20 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:piston 0
scoreboard players operation #cur am_tmp -= @s am_b21
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p21 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:sticky_piston 0
scoreboard players operation #cur am_tmp -= @s am_b22
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p22 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:observer 0
scoreboard players operation #cur am_tmp -= @s am_b23
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p23 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:hopper 0
scoreboard players operation #cur am_tmp -= @s am_b24
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p24 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:daylight_detector 0
scoreboard players operation #cur am_tmp -= @s am_b25
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p25 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:note_block 0
scoreboard players operation #cur am_tmp -= @s am_b26
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p26 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:lever 0
scoreboard players operation #cur am_tmp -= @s am_b27
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p27 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:redstone_lamp 0
scoreboard players operation #cur am_tmp -= @s am_b28
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p28 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:redstone_torch 0
scoreboard players operation #cur am_tmp -= @s am_b29
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p29 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:golden_apple 0
scoreboard players operation #cur am_tmp -= @s am_b30
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p30 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:honey_bottle 0
scoreboard players operation #cur am_tmp -= @s am_b31
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p31 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:glistering_melon_slice 0
scoreboard players operation #cur am_tmp -= @s am_b32
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p32 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:sweet_berries 0
scoreboard players operation #cur am_tmp -= @s am_b33
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p33 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:dried_kelp 0
scoreboard players operation #cur am_tmp -= @s am_b34
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p34 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:rabbit_stew 0
scoreboard players operation #cur am_tmp -= @s am_b35
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p35 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:mushroom_stew 0
scoreboard players operation #cur am_tmp -= @s am_b36
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p36 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:beetroot_soup 0
scoreboard players operation #cur am_tmp -= @s am_b37
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p37 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:wheat_seeds 0
scoreboard players operation #cur am_tmp -= @s am_b38
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p38 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:beetroot_seeds 0
scoreboard players operation #cur am_tmp -= @s am_b39
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p39 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:pumpkin_seeds 0
scoreboard players operation #cur am_tmp -= @s am_b40
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p40 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:melon_seeds 0
scoreboard players operation #cur am_tmp -= @s am_b41
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p41 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:oak_sapling 0
scoreboard players operation #cur am_tmp -= @s am_b42
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p42 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:birch_sapling 0
scoreboard players operation #cur am_tmp -= @s am_b43
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p43 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:bone_meal 0
scoreboard players operation #cur am_tmp -= @s am_b44
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p44 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:poppy 0
scoreboard players operation #cur am_tmp -= @s am_b45
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p45 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:sunflower 0
scoreboard players operation #cur am_tmp -= @s am_b46
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p46 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:hay_block 0
scoreboard players operation #cur am_tmp -= @s am_b47
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p47 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:composter 0
scoreboard players operation #cur am_tmp -= @s am_b48
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p48 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_hoe 0
scoreboard players operation #cur am_tmp -= @s am_b49
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p49 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:bow 0
scoreboard players operation #cur am_tmp -= @s am_b50
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p50 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:arrow 0
scoreboard players operation #cur am_tmp -= @s am_b51
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p51 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:crossbow 0
scoreboard players operation #cur am_tmp -= @s am_b52
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p52 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:shield 0
scoreboard players operation #cur am_tmp -= @s am_b53
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p53 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:fishing_rod 0
scoreboard players operation #cur am_tmp -= @s am_b54
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p54 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:spyglass 0
scoreboard players operation #cur am_tmp -= @s am_b55
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p55 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:compass 0
scoreboard players operation #cur am_tmp -= @s am_b56
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p56 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:clock 0
scoreboard players operation #cur am_tmp -= @s am_b57
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p57 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:snowball 0
scoreboard players operation #cur am_tmp -= @s am_b58
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p58 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:minecart 0
scoreboard players operation #cur am_tmp -= @s am_b59
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p59 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:rail 0
scoreboard players operation #cur am_tmp -= @s am_b60
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p60 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:powered_rail 0
scoreboard players operation #cur am_tmp -= @s am_b61
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p61 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:detector_rail 0
scoreboard players operation #cur am_tmp -= @s am_b62
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p62 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:oak_boat 0
scoreboard players operation #cur am_tmp -= @s am_b63
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p63 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:carrot_on_a_stick 0
scoreboard players operation #cur am_tmp -= @s am_b64
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p64 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:firework_rocket 0
scoreboard players operation #cur am_tmp -= @s am_b65
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p65 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:book 0
scoreboard players operation #cur am_tmp -= @s am_b66
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p66 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:paper 0
scoreboard players operation #cur am_tmp -= @s am_b67
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p67 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:writable_book 0
scoreboard players operation #cur am_tmp -= @s am_b68
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p68 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:ink_sac 0
scoreboard players operation #cur am_tmp -= @s am_b69
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p69 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:feather 0
scoreboard players operation #cur am_tmp -= @s am_b70
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p70 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:lectern 0
scoreboard players operation #cur am_tmp -= @s am_b71
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p71 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:bookshelf 0
scoreboard players operation #cur am_tmp -= @s am_b72
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p72 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:map 0
scoreboard players operation #cur am_tmp -= @s am_b73
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p73 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:chest 0
scoreboard players operation #cur am_tmp -= @s am_b74
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p74 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:barrel 0
scoreboard players operation #cur am_tmp -= @s am_b75
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p75 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:lantern 0
scoreboard players operation #cur am_tmp -= @s am_b76
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p76 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:candle 0
scoreboard players operation #cur am_tmp -= @s am_b77
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p77 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:flower_pot 0
scoreboard players operation #cur am_tmp -= @s am_b78
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p78 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:painting 0
scoreboard players operation #cur am_tmp -= @s am_b79
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p79 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:item_frame 0
scoreboard players operation #cur am_tmp -= @s am_b80
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p80 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:crafting_table 0
scoreboard players operation #cur am_tmp -= @s am_b81
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p81 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:furnace 0
scoreboard players operation #cur am_tmp -= @s am_b82
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p82 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:glass 0
scoreboard players operation #cur am_tmp -= @s am_b83
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p83 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:oak_door 0
scoreboard players operation #cur am_tmp -= @s am_b84
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p84 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:ladder 0
scoreboard players operation #cur am_tmp -= @s am_b85
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p85 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:gold_ingot 0
scoreboard players operation #cur am_tmp -= @s am_b86
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p86 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:diamond 0
scoreboard players operation #cur am_tmp -= @s am_b87
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p87 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:emerald 0
scoreboard players operation #cur am_tmp -= @s am_b88
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p88 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:amethyst_shard 0
scoreboard players operation #cur am_tmp -= @s am_b89
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p89 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:lapis_lazuli 0
scoreboard players operation #cur am_tmp -= @s am_b90
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p90 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:quartz 0
scoreboard players operation #cur am_tmp -= @s am_b91
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p91 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_ingot 0
scoreboard players operation #cur am_tmp -= @s am_b92
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p92 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:copper_ingot 0
scoreboard players operation #cur am_tmp -= @s am_b93
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p93 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:torch 0
scoreboard players operation #cur am_tmp -= @s am_b94
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p94 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_pickaxe 0
scoreboard players operation #cur am_tmp -= @s am_b95
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p95 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_axe 0
scoreboard players operation #cur am_tmp -= @s am_b96
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p96 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_shovel 0
scoreboard players operation #cur am_tmp -= @s am_b97
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p97 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:iron_sword 0
scoreboard players operation #cur am_tmp -= @s am_b98
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p98 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:bucket 0
scoreboard players operation #cur am_tmp -= @s am_b99
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p99 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
execute store result score #cur am_tmp run clear @s minecraft:flint_and_steel 0
scoreboard players operation #cur am_tmp -= @s am_b100
execute if score #cur am_tmp matches 1.. run scoreboard players operation #cur am_tmp *= #p100 am_const
execute if score #cur am_tmp matches 1.. run scoreboard players operation #owed am_tmp += #cur am_tmp
# split the total into gold / silver / bronze for the messages
scoreboard players operation #og am_tmp = #owed am_tmp
scoreboard players operation #og am_tmp /= #100 am_const
scoreboard players operation #or am_tmp = #owed am_tmp
scoreboard players operation #or am_tmp %= #100 am_const
scoreboard players operation #os am_tmp = #or am_tmp
scoreboard players operation #os am_tmp /= #10 am_const
scoreboard players operation #ob am_tmp = #or am_tmp
scoreboard players operation #ob am_tmp %= #10 am_const
execute if score #owed am_tmp matches 1.. run function americium:pay
execute if score #owed am_tmp matches ..0 run function americium:snapshot
