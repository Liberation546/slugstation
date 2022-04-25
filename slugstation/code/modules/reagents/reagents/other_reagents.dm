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

/datum/reagent/medicine/morbphine/on_mob_end_metabolize(mob/living/L)
	L.unignore_slowdown(type)
	REMOVE_TRAIT(L, TRAIT_SURGERY_PREPARED, type)
	..()

/datum/reagent/medicine/morbphine/on_mob_life(mob/living/carbon/M)
	if((M.mind && (M.mind.has_antag_datum(/datum/antagonist/vampire))))
		switch(current_cycle)
			if(11)
				to_chat(M, "<span class='warning'>You start to feel like it's MORBIN TIME!!</span>" )
			if(12 to INFINITY)
				M.AdjustStun(-20, FALSE)
				M.AdjustKnockdown(-20, FALSE)
				M.AdjustUnconscious(-20, FALSE)
				M.AdjustParalyzed(-20, FALSE)
				M.AdjustImmobilized(-20, FALSE)
				M.adjustStaminaLoss(-2, 0)
				M.emote("twitch", 1, "MORBS OUT!!")
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
	if((M.mind && (M.mind.has_antag_datum(/datum/antagonist/vampire))))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(2)
		M.Jitter(2)
	..()

/datum/reagent/medicine/morbphine/addiction_act_stage1(mob/living/M)
	if((M.mind && (M.mind.has_antag_datum(/datum/antagonist/vampire))))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
	if(prob(33))
		M.drop_all_held_items()
		M.Jitter(2)
	..()

/datum/reagent/medicine/morbphine/addiction_act_stage2(mob/living/M)
	if((M.mind && (M.mind.has_antag_datum(/datum/antagonist/vampire))))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(1*REM, 0)
		. = 1
		M.Dizzy(3)
		M.Jitter(3)
	..()

/datum/reagent/medicine/morbphine/addiction_act_stage3(mob/living/M)
	if((M.mind && (M.mind.has_antag_datum(/datum/antagonist/vampire))))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 4)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(2*REM, 0)
		. = 1
		M.Dizzy(4)
		M.Jitter(4)
	..()

/datum/reagent/medicine/morbphine/addiction_act_stage4(mob/living/M)
	if((M.mind && (M.mind.has_antag_datum(/datum/antagonist/vampire))))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 6)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(3*REM, 0)
		. = 1
		M.Dizzy(5)
		M.Jitter(5)
	..()


/datum/reagent/medicine/morbphine/overdose_process(mob/living/M)
	if((M.mind && (M.mind.has_antag_datum(/datum/antagonist/vampire))))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(2)
		M.Jitter(2)
	..()
