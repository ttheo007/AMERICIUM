clear @s americium:americium_gold_coin
clear @s americium:americium_silver_coin
clear @s americium:americium_coin
scoreboard players operation #w am_tmp -= #owed am_tmp
scoreboard players operation #g am_tmp = #w am_tmp
scoreboard players operation #g am_tmp /= #100 am_const
scoreboard players operation #r am_tmp = #w am_tmp
scoreboard players operation #r am_tmp %= #100 am_const
scoreboard players operation #s am_tmp = #r am_tmp
scoreboard players operation #s am_tmp /= #10 am_const
scoreboard players operation #b am_tmp = #r am_tmp
scoreboard players operation #b am_tmp %= #10 am_const
execute store result storage americium:tmp g int 1 run scoreboard players get #g am_tmp
execute store result storage americium:tmp s int 1 run scoreboard players get #s am_tmp
execute store result storage americium:tmp b int 1 run scoreboard players get #b am_tmp
function americium:give_change with storage americium:tmp
tellraw @s [{"text":"You paid ","color":"green"},{"score":{"name":"#og","objective":"am_tmp"},"color":"gold"},{"text":"G ","color":"gold"},{"score":{"name":"#os","objective":"am_tmp"},"color":"gray"},{"text":"S ","color":"gray"},{"score":{"name":"#ob","objective":"am_tmp"},"color":"red"},{"text":"B. Thank you for shopping!","color":"green"}]
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
function americium:snapshot
