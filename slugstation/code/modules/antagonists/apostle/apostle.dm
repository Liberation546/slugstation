/proc/isapostle(mob/living/M)
	return istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/apostle)

/datum/antagonist/proc/handle_clown_mutation(mob/living/mob_override, message, removing = TRUE)
	var/mob/living/carbon/human/H = mob_override
	if(H && istype(H) && owner.assigned_role == "Clown")
		if(removing) // They're a clown becoming an antag, remove clumsy
			H.dna.remove_mutation(CLOWNMUT)
			if(!silent && message)
				to_chat(H, "<span class='boldnotice'>[message]</span>")
		else
			H.dna.add_mutation(CLOWNMUT) // We're removing their antag status, add back clumsy

/datum/antagonist/apostle
	name = "Apostle"
	roundend_category = "apostles"
	job_rank = "Apostle"
	antag_moodlet = /datum/mood_event/focused
	var/number = 1 // Number of apostle, obviously. Used for finale
	var/betrayed = FALSE // For one-sin interaction
	var/heretic = FALSE // for determining who the heretic is
	var/datum/team/apostles/ap_team
	show_to_ghosts = TRUE

/datum/antagonist/apostle/New()
	. = ..()
	GLOB.apostles |= src

/datum/antagonist/apostle/on_gain()
	. = ..()

/datum/team/apostles
	name = "Apostles"
	var/victory_state = "none" // Updated on rapture and death

/datum/antagonist/apostle/get_team()
	return ap_team

/datum/antagonist/apostle/create_team(datum/team/apostles/new_team)
	if(!new_team)
		for(var/datum/antagonist/apostle/P in GLOB.antagonists)
			if(!P.owner)
				continue
			if(P.ap_team)
				ap_team = P.ap_team
				return
		ap_team = new /datum/team/apostles
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	ap_team = new_team

/datum/antagonist/apostle/apply_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	handle_clown_mutation(M, mob_override ? null : "The holy light grants you supreme power, allowing you to wield weapons once again.")

/datum/antagonist/apostle/remove_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	handle_clown_mutation(M, removing = FALSE)

/datum/antagonist/apostle/proc/rapture()
	var/mob/living/carbon/human/H = owner.current
	var/datum/outfit/ApostleFit = new /datum/outfit/apostle
	var/obj/item/wep_type
	var/obj/effect/proc_holder/spell/spell_type = /obj/effect/proc_holder/spell/targeted/summonitem
	ap_team.victory_state = "rapture"
	switch(number)
		if(1, 11) // Guardian
			wep_type = /obj/item/nullrod/scythe/apostle/guardian
			ApostleFit.mask = /obj/item/clothing/mask/gas/apostle/guardian
		if(2, 3) // Scythe
			wep_type = /obj/item/nullrod/scythe/apostle
		if(4, 5, 6) // Staff
			wep_type = /obj/item/gun/magic/staff/apostle
		if(7, 8, 9, 10) // Spear
			wep_type = /obj/item/nullrod/spear/apostle
		else
			var/gear = rand(1,9)
			switch(gear)
				if(1, 2) // Scythe
					wep_type = /obj/item/nullrod/scythe/apostle
				if(3, 4, 5) // Staff
					wep_type = /obj/item/gun/magic/staff/apostle
				if(6, 7, 8, 9) // Spear
					wep_type = /obj/item/nullrod/spear/apostle
	if(heretic == TRUE) // Heretic
		H.dropItemToGround(H.wear_mask)
		spell_type = null
		ApostleFit = /datum/outfit/apostle_heretic
		to_chat(H, "<span class='userdanger'>Only now you realize the errors of your way! Seek to destroy the false prophet at any cost!</span>")
		to_chat(H, "<span class='notice'>The bible shall grant you the powers to destroy them...</span>")
		H.faction -= "apostle"
	H.equipOutfit(ApostleFit)
	if(wep_type)
		var/obj/item/held = H.get_active_held_item()
		var/obj/item/wep = new wep_type(H, silent)
		H.dropItemToGround(held) // First - drop current item.
		H.put_in_hands(wep) // Then put an epic one.
	if(spell_type)
		for(var/obj/effect/proc_holder/spell/knownspell in H.mind.spell_list)
			if(knownspell == spell_type)
				return // Don't grant spells that we already know
		var/obj/effect/proc_holder/spell/G = new spell_type
		H.mind.AddSpell(G)

/datum/antagonist/apostle/proc/prophet_death()
	var/mob/living/carbon/human/H = owner.current
	to_chat(H, "<span class='colossus'>The prophet is dead...</span>")
	H.visible_message("<span class='danger'>[H.real_name] briefly looks above...</span>", "<span class='userdanger'>You see the light above...</span>")
	H.emote("scream")
	H.Immobilize(200)
	switch(ap_team.victory_state)
		if("rapture")
			ap_team.victory_state = "death_rapture"
		else
			ap_team.victory_state = "death"
	addtimer(CALLBACK(src, .proc/soundd_in), (number * 6))

/datum/antagonist/apostle/proc/soundd_in()
	var/mob/living/carbon/human/H = owner.current
	var/turf/T = get_turf(H)
	playsound(H, 'slugstation/sound/lcorp/apostle_death_final.ogg', 60, TRUE, TRUE)
	new /obj/effect/temp_visual/cult/sparks(T)
	addtimer(CALLBACK(src, .proc/drop_dust), 25)

/datum/antagonist/apostle/proc/drop_dust()
	var/mob/living/carbon/human/H = owner.current
	GLOB.apostles -= src
	for(var/obj/item/W in H)
		if(!H.dropItemToGround(W))
			qdel(W)
	H.dust()

/datum/team/apostles/roundend_report()
	var/list/parts = list("<span class='header'>The holy apostles were:</span>")
	var/list/members = get_team_antags(/datum/antagonist/apostle,TRUE)
	for(var/datum/antagonist/apostle/A in members)
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
		parts += "[printplayer(A.owner.current.mind)]; The [A.number][mod] apostle."
	switch(victory_state)
		if("rapture")
			parts += "<span class='greentext big'>Victory!</span>"
			parts += "<B>The rapture has been successful and White Night lives on.</B>"
		if("death_rapture")
			parts += "<span class='neutraltext big'>Draw!</span>"
			parts += "<B>The rapture has been successful, but White Night has been defeated.</B>"
		if("death")
			parts += "<span class='redtext big'>Major Defeat!</span>"
			parts += "<B>White Night didn't manage to achieve rapture and was defeated.</B>"
		else
			parts += "<span class='redtext big'>Defeat!</span>"
			parts += "<B>The apostles didn't manage to achieve rapture.</B>"

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"
