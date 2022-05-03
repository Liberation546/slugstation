/datum/species/xenolid
	name = "Xenolid"
	id = "xenolid"
	limbs_id = "human"
	default_color = "FFFFF0"
	fixed_mut_color = "444466"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,HAS_FLESH,HAS_BONE,MUTCOLORS)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	default_features = list("mcolor" = "FFF", "wings" = "None")
	disliked_food = GROSS
	liked_food = JUNKFOOD | FRIED | GRILLED | RAW
	mutanttongue = /obj/item/organ/tongue/polysmorph
	mutanttail = /obj/item/organ/tail/polysmorph
	mutantlungs = /obj/item/organ/lungs/xenolid
	use_skintones = TRUE
	skinned_type = /obj/item/stack/sheet/animalhide/human
	species_language_holder = /datum/language_holder/english
	payday_modifier = 0.5 //boil in hell
