/datum/antagonist/wizard/arbiter
	name = "Arbiter"
	roundend_category = "arbiters"
	give_objectives = FALSE
	move_to_lair = FALSE
	show_in_antagpanel = TRUE
	outfit_type = /datum/outfit/arbiter

	var/list/spell_types = list(
		/obj/effect/proc_holder/spell/aimed/fairy, 
		// /obj/effect/proc_holder/spell/aimed/pillar,
		/obj/effect/proc_holder/spell/aoe_turf/repulse/arbiter,
		/obj/effect/proc_holder/spell/aoe_turf/knock/arbiter 
		)
		//dont delete the other spell types we'll probably make them eventually

/datum/antagonist/wizard/arbiter/greet()
	to_chat(owner, "<span class='boldannounce'>You are the Arbiter!</span>")

/datum/outfit/arbiter
	name = "Arbiter"

	uniform = /obj/item/clothing/under/suit/lobotomy/arbiter
	suit = /obj/item/clothing/suit/armor/arbiter
	neck = /obj/item/clothing/neck/cloak/arbiter
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/arbiter
	id = /obj/item/card/id

/datum/outfit/arbiter/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.assignment = "Arbiter"
	W.registered_name = H.real_name
	W.update_label()
	..()
