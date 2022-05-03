/datum/species/xenolid
	name = "Xenolid"
	id = "xenolid"
	limbs_id = "human"
	default_color = "FFFFF0"
	fixed_mut_color = "444466"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,HAS_FLESH,HAS_BONE,MUTCOLORS)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	default_features = list("mcolor" = "FFF", "wings" = "None")
	coldmod = 0.80
	heatmod = 1.25
	disliked_food = GROSS
	liked_food = JUNKFOOD | FRIED | GRILLED | RAW
	mutanttongue = /obj/item/organ/tongue/polysmorph
	mutanttail = /obj/item/organ/tail/polysmorph
	mutantlungs = /obj/item/organ/lungs/xenolid
	use_skintones = TRUE
	skinned_type = /obj/item/stack/sheet/animalhide/human
	species_language_holder = /datum/language_holder/english
	payday_modifier = 0.5 //boil in hell

/datum/species/before_equip_job(datum/job/J, mob/living/carbon/human/H)
	if(prob(1)
		to_chat(H, span_info("<b>You are a <s>Slugcat</s> Xenolid.</b>"))
	else 
		to_chat(H, span_info("<b>You are a Xenolid.</b>"))
	to_chat(H, span_info("Most Xenolids are more likely to answer to their peers than anyone else. Special circumstances may change this."))
	to_chat(H, span_info("This means that you do not have to follow orders from the heads or other superiors, but you may face consequences in doing so."))
	to_chat(H, span_warning("This does not give you a license to be a complete asshole."))