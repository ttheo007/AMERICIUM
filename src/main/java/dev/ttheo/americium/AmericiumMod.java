package dev.ttheo.americium;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.itemgroup.v1.ItemGroupEvents;
import net.minecraft.core.Registry;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.core.registries.Registries;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.world.item.CreativeModeTabs;
import net.minecraft.world.item.Item;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class AmericiumMod implements ModInitializer {
    public static final String MOD_ID = "americium";
    public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

    /** Bronze coin, worth 1. */
    public static final Item AMERICIUM_COIN = registerItem("americium_coin");
    /** Silver coin, worth 10 bronze coins. */
    public static final Item AMERICIUM_SILVER_COIN = registerItem("americium_silver_coin");
    /** Gold coin, worth 100 bronze coins. */
    public static final Item AMERICIUM_GOLD_COIN = registerItem("americium_gold_coin");

    private static Item registerItem(String name) {
        Identifier id = Identifier.fromNamespaceAndPath(MOD_ID, name);
        Item.Properties properties = new Item.Properties()
                .setId(ResourceKey.create(Registries.ITEM, id));
        return Registry.register(BuiltInRegistries.ITEM, id, new Item(properties));
    }

    @Override
    public void onInitialize() {
        ItemGroupEvents.modifyEntriesEvent(CreativeModeTabs.INGREDIENTS).register(entries -> {
            entries.accept(AMERICIUM_COIN);
            entries.accept(AMERICIUM_SILVER_COIN);
            entries.accept(AMERICIUM_GOLD_COIN);
        });
        LOGGER.info("AMERICIUM is starting. Coins registered: bronze (1), silver (10), gold (100).");
    }
}
