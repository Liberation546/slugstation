/obj/item/gun/ego_gun
	name = "ego gun"
	desc = "Some sort of weapon..?"
	icon = 'slugstation/icons/obj/ego_weapons.dmi'
	lefthand_file = 'slugstation/icons/mob/inhands/weapons/ego_lefthand.dmi'
	righthand_file = 'slugstation/icons/mob/inhands/weapons/ego_righthand.dmi'
	fire_sound = 'sound/weapons/emitter.ogg'
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL
	pin = /obj/item/firing_pin/magic
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_BULKY			//No more stupid 10 egos in bag
	var/obj/item/ammo_casing/ammo_type

/obj/item/gun/ego_gun/Initialize()
	. = ..()
	chambered = new ammo_type(src)

/obj/item/gun/ego_gun/examine(mob/user)
	. = ..()
	. += EgoAttackInfo(user)

/obj/item/gun/ego_gun/proc/EgoAttackInfo(mob/user)
	if(chambered && chambered.BB)
		return "<span class='notice'>Its bullets deal [chambered.BB.damage] [chambered.BB.damage_type] damage.</span>"
	return

/obj/item/gun/ego_gun/process_fire(atom/target, mob/living/user, message, params, zone_override, bonus_spread)
	return ..()

/obj/item/gun/ego_gun/can_shoot()
	return TRUE

/obj/item/gun/ego_gun/process_chamber()
	if(chambered && !chambered.BB)
		recharge_newshot()

/obj/item/gun/ego_gun/recharge_newshot()
	if(chambered)
		chambered.newshot()

/obj/item/gun/ego_gun/before_firing(atom/target,mob/user)
	if(QDELETED(chambered))
		chambered = new ammo_type(src)
	return

/obj/item/gun/ego_gun/shoot_with_empty_chamber(mob/living/user)
	before_firing(user = user)
	return ..()
