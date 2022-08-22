// i have no idea why this shits out errors, but it builds so im not fixing it
GLOBAL_LIST_EMPTY(apostles)

/proc/rays_filter(size, color, offset, density, threshold, factor, x, y, flags)
	. = list("type" = "rays")
	if(!isnull(size))
		.["size"] = size
	if(!isnull(color))
		.["color"] = color
	if(!isnull(offset))
		.["offset"] = offset
	if(!isnull(density))
		.["density"] = density
	if(!isnull(threshold))
		.["threshold"] = threshold
	if(!isnull(factor))
		.["factor"] = factor
	if(!isnull(x))
		.["x"] = x
	if(!isnull(y))
		.["y"] = y
	if(!isnull(flags))
		.["flags"] = flags

/proc/get_ranged_target_turf_direct(atom/A, atom/target, range, offset)
	var/angle = ATAN2(target.x - A.x, target.y - A.y)
	if(offset)
		angle += offset
	var/turf/T = get_turf(A)
	for(var/i in 1 to range)
		var/turf/check = locate(A.x + cos(angle) * i, A.y + sin(angle) * i, A.z)
		if(!check)
			break
		T = check

	return T

/mob/living/simple_animal/hostile/abnormality
	name = "Abnormality"
	desc = "An abnormality..?"
	robust_searching = TRUE
	ranged_ignores_vision = TRUE
	stat_attack = DEAD
	layer = LARGE_MOB_LAYER
	a_intent = INTENT_HARM
	del_on_death = TRUE
	damage_coeff = list(BRUTE = 1, RED_DAMAGE = 1, WHITE_DAMAGE = 1, BLACK_DAMAGE = 1, PALE_DAMAGE = 1)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	see_in_dark = 7
	vision_range = 12
	aggro_vision_range = 20
	move_resist = MOVE_FORCE_STRONG // They kept stealing my abnormalities
	pull_force = MOVE_FORCE_STRONG
	mob_size = MOB_SIZE_HUGE // No more lockers, Whitaker
	blood_volume = 560 // THERE WILL BE BLOOD. SHED.
	/// Copy-pasted from megafauna.dm: This allows player controlled mobs to use abilities
	var/chosen_attack = 1
	/// Attack actions, sets chosen_attack to the number in the action
	var/list/attack_action_types = list()
	/// If there is a small sprite icon for players controlling the mob to use
	var/small_sprite_type

/mob/living/simple_animal/hostile/abnormality/Initialize(mapload)
	. = ..()
	for(var/action_type in attack_action_types)
		var/datum/action/innate/abnormality_attack/attack_action = new action_type()
		attack_action.Grant(src)
	if(small_sprite_type)
		var/datum/action/small_sprite/small_action = new small_sprite_type()
		small_action.Grant(src)

/mob/living/simple_animal/hostile/abnormality/Move()
	if(status_flags & GODMODE) // STOP STEALING MY FREAKING ABNORMALITIES
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/abnormality/white_night
	name = "White night"
	desc = "The heavens' wrath. Say your prayers, heretic, the day has come."
	health = 2000
	maxHealth = 2000
	attacktext = "purges"
	attack_sound = 'sound/magic/mm_hit.ogg'
	icon = 'slugstation/icons/mob/abnormality/64x64.dmi'
	icon_state = "white_night"
	icon_living = "white_night"
	health_doll_icon = "white_night"
	faction = list("apostle")
	friendly = "stares down"
	speak_emote = list("proclaims")
	melee_damage_type = BRUTE
	melee_damage_lower = 35
	melee_damage_upper = 40
	obj_damage = 600
	environment_smash = ENVIRONMENT_SMASH_WALLS
	speed = 1
	move_to_delay = 5
	ranged = TRUE
	pixel_x = -16
	pixel_y = -16
	//loot = list(/obj/item/ego_weapon/paradise,/obj/item/clothing/suit/armor/ego_gear/paradise)
	deathmessage = "evaporates in a moment, leaving heavenly light and feathers behind."
	deathsound = 'slugstation/sound/lcorp/apostle_death.ogg'
	attack_action_types = list(/datum/action/innate/abnormality_attack/holy_revival,
							   /datum/action/innate/abnormality_attack/fire_field,
							   ///datum/action/innate/abnormality_attack/deafening_scream,
							   /datum/action/innate/abnormality_attack/holy_blink)
	
	light_color = "#FAE48E"
	light_range = 7
	light_power = 3

	var/holy_revival_cooldown = 20 SECONDS
	var/holy_revival_cooldown_base = 20 SECONDS
	var/holy_revival_damage = 28 // Pale damage, scales with distance
	var/holy_revival_range = 4
	var/last_revival_time // To prevent multiple conversions per one action
	var/fire_field_cooldown = 20 SECONDS
	var/fire_field_cooldown_base = 20 SECONDS
	var/field_range = 4
	var/scream_cooldown = 18 SECONDS
	var/scream_cooldown_base = 18 SECONDS
	var/scream_power = 20
	var/blink_cooldown = 6 SECONDS
	var/blink_cooldown_base = 6 SECONDS
	var/apostle_num = 1 //Number of apostles. Used for revival and finale.
	var/apostle_line
	var/apostle_prev //Used for previous apostle's name, to reference in next line.
	var/datum/action/innate/abnormality_attack/rapture/rapture_skill = new /datum/action/innate/abnormality_attack/rapture

/mob/living/simple_animal/hostile/abnormality/white_night/ex_act(severity, target)
	return //Resistant to explosions

/datum/action/innate/abnormality_attack
	name = "Megafauna Attack"
	icon_icon = 'icons/mob/actions/actions_animal.dmi'
	button_icon_state = ""
	var/mob/living/simple_animal/hostile/abnormality/A
	var/chosen_message
	var/chosen_attack_num = 0

/datum/action/innate/abnormality_attack/Grant(mob/living/L)
	if(istype(L, /mob/living/simple_animal/hostile/abnormality))
		A = L
		return ..()
	return FALSE

/datum/action/innate/abnormality_attack/Activate()
	A.chosen_attack = chosen_attack_num
	to_chat(A, chosen_message)

/datum/action/innate/abnormality_attack/holy_revival
	name = "Holy Revival"
	icon_icon = 'icons/obj/wizard.dmi'
	button_icon_state = "magicm"
	chosen_message = "<span class='colossus'>You are now reviving the dead to join your cause.</span>"
	chosen_attack_num = 1

/datum/action/innate/abnormality_attack/fire_field
	name = "Fire Field"
	icon_icon = 'icons/effects/fire.dmi'
	button_icon_state = "fire"
	chosen_message = "<span class='colossus'>You are now setting the area on explosive fire.</span>"
	chosen_attack_num = 2

/datum/action/innate/abnormality_attack/deafening_scream
	name = "Deafening Scream"
	icon_icon = 'icons/mob/actions/actions_spells.dmi'
	button_icon_state = "shield"
	chosen_message = "<span class='colossus'>You will now shout with all your might to shatter enemy's will.</span>"
	chosen_attack_num = 3

/datum/action/innate/abnormality_attack/holy_blink
	name = "Holy Blink"
	icon_icon = 'icons/effects/bubblegum.dmi'
	button_icon_state = "smack ya one"
	chosen_message = "<span class='colossus'>You will now blink to your target and throw away the heretics.</span>"
	chosen_attack_num = 4

/datum/action/innate/abnormality_attack/rapture
	name = "Rapture"
	icon_icon = 'icons/obj/storage.dmi'
	button_icon_state = "bible"
	chosen_message = "<span class='colossus'>Finale...</span>"
	chosen_attack_num = 5

/mob/living/simple_animal/hostile/abnormality/white_night/Life()
	if(client) // player controlled
		speed = 1
	else
		speed = 2

/mob/living/simple_animal/hostile/abnormality/white_night/AttackingTarget()
	if(isliving(target))
		var/mob/living/L = target
		if("apostle" in L.faction)
			return
	. = ..()
	if(. && isliving(target))
		var/mob/living/L = target
		if(L.stat != DEAD)
			if(!client && ranged && ranged_cooldown <= world.time)
				OpenFire()

			if(L.health <= HEALTH_THRESHOLD_DEAD && HAS_TRAIT(L, TRAIT_NODEATH))
				devour(L)
		else
			devour(L)

/mob/living/simple_animal/hostile/abnormality/white_night/proc/devour(mob/living/L)
	if(apostle_num < 13)
		var/mob/dead/observer/ghost = L.get_ghost(TRUE, TRUE)
		if(ishuman(L))
			if(L.client || ghost?.can_reenter_corpse) // If ghost is able to reenter - we can't gib the body.
				revive_target(L)
				return
	L.gib()

/mob/living/simple_animal/hostile/abnormality/white_night/OpenFire()
	if(client)
		switch(chosen_attack)
			if(1)
				revive_humans()
			if(2)
				fire_field()
			if(3)
				//Fuck deafening screen, all my homies hate deafening scream.
				//deafening_scream()
			if(4)
				holy_blink(target)
			if(5)
				rapture()
		return

	if(get_dist(src, target) >= 3 && blink_cooldown <= world.time)
		holy_blink(target)
	if(get_dist(src, target) < 5)
		if(holy_revival_cooldown <= world.time)
			revive_humans()
		else if(fire_field_cooldown <= world.time)
			fire_field()
		//else if(scream_cooldown <= world.time)
			//deafening_scream()

/mob/living/simple_animal/hostile/abnormality/white_night/death(gibbed)
	for(var/datum/antagonist/apostle/A in GLOB.apostles)
		if(!A.owner || !ishuman(A.owner.current))
			continue
		A.prophet_death()
	return ..()

/mob/living/simple_animal/hostile/abnormality/white_night/proc/revive_humans(range_override = null, faction_check = "apostle")
	if(holy_revival_cooldown > world.time)
		return
	if(range_override == null)
		range_override = holy_revival_range
	holy_revival_cooldown = (world.time + holy_revival_cooldown_base)
	playsound(src, 'slugstation/sound/lcorp/apostle_spell.ogg', 75, 1, range_override)
	var/turf/target_c = get_turf(src)
	var/list/turf_list = list()
	for(var/i = 1 to range_override)
		turf_list = spiral_range_turfs(i, target_c) - spiral_range_turfs(i-1, target_c)
		for(var/turf/open/T in turf_list)
			var/obj/effect/temp_visual/cult/sparks/S = new(T)
			if(faction_check != "apostle")
				S.color = "#AAFFAA" // Indicating that it's a good thing
			for(var/mob/living/L in T.contents)
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					new /obj/effect/temp_visual/dir_setting/cult/phase(T, H.dir)
					addtimer(CALLBACK(src, .proc/revive_target, H, i, faction_check))
					continue
				// Not a human and an enemy
				if(!(faction_check in L.faction))
					playsound(L.loc, 'sound/machines/clockcult/ark_damage.ogg', 35, TRUE, -1)
					L.adjustPaleLoss(holy_revival_damage)
		SLEEP_CHECK_DEATH(1.5)

/mob/living/simple_animal/hostile/abnormality/white_night/proc/revive_target(mob/living/carbon/human/H, attack_range = 1, faction_check = "apostle")
	if(!(faction_check in H.faction))
		var/max_apostles = 0
		for(var/mob/living/carbon/human/C in GLOB.carbon_list)
			if(H.client)
				if(H.stat != DEAD)
					max_apostles++
		max_apostles = round(max_apostles * 0.75)
		if(apostle_num < max_apostles && H.stat == DEAD && H.mind && world.time > last_revival_time + 5 SECONDS)
			if(!H.client)
				var/mob/dead/observer/ghost = H.get_ghost(TRUE, TRUE)
				if(!ghost?.can_reenter_corpse) // If there is nobody able to control it - skip.
					return
				else // If it can reenter - do it.
					H.grab_ghost(force = TRUE)
			H.regenerate_limbs()
			H.regenerate_organs()
			H.dna.species.GiveSpeciesFlight(H)
			H.revive(full_heal = TRUE, admin_revive = FALSE)
			// Giving the fancy stuff to new apostle
			H.faction |= "apostle"
			ADD_TRAIT(H, TRAIT_BOMBIMMUNE, "White Night Apostle")
			ADD_TRAIT(H, TRAIT_NOFIRE, "White Night Apostle")
			ADD_TRAIT(H, TRAIT_NOBREATH, "White Night Apostle")
			ADD_TRAIT(H, TRAIT_RESISTLOWPRESSURE, "White Night Apostle")
			ADD_TRAIT(H, TRAIT_RESISTCOLD, "White Night Apostle")
			ADD_TRAIT(H, TRAIT_NODISMEMBER, "White Night Apostle")
			to_chat(H, "<span class='notice'>You are protected by the holy light!</span>")
			if(apostle_num < max_apostles)
				H.set_light(4, l_color = "#FAE48E")
				H.add_overlay(mutable_appearance('icons/effects/genetics.dmi', "servitude", -MUTATIONS_LAYER))
				var/mutable_appearance/apostle_halo = mutable_appearance('slugstation/icons/mob/apostle.dmi', "halo", -HALO_LAYER)
				H.overlays_standing[HALO_LAYER] = apostle_halo
				H.apply_overlay(HALO_LAYER)
			last_revival_time = world.time
			SLEEP_CHECK_DEATH(20)
			// Executing rapture scenario
			switch(apostle_num)
				if(1)
					apostle_line = "And I tell you, you are [H.real_name] the apostle, and on this rock I will build my church, and the gates of hell shall not prevail against it."
				if(2)
					apostle_line = "Tell us, when will this happen, and what will be the sign of your coming and of the end of the age?"
				if(3)
					apostle_line = "Do you want us to call fire down from heaven to destroy them?"
					apostle_prev = H.real_name
				if(4)
					apostle_line = "[apostle_prev] the apostle and [H.real_name] the apostle, to them he gave the name Boanerges, which means \"sons of thunder\""
				if(5)
					apostle_line = "[H.real_name] the apostle said, \"Show us the Father and that will be enough for us.\""
				if(6)
					apostle_line = "He saw a human named [H.real_name] the apostle. \"Follow me.\" he told him, and [H.real_name] got up and followed him."
				if(7)
					apostle_line = "Now for some time [H.real_name] the apostle had practiced sorcery and amazed all the people."
				if(8)
					apostle_line = "Then [H.real_name] the apostle said to the rest of disciples, \"Let us also go, that we may die with him.\""
				if(9)
					apostle_line = "Then [H.real_name] the apostle declared, \"You are the son of him, you are the king.\""
				if(10)
					apostle_line = "Then [H.real_name] the apostle said, \"But why do you intend to show yourself to us and not to the world?\""
				if(11)
					apostle_line = "From now on, let no one cause me trouble, for I bear on my body the marks of him."
				else
					apostle_line = ""
			if(apostle_num == max_apostles) //Here we go sicko mode
				var/mod = "st"
				if(apostle_num < 20)
					switch(apostle_num)
						if(1)
							mod = "st"
						if(2)
							mod = "nd"
						if(3)
							mod = "rd"
						else
							mod = "th"
				else
					switch(apostle_num % 10)
						if(1)
							mod = "st"
						if(2)
							mod = "nd"
						if(3)
							mod = "rd"
						else
							mod = "th"
					apostle_line = "Have I not chosen you, the [apostle_num][mod]? Yet one of you is a devil."
					rapture_skill.Grant(src)
					if(!client) // AI in control
						addtimer(CALLBACK(src, .proc/rapture), 5 SECONDS)
			for(var/mob/M in GLOB.player_list)
				if(M.z == z && M.client)
					if(apostle_line)
						to_chat(M, "<span class='userdanger'>[apostle_line]</span>")
					SEND_SOUND(M, 'slugstation/sound/lcorp/apostle_bell.ogg')
					flash_color(M, flash_color = "#FF4400", flash_time = 50)
			var/datum/antagonist/apostle/new_apostle = new /datum/antagonist/apostle
			new_apostle.number = apostle_num
			if(new_apostle.number == max_apostles)
				new_apostle.heretic = TRUE
			H.mind.add_antag_datum(new_apostle)
			to_chat(H,"<span class='colossus'>Your purpose becomes clear. Defend White Night at all costs and help Him achieve rapture!</span>")
			apostle_num += 1
			maxHealth += 50
			health = maxHealth
			holy_revival_damage += 1 // More damage and healing from AOE spell.
		else
			playsound(H.loc, 'sound/machines/clockcult/ark_damage.ogg', 50 - attack_range, TRUE, -1)
			// The farther you are from white night - the less damage it deals
			var/dealt_damage = max(1, holy_revival_damage - attack_range)
			H.apply_damage(dealt_damage, BURN, null, H.run_armor_check(null, BURN))
			if((holy_revival_damage - attack_range) > 5)
				H.emote("scream")
			to_chat(H, "<span class='userdanger'>The holy light... IT BURNS!!</span>")
	else
		if(H.stat == DEAD && H.mind && faction_check == "apostle") // No gaming
			H.regenerate_limbs()
			H.regenerate_organs()
			H.dna.species.GiveSpeciesFlight(H)
			H.revive(full_heal = TRUE, admin_revive = FALSE)
			H.grab_ghost(force = TRUE)
			to_chat(H, "<span class='notice'>The holy light compels you to live!</span>")
		else
			H.adjustStaminaLoss(-200)
			H.adjustBruteLoss(-holy_revival_damage*5)
			H.adjustFireLoss(-holy_revival_damage*5)
			H.regenerate_limbs()
			H.regenerate_organs()
			to_chat(H, "<span class='notice'>The holy light heals you!</span>")

/mob/living/simple_animal/hostile/abnormality/white_night/proc/fire_field()
	if(fire_field_cooldown > world.time)
		return
	var/turf/target_c = get_turf(src)
	var/list/fire_zone = list()
	fire_field_cooldown = (world.time + fire_field_cooldown_base)
	for(var/i = 1 to field_range)
		playsound(target_c, 'sound/machines/clockcult/stargazer_activate.ogg', 50, 1)
		fire_zone = spiral_range_turfs(i, target_c) - spiral_range_turfs(i-1, target_c)
		for(var/turf/open/T in fire_zone)
			new /obj/effect/temp_visual/cult/turf/floor(T)
		SLEEP_CHECK_DEATH(1.5)
	SLEEP_CHECK_DEATH(3)
	for(var/i = 1 to field_range)
		fire_zone = spiral_range_turfs(i, target_c) - spiral_range_turfs(i-1, target_c)
		playsound(target_c, "explosion", 50, TRUE)
		for(var/turf/open/T in fire_zone)
			new /obj/effect/hotspot(T)
			T.hotspot_expose(400, 30, 1)
			for(var/mob/living/L in T.contents)
				if("apostle" in L.faction)
					continue
				L.adjustFireLoss(15)
				to_chat(L, "<span class='userdanger'>You're hit by [src]'s fire field!</span>")
		SLEEP_CHECK_DEATH(1.5)

/mob/living/simple_animal/hostile/abnormality/white_night/proc/deafening_scream()
	if(scream_cooldown > world.time)
		return
	scream_cooldown = (world.time + scream_cooldown_base)
	playsound(src, 'slugstation/sound/lcorp/apostle_shout.ogg', 30, 1)
	for(var/mob/living/carbon/C in get_hearers_in_view(6, src))
		to_chat(C, "<span class='danger'>[src] shouts incredibly loud!</span>")
		if("apostle" in C.faction)
			continue
		shake_camera(C, 1, 2)
		C.soundbang_act(1, scream_power, 4)
		C.jitteriness += (scream_power * 0.5)
		C.do_jitter_animation(C.jitteriness)
		C.blur_eyes(scream_power * 0.3, 0.6)
		C.stuttering += (scream_power)
	if(apostle_num == 666)
		for(var/obj/machinery/light/L in range(6, src)) // A copy from apc.dm
			L.on = TRUE
			L.break_light_tube()
			L.on = FALSE

/mob/living/simple_animal/hostile/abnormality/white_night/proc/holy_blink(blink_target)
	if(blink_cooldown > world.time)
		return
	if(!blink_target)
		blink_target = target
	blink_cooldown = (world.time + blink_cooldown_base)
	var/turf/T = get_turf(blink_target)
	var/turf/S = get_turf(src)
	for(var/turf/a in range(1, S))
		new /obj/effect/temp_visual/cult/sparks(a)
	SLEEP_CHECK_DEATH(2.5)
	for(var/turf/b in range(1, T))
		new /obj/effect/temp_visual/cult/sparks(b)
	SLEEP_CHECK_DEATH(5)
	src.visible_message("<span class='danger'>[src] blinks away!</span>")
	for(var/turf/b in range(1, T))
		new /obj/effect/temp_visual/small_smoke/halfsecond(b)
		for(var/mob/living/H in b)
			if(!("apostle" in H.faction))
				to_chat(H, "<span class='userdanger'>A sudden wave of wind sends you flying!</span>")
				var/turf/thrownat = get_ranged_target_turf_direct(src, H, 8, rand(-10, 10))
				H.throw_at(thrownat, 8, 2, src, TRUE)
				H.apply_damage(10, BRUTE)
				shake_camera(H, 2, 1)
	playsound(T, 'sound/effects/bamf.ogg', 100, 1)
	forceMove(T)

/mob/living/simple_animal/hostile/abnormality/white_night/proc/rapture()
	rapture_skill.Remove(src)
	chosen_attack = 1 // To avoid rapture spam
	to_chat(src, "<span class='userdanger'>You begin the final ritual...</span>")
	for(var/mob/M in GLOB.player_list)
		if(M.client) // Send it to every player currently active, not just everyone on Z-level
			SEND_SOUND(M, 'slugstation/sound/lcorp/apostle_antag/rapture.ogg')
	SLEEP_CHECK_DEATH(30)
	for(var/datum/antagonist/apostle/A in GLOB.apostles)
		if(!A.owner || !ishuman(A.owner.current))
			continue
		var/mob/living/carbon/H = A.owner.current
		if(!H.client)
			var/mob/dead/observer/ghost = H.get_ghost(TRUE, TRUE)
			if(!ghost?.can_reenter_corpse) // If there is nobody able to control it - offer to ghosts.
				addtimer(CALLBACK(GLOBAL_PROC, /proc/offer_control, H))
			else
				H.grab_ghost(force = TRUE)
		H.revive(full_heal = TRUE, admin_revive = FALSE)
		A.rapture()
		shake_camera(H, 1, 1)
		if(A.heretic == FALSE)
			var/turf/main_loc = get_step(src, pick(0,1,2,4,5,6,8,9,10))
			SLEEP_CHECK_DEATH(3)
			new /obj/effect/temp_visual/cult/blood(get_turf(H))
			SLEEP_CHECK_DEATH(20)
			new /obj/effect/temp_visual/cult/blood/out(get_turf(H))
			new /obj/effect/temp_visual/cult/blood(main_loc)
			SLEEP_CHECK_DEATH(3)
			H.forceMove(main_loc)
		if(A.heretic == TRUE)
			//H.gain_trauma(/datum/brain_trauma/severe/pacifism, TRAUMA_RESILIENCE_ABSOLUTE) // one sin not implemented, bad idea to put this here
			H.status_flags |= GODMODE // Immortality...
			SLEEP_CHECK_DEATH(26)
		for(var/mob/M in GLOB.player_list)
			if(M.z == z && M.client)
				var/mod = "st"
				switch(A.number)
					if(1)
						mod = "st"
					if(2)
						mod = "nd"
					if(3)
						mod = "rd"
					else
						mod = "th"
				to_chat(M, "<span class='userdanger'>[H.real_name], the [A.number][mod]...</span>")
				SEND_SOUND(M, 'slugstation/sound/lcorp/apostle_bell.ogg')
				flash_color(M, flash_color = "#FF4400", flash_time = 50)
		SLEEP_CHECK_DEATH(60)
	SLEEP_CHECK_DEATH(300)
	to_chat(src, "<span class='userdanger'>You feel stronger than ever...</span>")
	apostle_num = 666
	holy_revival_range = 20 // Get fucked
	fire_field_cooldown_base = 16 SECONDS
	field_range += 1 // Powercrepe
	add_filter("apostle", 1, rays_filter(size = 64, color = "#FFFF00", offset = 6, density = 16, threshold = 0.05))
	for(var/mob/M in GLOB.player_list)
		if(M.z == z && M.client)
			M.playsound_local(get_turf(M), 'slugstation/sound/lcorp/apostle_antag/rapture2.ogg', 50, 0)
