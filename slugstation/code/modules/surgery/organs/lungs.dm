/obj/item/organ/lungs/xenolid
	name = "devolved plasma vessel"
	desc = "A lung-shaped organ vaguely similar to a plasma vessel, restructured from a storage system to a respiratory one."
	icon_state = "lungs-x"

	safe_toxins_max = 0
	oxygen_substitutes = list(/datum/gas/pluoxium = 8, /datum/gas/plasma = 1, /datum/gas/nitrogen = 1)
	heat_level_1_threshold = 313
	heat_level_2_threshold = 353
	heat_level_3_threshold = 600
