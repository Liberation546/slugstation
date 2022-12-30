/obj/item/clothing/head/fedora/dense
	name = "grey fedora"
	var/densing = FALSE
	var/has_killed = FALSE

/obj/item/clothing/head/fedora/dense/mob_can_equip(mob/living/carbon/M, mob/living/equipper, slot)
	if(src in M.contents)
		if(slot == SLOT_HEAD)
			if(M.head)
				return FALSE
			if(!(src.slot_flags & ITEM_SLOT_HEAD))
				return FALSE
			if(!M.get_bodypart(BODY_ZONE_HEAD))
				return FALSE
			if(densing == FALSE)
				densing = TRUE
				var/client/C = M.client
				ADD_TRAIT(src, TRAIT_NODROP, "dense hat")
				M.Stun(30 SECONDS, ignore_canstun = TRUE)
				to_chat(M, span_userdanger("[M.p_they(TRUE)] want[M.p_s()] to put on the hat. Yes, that's perfectly fine. It's a totally innocent want, there is nothing wrong with it!"))
				sleep(5 SECONDS)
				M.equip_to_slot(src, slot, TRUE)
				M.update_inv_hands()
				to_chat(M, span_userdanger("\nBut, the moment [M.p_they()] position[M.p_s()] the hat over [M.p_their()] little head, & [M.p_their()] hands leave it, it suddenly becomes an incredibly rigid & dense object, slamming to the ground with astounding force."))
				sleep(10 SECONDS)
				to_chat(M, span_userdanger("\n[M.p_their(TRUE)] poor body is completely destroyed by the kinetic force of the hat."))
				var/i = 5
				while(i)
					new /obj/effect/gibspawner/generic(M.drop_location(), M)
					i--
				for(var/obj/item/I in M)
					M.dropItemToGround(I)
				REMOVE_TRAIT(src, TRAIT_NODROP, "dense hat")
				M.say("*scream", forced = TRUE)
				M.gib()
				sleep(5 SECONDS)
				to_chat(C, span_userdanger("Why did it happen? It wasn't fair."))
				densing = FALSE
				if(!has_killed)
					name = "really dense hat"
					desc = "Why did it happen? It wasn't fair."
					density = TRUE
					layer = ABOVE_OBJ_LAYER
			else return FALSE
		else ..()
	else
		if(equipper != M)
			to_chat(equipper, span_warning("Nice try."))
			return FALSE
