/datum/reagent/medicine/morbphine
	name = "Morbphine"
	description = "It's Morbin' Time! Gives a speed boost to all vampires, but acts like normal morphine for others."
	reagent_state = LIQUID
	color = "#fba9a9"
	taste_description = "#MORBIUSSWEEP"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 30
	addiction_threshold = 25

/datum/reagent/medicine/morbphine/on_mob_metabolize(mob/living/L)
	..()
	L.ignore_slowdown(type)
	ADD_TRAIT(L, TRAIT_SURGERY_PREPARED, type)
	RegisterSignal(L, COMSIG_MOB_SAY, .proc/handle_speech)

/datum/reagent/medicine/morbphine/proc/handle_speech(datum/source, mob/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = " [message]"
		message = replacetextEx(message, " [uppertext("more")]", " [uppertext("morb")]")
		message = replacetextEx(message, " [capitalize("more")]", " [capitalize("morb")]")
		message = replacetextEx(message, " more", " morb")
		if (prob(10))
			message += " ITS MORBIN TIME!!"
	speech_args[SPEECH_MESSAGE] = trim(message)


/datum/reagent/medicine/morbphine/on_mob_end_metabolize(mob/living/L)
	L.unignore_slowdown(type)
	REMOVE_TRAIT(L, TRAIT_SURGERY_PREPARED, type)
	UnregisterSignal(L, COMSIG_MOB_SAY)
	..()

/datum/reagent/medicine/morbphine/on_mob_life(mob/living/carbon/M)
	if((M.mind && (M.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE))))
		switch(current_cycle)
			if(11)
				to_chat(M, "<span class='warning'>You start to feel like it's MORBIN TIME!!</span>" )
			if(12 to INFINITY)
				M.AdjustStun(-40, FALSE)
				M.AdjustKnockdown(-40, FALSE)
				M.AdjustUnconscious(-40, FALSE)
				M.AdjustParalyzed(-40, FALSE)
				M.AdjustImmobilized(-40, FALSE)
				M.adjustStaminaLoss(-2, 0)
				if (prob(33))
					M.emote("morb", 1)
					var/datum/antagonist/vampire/V = M.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE)
					V.usable_blood = min(V.usable_blood + 1, V.total_blood)	
	else
		switch(current_cycle)
			if(11)
				to_chat(M, "<span class='warning'>You start to feel tired...</span>" )
			if(12 to 24)
				M.drowsyness += 1
			if(24 to INFINITY)
				M.Sleeping(40, 0)
				. = 1
	..()
/datum/reagent/medicine/morbphine/overdose_process(mob/living/carbon/M)
	if((M.mind && (M.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE))))
		if (prob(50))
			var/datum/antagonist/vampire/V = M.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE)
			V.usable_blood = min(V.usable_blood + 1, V.total_blood)	
		..()
		return
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(2)
		M.Jitter(2)
	..()



/datum/reagent/medicine/morbphine/overdose_process(mob/living/M)
	if((M.mind && (M.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE))))
		if (prob(25))
			var/datum/antagonist/vampire/V = M.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE)
			V.usable_blood = min(V.usable_blood + 2, V.total_blood)	
		if (prob(50))
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
		..()
		return
	if((M.mind && (M.mind.has_antag_datum(/datum/antagonist/vampire))))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(50))
		M.drop_all_held_items()
		M.Dizzy(2)
		M.Jitter(2)
	..()

/datum/reagent/medicine/morbphine/addiction_act_stage1(mob/living/M)
	if((M.mind && (M.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE))))
		if (prob(50))
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
		..()
		return
	if(prob(33))
		M.drop_all_held_items()
		M.Jitter(2)
	..()

/datum/reagent/medicine/morbphine/addiction_act_stage2(mob/living/M)
	if((M.mind && (M.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE))))
		if (prob(75))
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
		..()
		return
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(1*REM, 0)
		. = 1
		M.Dizzy(3)
		M.Jitter(3)
	..()

/datum/reagent/medicine/morbphine/addiction_act_stage3(mob/living/M)
	if((M.mind && (M.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE))))
		if (prob(100))
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
		..()
		return
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(2*REM, 0)
		. = 1
		M.Dizzy(4)
		M.Jitter(4)
	..()

/datum/reagent/medicine/morbphine/addiction_act_stage4(mob/living/M)
	if((M.mind && (M.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE))))
		if (prob(50))
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
		if(prob(9) && iscarbon(M))
			M.visible_message(span_danger("[M] starts morbing for morb morbphine!"), span_userdanger("You start morbing for morb morbphine!"))
			M.Unconscious(100)
			M.Jitter(350)
		..()
		return
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(3*REM, 0)
		. = 1
		M.Dizzy(5)
		M.Jitter(5)
	..()

/datum/emote/living/morb
	key = "morb"
	key_third_person = "morbs"
	message = "morbs the fuck out!!!"

/datum/emote/living/morb/run_emote(mob/user, params, type_override = null, intentional = FALSE)
	if(user.mind.has_antag_datum(ANTAG_DATUM_VAMPIRE))
		..()
	else if(intentional)
		return FALSE
	..()

	
/datum/reagent/gondola_powder
	name = "Gondola Powder"
	description = "Just add water!"
	color = "#9C5A19"
	taste_description = "gondoland"
	can_synth = TRUE
