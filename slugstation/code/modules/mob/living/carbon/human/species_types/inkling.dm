//this is a project im doing to get better at understanding byond code so ignore it
//-robin
/datum/species/inkling
	name = "Inkling (WIP)"
	id = "inkling"
	default_color = "FFFFFF"
	limbs_id = "human"
	species_traits = list(EYECOLOR,LIPS,HAS_FLESH)
	default_features = list("mcolor" = "FFF", "wings" = "None", "tentacles" = "Haircut")
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	brutemod = 0.5 //no bones, feel free to balance this its probably busted
	coldmod = 0.8 //according to the crackheads at inkipedia they can withstand cold
	burnmod = 2 //something-something dissolves in heat
	disliked_food = GROSS | MICE
	liked_food = JUNKFOOD | FRIED | GRILLED | RAW
	payday_modifier = 0.5 //like all species i code nt either hates them or doesnt care
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/inkling
	mutanttongue = /obj/item/organ/tongue/inkling
	mutant_bodyparts = list("tentacles")
	swimming_component = /datum/component/swimming/dissolve
	exotic_blood = /datum/reagent/ink //finally i can refill my printer
	species_gibs = "none"

//their language
/datum/language/inkling
	name = "Inkling"
	desc = "A language derived from garbles that inklings use to communicate"
	exclaim_verb = "screeches"
	key = "q"
	flags = TONGUELESS_SPEECH
	space_chance = 90
	syllables = list(
		"blb", "blergh", "blorble","bubleb","bloar","blgbl"
	)
	//icon_state = NULL //later
	default_priority = 90
	sing_verb = "bubbles"

/datum/language_holder/inkling
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
								/datum/language/inkling = list(LANGUAGE_ATOM),)
	spoken_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
							/datum/language/inkling = list(LANGUAGE_ATOM),)

//because im far too lazy to edit the dme a ton im just gonna put all the code for them in here
/obj/item/organ/tongue/inkling
	name = "inkling tongue"
	desc = "inky strip of flesh usually used for speaking"
	icon_state = "tongue"
	icon = 'slugstation/icons/obj/tongue.dmi'
	say_mod = "bubbles"
	taste_sensitivity = 10 //if you cant taste fish by eating metal i think theres something wrong with you
	modifies_speech = TRUE //Ill be honest no clue what this does
	var/static/list/languages_possible_alien = typecacheof(list(
		/datum/language/inkling,
		/datum/language/common,
		))\
