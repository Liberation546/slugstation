/obj/item/ego_weapon
	name = "ego weapon"
	desc = "You aren't meant to see this."
	icon = 'slugstation/icons/obj/ego_weapons.dmi'
	lefthand_file = 'slugstation/icons/mob/inhands/weapons/ego_lefthand.dmi'
	righthand_file = 'slugstation/icons/mob/inhands/weapons/ego_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY			//No more stupid 10 egos in bag
	slot_flags = ITEM_SLOT_BELT

/obj/item/ego_weapon/examine(mob/user)
	. = ..()
	. += EgoAttackInfo(user)

/obj/item/ego_weapon/proc/EgoAttackInfo(mob/user)
	return
