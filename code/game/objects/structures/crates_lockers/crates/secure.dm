/obj/structure/closet/crate/secure
	desc = "A secure crate."
	name = "secure crate"
	icon_state = "securecrate"
	secure = TRUE
	locked = TRUE
	max_integrity = 500
	armor = list(MELEE = 30, BULLET = 50, LASER = 50, ENERGY = 100, BOMB = 0, BIO = 0, RAD = 0, FIRE = 80, ACID = 80)
	var/tamperproof = 0

/obj/structure/closet/crate/secure/run_obj_armor(damage_amount, damage_type, damage_flag = 0, attack_dir)
	if(damage_flag == MELEE && damage_amount < 25)
		return 0
	. = ..()

/obj/structure/closet/crate/secure/update_icon()
	..()
	if(broken)
		add_overlay("securecrateemag")
	else if(locked)
		add_overlay("securecrater")
	else
		add_overlay("securecrateg")

/obj/structure/closet/crate/secure/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1)
	if(prob(tamperproof) && damage_amount >= DAMAGE_PRECISION)
		boom()
	else
		return ..()


/obj/structure/closet/crate/secure/proc/boom(mob/user)
	if(user)
		to_chat(user, span_danger("The crate's anti-tamper system activates!"))
		log_bomber(user, "has detonated a", src)
	for(var/atom/movable/AM in src)
		qdel(AM)
	explosion(get_turf(src), 0, 1, 5, 5)
	qdel(src)

/obj/structure/closet/crate/secure/cheap

/obj/structure/closet/crate/secure/weapon
	desc = "A secure weapons crate."
	name = "weapons crate"
	icon_state = "weaponcrate"

/obj/structure/closet/crate/secure/plasma
	desc = "A secure plasma crate."
	name = "plasma crate"
	icon_state = "plasmacrate"

/obj/structure/closet/crate/secure/gear
	desc = "A secure gear crate."
	name = "gear crate"
	icon_state = "secgearcrate"

/obj/structure/closet/crate/secure/hydroponics
	desc = "A crate with a lock on it, painted in the scheme of the station's botanists."
	name = "secure hydroponics crate"
	icon_state = "hydrosecurecrate"

/obj/structure/closet/crate/secure/engineering
	desc = "A crate with a lock on it, painted in the scheme of the station's engineers."
	name = "secure engineering crate"
	icon_state = "engi_secure_crate"

/obj/structure/closet/crate/secure/science
	name = "secure science crate"
	desc = "A crate with a lock on it, painted in the scheme of the station's scientists."
	icon_state = "scisecurecrate"

/obj/structure/closet/crate/secure/medical
	name = "secure medical crate"
	desc = "A crate with a lock on it, painted in the scheme of the station's doctors."
	icon_state = "medsecurecrate"

/obj/structure/closet/crate/secure/owned
	name = "private crate"
	desc = "A crate cover designed to only open for who purchased its contents."
	icon_state = "privatecrate"
	var/datum/bank_account/buyer_account
	var/privacy_lock = TRUE

/obj/structure/closet/crate/secure/owned/examine(mob/user)
	. = ..()
	. += span_notice("It's locked with a privacy lock, and can only be unlocked by the buyer's ID.")

/obj/structure/closet/crate/secure/owned/Initialize(mapload, datum/bank_account/_buyer_account)
	. = ..()
	buyer_account = _buyer_account

/obj/structure/closet/crate/secure/owned/togglelock(mob/living/user, silent)
	if(secure && !broken)
		if(allowed(user))
			if(privacy_lock)
				var/obj/item/card/id/id_card = user.get_idcard(TRUE)
				if(!id_card || !id_card.registered_account || (id_card.registered_account != buyer_account))
					to_chat(user, span_notice("Bank account does not match with buyer!"))
					return
			if(iscarbon(user))
				add_fingerprint(user)
			locked = !locked
			user.visible_message(span_notice("[user] [locked ? null : "un"]locks [src]."),
							span_notice("You [locked ? null : "un"]lock [src]."))
			update_icon()
		else if(!silent)
			to_chat(user, span_notice("Access Denied"))
	else if(secure && broken)
		to_chat(user, span_warning("\The [src] is broken!"))
