# AMERICIUM

A private Fabric mod for Minecraft Java Edition 26.3.

AMERICIUM replaces the new "Abandoned Camps" structure with American-style supercenter stores. Players pay with a custom AMERICIUM currency to buy villagers and netherite equipment.

## Planned features

- Custom AMERICIUM currency item
- Store building generated naturally in the world in place of the Abandoned Camps
- Purchasable villagers
- Netherite equipment and materials shop
- Server-authoritative trading for multiplayer
- Configurable prices and stock

## Development status

**Early development.** The project metadata and the currency item exist. The store structure, the shop and the villager purchase still need to be implemented and tested in Minecraft 26.3.

## Requirements

- Minecraft Java Edition 26.3
- Fabric Loader 0.19.5 or newer
- Fabric API
- Java 25

## Build

The GitHub Actions workflow builds the mod with Java 25 and uploads the JAR as the `americium-jar` artifact. Locally, use a Java 25 JDK and run:

```bash
gradle build
```

The resulting mod JAR will be in `build/libs/`.

## Note on names and logos

The store theme is inspired by a real retail brand. This project is for private use only and must not be published or distributed under that brand name or logo.
