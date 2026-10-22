package dev.ttheo.americium;

import net.fabricmc.api.ModInitializer;
import net.minecraft.core.Registry;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.core.registries.Registries;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.world.item.Item;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class AmericiumMod implements ModInitializer {
    public static final String MOD_ID = "americium";
    public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

    public static final Item AMERICIUM_COIN = registerItem(
            "americium_coin",
            new Item.Properties().setId(ResourceKey.create(
                    Registries.ITEM,
                    Identifier.fromNamespaceAndPath(MOD_ID, "americium_coin")
            ))
    );

    private static Item registerItem(String name, Item.Properties properties) {
        Identifier id = Identifier.fromNamespaceAndPath(MOD_ID, name);
        return Registry.register(BuiltInRegistries.ITEM, id, new Item(properties));
    }

    @Override
    public void onInitialize() {
        LOGGER.info("AMERICIUM is starting. The custom currency item has been registered.");
    }
}
