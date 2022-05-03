/obj/item/twohanded/required/mithrix
	name = "lunar hammer"
	desc = "A large hammer made of some sort of lunar material. How could someone hold this?"
	icon = 'icons/obj/mining.dmi'
	icon_state = "mining_hammer1"
	item_state = "mining_hammer1"
	lefthand_file = 'icons/mob/inhands/weapons/hammers_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/hammers_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	force = 25
	hitsound = 'sound/weapons/sonic_jackhammer.ogg'
	attack_verb = list("hammered", "slammed", "smashed")
	var/shockwave = FALSE //do we make a shockwave?

/obj/item/twohanded/required/mithrix/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	..()
	if(shockwave)
		if(!proximity_flag)
			make_shockwave(user)

/obj/item/twohanded/required/mithrix/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_shockwave))
		shockwave = !shockwave
		to_chat(user, span_warning("The hammer will [shockwave ? "no longer":"now"] make shockwaves."))
		return
	if(user)
		user.update_action_buttons_icon()

/obj/item/twohanded/required/mithrix/proc/make_shockwave(mob/living/user)
	var/epicenter
	switch(user.dir)
		if(NORTH)
			epicenter = locate(user.x,user.y + 2,user.z)
		if(SOUTH)
			epicenter = locate(user.x,user.y - 2,user.z)
		if(EAST)
			epicenter = locate(user.x + 2,user.y,user.z)
		if(WEST)
			epicenter = locate(user.x - 2,user.y,user.z)
	if(epicenter)
		explosion(epicenter, 0, 0, 2, 0)
