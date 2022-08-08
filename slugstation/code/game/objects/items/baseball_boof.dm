/obj/item/clothing/mask/cigarette/rollie/bat
	name = "baseball boof"
	desc = "A blunt weapon."
	icon = 'slugstation/icons/obj/clothing/masks.dmi'
	icon_state = "boofoff"
	icon_on = "boofon"
	icon_off = "boofoff"
	type_butt = /obj/item/cigbutt/roach
	throw_speed = 0.5
	item_state = "baseball_boof"
	smoketime = 120 // four minutes
	chem_volume = 500
	list_reagents = null
	lefthand_file = 'slugstation/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'slugstation/icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 2
	wound_bonus = -20
	throwforce = 6
	attack_verb = list("smoked")
	w_class = WEIGHT_CLASS_HUGE

/obj/item/clothing/mask/cigarette/rollie/bat/light(flavor_text = null)
	if(lit)
		return
	if(!(flags_1 & INITIALIZED_1))
		icon_state = icon_on
		return

	lit = TRUE
	name = "lit [name]"
	attack_verb = list("burnt", "singed")
	hitsound = 'sound/items/welder.ogg'
	damtype = BURN
	force = 4
	if(reagents.get_reagent_amount(/datum/reagent/toxin/plasma)) // the plasma explodes when exposed to fire
		var/datum/effect_system/reagents_explosion/e = new()
		e.set_up(round(reagents.get_reagent_amount(/datum/reagent/toxin/plasma) / 2.5, 1), get_turf(src), 0, 0)
		e.start()
		qdel(src)
		return
	if(reagents.get_reagent_amount(/datum/reagent/fuel)) // the fuel explodes, too, but much less violently
		var/datum/effect_system/reagents_explosion/e = new()
		e.set_up(round(reagents.get_reagent_amount(/datum/reagent/fuel) / 5, 1), get_turf(src), 0, 0)
		e.start()
		qdel(src)
		return
	if(reagents.get_reagent_amount(/datum/reagent/nitroglycerin)) // nitrogylcerin explodes with a whole lot more strength
		var/datum/effect_system/reagents_explosion/e = new()
		e.set_up(round(reagents.get_reagent_amount(/datum/reagent/nitroglycerin), 1), get_turf(src), 0, 0)
		e.start()
		qdel(src)
		return
	// allowing reagents to react after being lit
	DISABLE_BITFIELD(reagents.flags, NO_REACT)
	reagents.handle_reactions()
	icon_state = icon_on
	item_state = icon_on
	if(flavor_text)
		var/turf/T = get_turf(src)
		T.visible_message(flavor_text)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/mask/cigarette/rollie/bat/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(isliving(target) && (lit && smoketime > 0))
		var/mob/living/L = target
		L.apply_damage(8, BURN)


/obj/item/clothing/mask/cigarette/rollie/bat/Initialize()
	. = ..()
	pixel_x = rand(-5, 5)
	pixel_y = rand(-5, 5)

/obj/item/rollingpaper/large
	name = "large rolling paper"
	desc = "A piece of paper used to make fat fucking darts."
	icon = 'slugstation/icons/obj/cigarettes.dmi'
	icon_state = "big_cig_paper"
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/rollingpaper/large/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return
	if(istype(target, /obj/item/reagent_containers/food/snacks/grown))
		var/obj/item/reagent_containers/food/snacks/grown/O = target
		if(O.dry)
			src.contents.Add(O)
			if (LAZYLEN(src.contents) >= 10)
				var/obj/item/clothing/mask/cigarette/rollie/bat/R = new /obj/item/clothing/mask/cigarette/rollie/bat(user.loc)
				R.chem_volume = target.reagents.total_volume
				for (var/obj/item/reagent_containers/food/snacks/grown/C in src.contents)
					C.reagents.trans_to(R, R.chem_volume, transfered_by = user)
				qdel(src)
				user.put_in_active_hand(R)
				to_chat(user, span_notice("You create a fat fucking dart."))
		else
			to_chat(user, span_warning("You need to dry this first!"))

/datum/crafting_recipe/large_rolling_paper
	name = "Large Rolling Paper"
	reqs = list(/obj/item/rollingpaper = 5)
	blacklist = list(/obj/item/rollingpaper/large)
	result = /obj/item/rollingpaper/large
	time = 4 SECONDS
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON
