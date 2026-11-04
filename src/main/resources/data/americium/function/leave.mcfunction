function americium:checkout
tag @s remove am_in
execute if entity @s[tag=am_adv,gamemode=adventure] run gamemode survival @s
tag @s remove am_adv
