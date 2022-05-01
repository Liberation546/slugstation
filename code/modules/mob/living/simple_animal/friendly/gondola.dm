#define GONDOLA_HEIGHT pick("gondola_body_long", "gondola_body_medium", "gondola_body_short")
#define GONDOLA_COLOR pick("A87855", "915E48", "683E2C")
#define GONDOLA_MOUSTACHE pick("gondola_moustache_large", "gondola_moustache_small")
#define GONDOLA_EYES pick("gondola_eyes_close", "gondola_eyes_far")

//Gondolas

/mob/living/simple_animal/pet/gondola
	name = "gondola"
	real_name = "gondola"
	desc = "Gondola is the silent walker. Having no hands he embodies the Taoist principle of wu-wei (non-action) while his smiling facial expression shows his utter and complete acceptance of the world as it is. Its hide is extremely valuable."
	response_help = "pets"
	response_disarm = "bops"
	response_harm = "kicks"
	faction = list("gondola")
	turns_per_move = 10
	icon = 'icons/mob/gondolas.dmi'
	icon_state = "gondola"
	icon_living = "gondola"
	loot = list(/obj/effect/decal/cleanable/blood/gibs, /obj/item/stack/sheet/animalhide/gondola = 1, /obj/item/reagent_containers/food/snacks/meat/slab/gondola = 1)
	//Gondolas aren't affected by cold.
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500
	maxHealth = 200
	health = 200
	del_on_death = TRUE
	//slug add
	dextrous = TRUE
	var/obj/item/back
	var/list/gondola_overlays = new /list(1)
	//slug end

	//Gondolas don't make footstep sounds

/mob/living/simple_animal/pet/gondola/Initialize()
	. = ..()
	if (!(istype(src, /mob/living/simple_animal/pet/gondola/gondolapod)))
		CreateGondola()

/mob/living/simple_animal/pet/gondola/proc/CreateGondola()
	icon_state = null
	icon_living = null
	var/height = GONDOLA_HEIGHT
	var/mutable_appearance/body_overlay = mutable_appearance(icon, height)
	var/mutable_appearance/eyes_overlay = mutable_appearance(icon, GONDOLA_EYES)
	var/mutable_appearance/moustache_overlay = mutable_appearance(icon, GONDOLA_MOUSTACHE)
	body_overlay.color = ("#[GONDOLA_COLOR]")

	//Offset the face to match the Gondola's height.
	switch(height)
		if("gondola_body_medium")
			eyes_overlay.pixel_y = -4
			moustache_overlay.pixel_y = -4
		if("gondola_body_short")
			eyes_overlay.pixel_y = -8
			moustache_overlay.pixel_y = -8

	cut_overlays(TRUE)
	add_overlay(body_overlay)
	add_overlay(eyes_overlay)
	add_overlay(moustache_overlay)

//slug add
/mob/living/simple_animal/pet/gondola/create_mob_hud()
	. = ..()
	var/obj/screen/inventory/inv = new /obj/screen/inventory()
	inv.name = "back"
	inv.icon = hud_used.ui_style
	inv.icon_state = "back"
	inv.screen_loc = ui_id
	inv.slot_id = SLOT_BACK
	inv.hud = hud_used
	hud_used.inv_slots[SLOT_BACK] = inv
	hud_used.static_inventory += inv
	inv.update_icon()

/mob/living/simple_animal/pet/gondola/swap_hand(hand_index)
	if(held_items.len == 0)
		return
	..()

/mob/living/simple_animal/pet/gondola/can_equip(obj/item/I, slot, disable_warning, bypass_equip_delay_self)
	if (slot == SLOT_BACK)
		if (!(I.slot_flags & ITEM_SLOT_BACK))
			return 0
		return 1
	. = ..()

/mob/living/simple_animal/pet/gondola/equip_to_slot(obj/item/I, slot)
	if(!slot)
		return
	if(!istype(I))
		return
	
	var/index = get_held_index_of_item(I)
	if(index)
		held_items[index] = null
	update_inv_hands()

	if(I.pulledby)
		I.pulledby.stop_pulling()

	I.screen_loc = null // will get moved if inventory is visible
	I.forceMove(src)
	I.layer = ABOVE_HUD_LAYER
	I.plane = ABOVE_HUD_PLANE

	switch(slot)
		if(SLOT_BACK)
			back = I
			update_inv_back()
		else
			return
	I.equipped(src, slot)

/mob/living/simple_animal/pet/gondola/doUnEquip(obj/item/I, force, newloc, no_move, invdrop = TRUE, silent = FALSE)
	if(..())
		update_inv_hands()
		if(I == back)
			back = null
			update_inv_back()
		return 1
	return 0

/mob/living/simple_animal/pet/gondola/proc/apply_overlay(cache_index)
	if((. = gondola_overlays[cache_index]))
		add_overlay(.)

/mob/living/simple_animal/pet/gondola/proc/remove_overlay(cache_index)
	var/I = gondola_overlays[cache_index]
	if(I)
		cut_overlay(I)
		gondola_overlays[cache_index] = null
		
/mob/living/simple_animal/pet/gondola/update_inv_back()
	remove_overlay(1)

	if(back)
		if(client && hud_used && hud_used.hud_shown)
			back.screen_loc = ui_id
			client.screen += back
		var/used_back_icon = 'icons/mob/back.dmi'
		if (back.alternate_worn_icon)
			used_back_icon = back.alternate_worn_icon
		
		var/mutable_appearance/back_overlay = back.build_worn_icon(state = back.icon_state, default_layer = 1, default_icon_file = used_back_icon)
		gondola_overlays[1] = back_overlay

	apply_overlay(1)

/mob/living/simple_animal/pet/gondola/show_inv(mob/user)
	if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	user.set_machine(src)


	var/dat = 	"<HTML><HEAD><meta charset='UTF-8'></HEAD><BODY><div align='center'><b>Inventory of [name]</b></div><p>"
	dat += "<br><B>Back:</B> <A href='?src=[REF(src)];[back ? "remove_inv=back'>[back]" : "add_inv=back'>Nothing"]</A>"

	user << browse(dat, "window=mob[REF(src)];size=325x500")
	onclose(user, "mob[REF(src)]")

/mob/living/simple_animal/pet/gondola/Topic(href, href_list)
	if(href_list["remove_inv"])
		var/remove_from = href_list["remove_inv"]
		switch(remove_from)
			if("back")
				if(back)
					usr.put_in_hands(back)
					back = null
					update_inv_back()
				else
					to_chat(usr, span_danger("There is nothing to remove from its [remove_from]."))
					return

		show_inv(usr)

	//Adding things to inventory
	else if(href_list["add_inv"])
		var/add_to = href_list["add_inv"]

		switch(add_to)
			if("back")
				if(back)
					to_chat(usr, span_warning("It's already wearing something!"))
					return
				else
					var/obj/item/item_to_add = usr.get_active_held_item()
					item_to_add.forceMove(src)
					src.back = item_to_add
					update_inv_back()

		show_inv(usr)
	else
		return ..()
//slug end
/mob/living/simple_animal/pet/gondola/IsVocal() //Gondolas are the silent walker.
	return FALSE

#undef GONDOLA_HEIGHT
#undef GONDOLA_COLOR
#undef GONDOLA_MOUSTACHE
#undef GONDOLA_EYES
