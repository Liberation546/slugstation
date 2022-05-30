/mob/living/simple_animal/slugcat
	name = "slugcat"
	desc = "What fate a slugcat?"
	icon = 'slugstation/icons/mob/slugcat.dmi'
	icon_state = "slugcat"
	icon_living = "slugcat"
	possible_a_intents = list(INTENT_HELP, INTENT_HARM)
	health = 30
	maxHealth = 30
	unsuitable_atmos_damage = 0
	wander = 0
	speed = -1
	ventcrawler = VENTCRAWLER_ALWAYS
	healable = 0
	density = FALSE
	pass_flags = PASSTABLE | PASSMOB
	status_flags = (CANPUSH | CANSTUN | CANKNOCKDOWN)
	gender = NEUTER
	initial_language_holder = /datum/language_holder/slugcat
	mob_size = MOB_SIZE_SMALL
	hud_possible = list(HEALTH_HUD, STATUS_HUD, ANTAG_HUD)
	unique_name = TRUE
	faction = list("neutral")
	dextrous = TRUE
	dextrous_hud_type = /datum/hud/dextrous/drone
	held_items = list(null, null)
	ignores_capitalism = TRUE
	var/obj/item/internal_storage
	var/obj/item/head
	var/list/drone_overlays[DRONE_TOTAL_LAYERS]

/mob/living/simple_animal/slugcat/examine(mob/user)
	. = list("<span class='info'>*---------*\nThis is [icon2html(src, user)] \a <b>[src]</b>!")

	//Hands
	for(var/obj/item/I in held_items)
		if(!(I.item_flags & ABSTRACT))
			. += "It has [I.get_examine_string(user)] in its [get_held_index_name(get_held_index_of_item(I))]."

	//Internal storage
	if(internal_storage && !(internal_storage.item_flags & ABSTRACT))
		. += "It is holding [internal_storage.get_examine_string(user)] in its internal storage."

	//Cosmetic hat - provides no function other than looks
	if(head && !(head.item_flags & ABSTRACT))
		. += "It is wearing [head.get_examine_string(user)] on its head."
	
	. += "*---------*</span>"
	. += ..()

/mob/living/simple_animal/slugcat/proc/throw_mode_off()
	in_throw_mode = 0

/mob/living/simple_animal/slugcat/proc/throw_mode_on()
	in_throw_mode = 1

/mob/living/simple_animal/slugcat/throw_item(atom/target) //lets slugcats throw shit (like spears)
	. = ..()
	throw_mode_off()
	if(!target || !isturf(loc))
		return
	if(istype(target, /obj/screen))
		return

	var/atom/movable/thrown_thing
	var/obj/item/I = get_active_held_item()
	var/power_throw = 0

	if(!I)
		return
		
	else if(!CHECK_BITFIELD(I.item_flags, ABSTRACT) && !HAS_TRAIT(I, TRAIT_NODROP))
		thrown_thing = I
		dropItemToGround(I, silent = TRUE)

		if(HAS_TRAIT(src, TRAIT_PACIFISM) && I.throwforce)
			to_chat(src, span_notice("You set [I] down gently on the ground."))
			return

	if(thrown_thing)
		if(HAS_TRAIT(src, TRAIT_HULK))
			power_throw++
		visible_message(span_danger("[src] throws [thrown_thing][power_throw ? " really hard!" : "."]"), \
						span_danger("You throw [thrown_thing][power_throw ? " really hard!" : "."]"))
		log_message("has thrown [thrown_thing] [power_throw ? "really hard" : ""]", LOG_ATTACK)
		newtonian_move(get_dir(target, src))
		thrown_thing.safe_throw_at(target, thrown_thing.throw_range, thrown_thing.throw_speed + power_throw, src, null, null, null, move_force)
		changeNext_move(CLICK_CD_RANGE)

/mob/living/simple_animal/slugcat/monk
	name = "monk"
	color = "yellow"

/mob/living/simple_animal/slugcat/hunter
	name = "hunter"
	color = "red"

/mob/living/simple_animal/slugcat/hunter/Initialize()
	. = ..()
	var/obj/item/twohanded/spear/spear = new /obj/item/twohanded/spear(get_turf(src))
	spear.color = "black"
	put_in_hands(spear)

/mob/living/simple_animal/slugcat/rivulet
	name = "rivulet"
	icon_state = "rivulet"

/mob/living/simple_animal/slugcat/artificer
	name = "artificer"
	icon_state = "artificer"

/mob/living/simple_animal/slugcat/spearmaster
	name = "spearmaster"
	icon_state = "spearmaster"

/mob/living/simple_animal/slugcat/gourmand
	name = "gourmand"
	icon_state = "gourmand"

/mob/living/simple_animal/slugcat/saint
	name = "saint"
	color = "green"

/mob/living/simple_animal/slugcat/psychic
	name = "psychic"
	color = "purple"

/mob/living/simple_animal/slugcat/martyr
	name = "martyr"
	icon_state = "martyr"

/mob/living/simple_animal/slugcat/runner
	name = "scorerunner"
	icon_state = "runner"

/mob/living/simple_animal/slugcat/automaton
	name = "automaton"
	icon_state = "automaton"

/mob/living/simple_animal/slugcat/wanderer
	name = "wanderer"
	icon_state = "wanderer"
