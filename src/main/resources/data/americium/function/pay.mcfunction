execute store result score #g am_tmp run clear @s americium:americium_gold_coin 0
execute store result score #s am_tmp run clear @s americium:americium_silver_coin 0
execute store result score #b am_tmp run clear @s americium:americium_coin 0
scoreboard players operation #w am_tmp = #g am_tmp
scoreboard players operation #w am_tmp *= #100 am_const
scoreboard players operation #t2 am_tmp = #s am_tmp
scoreboard players operation #t2 am_tmp *= #10 am_const
scoreboard players operation #w am_tmp += #t2 am_tmp
scoreboard players operation #w am_tmp += #b am_tmp
scoreboard players set #ok am_tmp 0
execute if score #w am_tmp >= #owed am_tmp run scoreboard players set #ok am_tmp 1
execute if score #ok am_tmp matches 1 run function americium:pay_ok
execute if score #ok am_tmp matches 0 run function americium:pay_fail
