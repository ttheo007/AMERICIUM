#!/usr/bin/env python3
"""Draws the three coin textures (16x16) and writes models and item definitions."""
import json, os
from PIL import Image

ROOT = os.path.join(os.path.dirname(__file__), "..", "src", "main", "resources", "assets", "americium")

COINS = {
    # id: (outline, shadow, body, light, shine, emblem)
    "americium_coin":        ((86, 48, 20), (140, 84, 40), (184, 115, 51), (219, 154, 88), (243, 196, 140), (96, 54, 22)),
    "americium_silver_coin": ((70, 78, 90), (128, 138, 152), (186, 196, 208), (220, 228, 238), (248, 251, 255), (84, 94, 108)),
    "americium_gold_coin":   ((120, 80, 0), (196, 140, 10), (255, 204, 40), (255, 228, 110), (255, 248, 190), (140, 96, 0)),
}

# emblem: a small "A" (5x5)
A = ["01110", "10001", "11111", "10001", "10001"]


def coin(colors):
    outline, shadow, body, light, shine, emblem = colors
    img = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    cx = cy = 7.5
    for y in range(16):
        for x in range(16):
            d = ((x - cx) ** 2 + (y - cy) ** 2) ** 0.5
            if d <= 6.9:
                if d > 5.9:
                    c = outline
                elif d > 5.0:
                    # lit from the upper left
                    c = light if (x + y) < 15 else shadow
                else:
                    c = body
                img.putpixel((x, y), c + (255,))
    # shine
    for (x, y) in ((4, 4), (5, 3), (3, 5)):
        img.putpixel((x, y), shine + (255,))
    # emblem
    for r, row in enumerate(A):
        for c, ch in enumerate(row):
            if ch == "1":
                img.putpixel((5 + c, 5 + r), emblem + (255,))
    return img


os.makedirs(os.path.join(ROOT, "textures", "item"), exist_ok=True)
os.makedirs(os.path.join(ROOT, "models", "item"), exist_ok=True)
os.makedirs(os.path.join(ROOT, "items"), exist_ok=True)
for name, colors in COINS.items():
    coin(colors).save(os.path.join(ROOT, "textures", "item", name + ".png"))
    with open(os.path.join(ROOT, "models", "item", name + ".json"), "w") as f:
        json.dump({"parent": "minecraft:item/generated", "textures": {"layer0": "americium:item/" + name}}, f, indent=2)
        f.write("\n")
    with open(os.path.join(ROOT, "items", name + ".json"), "w") as f:
        json.dump({"model": {"type": "minecraft:model", "model": "americium:item/" + name}}, f, indent=2)
        f.write("\n")
print("wrote", len(COINS), "coins")
