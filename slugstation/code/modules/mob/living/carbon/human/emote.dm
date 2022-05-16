/datum/emote/living/carbon/human/salute/run_emote(mob/user, params, type_override, intentional)
	var/held_item = get_active_held_item()
	var/offhand_item = get_inactive_held_item()
	var/pickaxe
	if(istype(held_item, /obj/item/pickaxe))
		pickaxe = held_item
	else if (istype(offhand_item, /obj/item/pickaxe))
		pickaxe = offhand_item
	else ..()
	if(istype(pickaxe, /obj/item/pickaxe/drill))
		..()
	held_item = get_inactive_held_item()
	if(DWARFISM in user.dna.mutations)
			user.emote("me","raises [user.p_their()] [pickaxe]!")
			user.say(pick(POSSIBLE_SALUTES))
	else 
		..()