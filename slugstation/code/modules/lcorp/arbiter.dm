/obj/item/clothing/neck/cloak/arbiter
	name = "arbiter's cloak"
	desc = "A fancy cloak worn by the Arbiters of the Head."
	icon = 'slugstation/icons/obj/clothing/arbiter.dmi'
	mob_overlay_icon = 'slugstation/icons/mob/clothing/arbiter.dmi'
	icon_state = "cloak"
	item_state = "cloak"

/obj/item/clothing/suit/armor/arbiter
	name = "arbiter's armored coat"
	desc = "A coat made out of quality cloth, providing immense protection against most damage sources. It is quite heavy."
	icon = 'slugstation/icons/obj/clothing/arbiter.dmi'
	mob_overlay_icon = 'slugstation/icons/mob/clothing/arbiter.dmi'
	icon_state = "coat"
	item_state = "coat"
	armor = list(MELEE = 90, BULLET = 90, LASER = 90, ENERGY = 90, BOMB = 80, BIO = 70, RAD = 10, FIRE = 70, ACID = 90)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = FIRE_PROOF | ACID_PROOF
	allowed = list(/obj/item/gun, /obj/item/ego_weapon, /obj/item/melee)

/obj/item/clothing/suit/armor/arbiter/cosmetic
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 0)

/obj/item/clothing/under/suit/lobotomy/arbiter
	name = "arbiter's uniform"
	desc = "A dark uniform worn by the Arbiters of the Head."
	icon = 'slugstation/icons/obj/clothing/arbiter.dmi'
	mob_overlay_icon = 'slugstation/icons/mob/clothing/arbiter.dmi'
	icon_state = "uniform"
	item_state = "uniform"
