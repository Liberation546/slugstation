//oh boy here we go
//btw this is work in progress so ignore it
/datum/species/inkling
	name = "Inkling (WIP)"
	id = "inkling"
	default_color = "FFFFFF"
	limbs_id = "human"
	species_traits = list(EYECOLOR,HAIR,LIPS,HAS_FLESH)
	default_features = list("mcolor" = "FFF", "wings" = "None")
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	brutemod = 0.5 //no bones, feel free to balance this its probably busted
	coldmod = 2 //idk why they would be weak to cold but they have to have SOME weaknesses
	burnmod = 0.8 //they seem to be fine in extreme heats
	disliked_food = GROSS | MICE
	liked_food = JUNKFOOD | FRIED | GRILLED | RAW
	payday_modifier = 0.5 //like all species i code nt either hates them or doesnt care
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/inkling

//their language
/datum/language/inkling
	name = "Inkling"
	desc = "A language derived from garbles that inklings use to communicate"
	exclaim_verb = "screeches"
	key = "I"
	flags = TONGUELESS_SPEECH
	space_chance = 90
	syllables = list(
		"blb", "blergh", "blorble","bubbles","bloar","blgbl"
	)
	//icon_state = NULL //later
	default_priority = 90
	sing_verb = "bubbles"

/datum/language_holder/inkling
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
									/datum/language/inkling = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
							/datum/language/inkling = list(LANGUAGE_ATOM))


