/datum/action/item_action/toggle_shockwave
	name = "Toggle Shockwave \[ON\]"
	desc = "Toggles if the hammer's slams cause shockwaves."
	icon_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "vortex_ff_on"

/datum/action/item_action/toggle_shockwave/Trigger()
	if(..())
		UpdateButtonIcon()

/datum/action/item_action/toggle_shockwave/UpdateButtonIcon(status_only = FALSE, force)
	if(istype(target, /obj/item/twohanded/required/mithrix))
		var/obj/item/twohanded/required/mithrix/H
		if(H.shockwave)
			button_icon_state = "vortex_ff_off"
			name = "Toggle Shockwave \[OFF\]"
		else
			button_icon_state = "vortex_ff_on"
			name = "Toggle Shockwave \[ON\]"
	..()

