scoreboard players set #n am_tmp 0
execute positioned ~ ~-3 ~ store result score #n am_tmp run data get block ~ ~ ~ Items
execute if score #n am_tmp matches ..6 run function americium:fill with entity @s item
