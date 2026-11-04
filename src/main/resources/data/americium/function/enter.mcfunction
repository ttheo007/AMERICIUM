tag @s add am_in
function americium:snapshot
# survival players cannot break or place blocks inside the store (adventure mode)
execute if entity @s[gamemode=survival] run function americium:to_adventure
title @s actionbar {"text":"Welcome! Take what you like from the shelves. You pay automatically at the exit.","color":"gold"}
