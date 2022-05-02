/datum/species/gondola
	name = "Gondola"
	id = "gondola"
	default_color = "A87855"
	fixed_mut_color = "A87855"
	species_traits = list(LIPS,HAS_FLESH,HAS_BONE,MUTCOLORS,NOCOLORCHANGE,NOEYESPRITES, NO_UNDERWEAR)
	skinned_type = /obj/item/stack/sheet/animalhide/gondola
	liked_food = JUNKFOOD | FRIED | GRILLED | RAW | GROSS
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP
	inherent_traits = list(TRAIT_NOHUNGER,TRAIT_RESISTCOLD,TRAIT_RESISTLOWPRESSURE,TRAIT_NOBREATH)
	payday_modifier = 1.1 //The Perfect Beings.
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/gondola
	limbs_id = "gondola"
	burnmod = 0.75
	brutemod = 0.75
	stunmod = 0.75
	mutanttongue = /obj/item/organ/tongue/gondola_tongue
	var/datum/action/innate/break_gondoloath/break_gondoloath
	var/gondoloath_broken = FALSE
	var/mutable_appearance/moustache

/datum/species/gondola/handle_mutant_bodyparts(mob/living/carbon/human/H, forced_colour)
	..()
	H.add_overlay(list(moustache))

/datum/species/gondola/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	..()
	moustache =  mutable_appearance('icons/mob/gondola_face.dmi', "facial_walrus", layer = -HAIR_LAYER)
	C.ignore_slowdown(C)
	if (C.get_bodypart(BODY_ZONE_L_ARM))
		var/obj/item/bodypart/arm = C.get_bodypart(BODY_ZONE_L_ARM)
		arm.drop_limb()
		qdel(arm)
	if (C.get_bodypart(BODY_ZONE_R_ARM))
		var/obj/item/bodypart/arm = C.get_bodypart(BODY_ZONE_R_ARM)
		arm.drop_limb()
		qdel(arm)
	ADD_TRAIT(C, TRAIT_MUTE, SPECIES_TRAIT)
	ADD_TRAIT(C, TRAIT_PACIFISM, SPECIES_TRAIT)
	break_gondoloath = new
	break_gondoloath.Grant(C)
	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		spec_updatehealth(H)

/datum/species/gondola/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()
	C.unignore_slowdown(type)
	if (break_gondoloath)
		break_gondoloath.Remove(C)
	REMOVE_TRAIT(C, TRAIT_MUTE, SPECIES_TRAIT)
	REMOVE_TRAIT(C, TRAIT_PACIFISM, SPECIES_TRAIT)

/datum/action/innate/break_gondoloath
	name = "Break Gondoloath"
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "pitchfork"
	icon_icon = 'icons/mob/actions/actions_minor_antag.dmi'
	background_icon_state = "bg_alien"

/datum/action/innate/break_gondoloath/IsAvailable()
	if(..())
		var/mob/living/carbon/human/H = owner
		var/datum/species/gondola/S = H.dna.species
		return !S.gondoloath_broken

/datum/action/innate/break_gondoloath/Activate()
	var/mob/living/carbon/human/H = owner
	var/datum/species/gondola/S = H.dna.species
	S.gondoloath_broken = TRUE
	to_chat(H, span_bolddanger("You have broken your Gondoloath!"))
	REMOVE_TRAIT(H, TRAIT_MUTE, SPECIES_TRAIT)
	REMOVE_TRAIT(H, TRAIT_PACIFISM, SPECIES_TRAIT)

/obj/item/organ/tongue/gondola_tongue
	name = "gondola tongue"
	desc = "A tongue that gives a clear speech impediment, for any gondola brave enough to break their gondoloath."

/obj/item/organ/tongue/gondola_tongue/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = " [message]"
		var/list/spurdo_words = strings("spurdo_replacement.json", "spurdo")
		for(var/key in spurdo_words)
			var/value = spurdo_words[key]
			if(islist(value))
				value = pick(value)
			message = replacetextEx(message,regex(uppertext(key),"g"), "[uppertext(value)]")
			message = replacetextEx(message,regex(capitalize(key),"g"), "[capitalize(value)]")
			message = replacetextEx(message,regex(key,"g"), "[value]")
	speech_args[SPEECH_MESSAGE] = trim(message)


/datum/disease/gondola
	name = "Gondola Transformation"
	cure_text = "Condensed Capsaicin, ingested or injected." //getting pepper sprayed doesn't help
	cures = list(/datum/reagent/consumable/condensedcapsaicin, /datum/reagent/consumable/capsaicin) //beats the hippie crap right out of your system
	cure_chance = 80
	stage_prob = 5
	max_stages = 5
	spread_text = "Acute"
	spread_flags = DISEASE_SPREAD_SPECIAL
	disease_flags = CURABLE
	agent = "Tranquility"
	desc = "Consuming the flesh of a Gondola forces one to pay the 'gondol price.'"
	severity = DISEASE_SEVERITY_BIOHAZARD
	visibility_flags = 0
	var/stage1	= list("You seem a little lighter in your step.")
	var/stage2	= list("You catch yourself smiling for no reason.")
	var/stage3	= list(span_danger("A cruel sense of calm overcomes you."), span_danger("You can't feel your arms!"), span_danger("You let go of the urge to hurt clowns."))
	var/stage4	= list(span_danger("You can't feel your arms. It does not bother you anymore."), span_danger("You forgive the clown for hurting you."))
	var/stage5	= list(span_danger("You have become a Gondola."))
	viable_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey, /mob/living/carbon/alien)

/datum/disease/gondola/infect(mob/living/infectee, make_copy)
	if(istype(affected_mob.dna.species, /datum/species/gondola))
		qdel(src)
	else
		. = ..()
	

/datum/disease/gondola/stage_act()
	..()
	switch(stage)
		if(1)
			if (prob(stage_prob) && stage1)
				to_chat(affected_mob, pick(stage1))
		if(2)
			if (prob(5))
				affected_mob.emote("smile")
			if (prob(20))
				affected_mob.reagents.add_reagent_list(list(/datum/reagent/pax = 5))
			if (prob(stage_prob) && stage2)
				to_chat(affected_mob, pick(stage2))
		if(3)
			if (prob(5))
				affected_mob.emote("smile")
			if (prob(20))
				affected_mob.reagents.add_reagent_list(list(/datum/reagent/pax = 5))
			if (prob(stage_prob*2) && stage3)
				to_chat(affected_mob, pick(stage3))
		if(4)
			if (prob(stage_prob*2) && stage4)
				to_chat(affected_mob, pick(stage4))
			if (prob(5))
				affected_mob.emote("smile")
			if (prob(20))
				affected_mob.reagents.add_reagent_list(list(/datum/reagent/pax = 5))
			if (prob(2))
				to_chat(affected_mob, span_danger("You let go of what you were holding."))
				var/obj/item/I = affected_mob.get_active_held_item()
				affected_mob.dropItemToGround(I)
			
		if(5)
			affected_mob.set_species(new /datum/species/gondola)

