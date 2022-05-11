/obj/item/disk/holodisk/pearl
	name = "pearl"
	desc = "Shiny!"
	icon = 'slugstation/icons/obj/pearl.dm'
	icon_state = "pearl"
	preset_image_type = /datum/preset_holoimage/ai/core
	preset_record_text = ""

/obj/item/disk/holodisk/pearl/Initialize()
	..()
	if(preset_record_text == "")
		preset_record_text = pick(WHITE_PEARL_LORE)