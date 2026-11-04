package dev.ttheo.americium.mixin;

import net.minecraft.world.entity.player.Player;
import net.minecraft.world.inventory.ResultSlot;
import net.minecraft.world.inventory.Slot;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

/**
 * Crafting lock for the store: players inside the store (scoreboard tag am_in, set by
 * the shop data pack) cannot take the result of a crafting grid. Otherwise shelf goods
 * could be crafted into other items (for example ingots into blocks) and would not be
 * charged at the exit. Creative players are exempt.
 */
@Mixin(Slot.class)
public abstract class SlotMixin {
    @Inject(method = "mayPickup", at = @At("HEAD"), cancellable = true)
    private void americium$noCraftingInStore(Player player, CallbackInfoReturnable<Boolean> cir) {
        if (((Object) this) instanceof ResultSlot
                && !player.isCreative()
                && player.entityTags().contains("am_in")) {
            cir.setReturnValue(false);
        }
    }
}
