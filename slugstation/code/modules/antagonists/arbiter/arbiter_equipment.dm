/obj/item/clothing/neck/cloak/arbiter
	name = "arbiter's cloak"
	desc = "A fancy cloak worn by the Arbiters of the Head."
	icon = 'slugstation/icons/obj/clothing/arbiter.dmi'
	mob_overlay_icon = 'slugstation/icons/mob/clothing/arbiter.dmi'
	icon_state = "cloak"
	item_state = "cloak"
	resistance_flags = FIRE_PROOF

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
	resistance_flags = FIRE_PROOF

/obj/item/radio/headset/arbiter	
	name = "A Corp Headset"
	desc = "A headset used by the arbiters of A corp"
	icon = 'slugstation/icons/obj/clothing/arbiter.dmi'
	mob_overlay_icon = 'slugstation/icons/mob/clothing/arbiter.dmi'
	icon_state = "head_headset_alt"
	item_state = "head_headset_alt"
	subspace_transmission = TRUE

// many tears were shed in the following lines
// abandon all hope ye who enter here

/obj/effect/proc_holder/spell/aimed/fairy
	name = "Fairy"
	desc = "Fire a line of damaging essence using power of the Fairy singularity."
	school = "evocation"
	charge_max = 100
	clothes_req = FALSE
	projectile_amount = 5
	invocation_type = "none"
	base_icon_state = "lightning"
	action_icon_state = "lightning0"
	sound = 'slugstation/sound/lcorp/arbiter/fairy.ogg'
	active_msg = "You activate the power of Fairy singularity!"
	deactive_msg = "You let the energy flow out of your hands back into its storage space..."
	projectile_type = /obj/item/projectile/beam/fairy

/obj/effect/projectile/fairy
	name = "fairy"
	icon = 'slugstation/icons/fairy.dmi'
	icon_state = "fairy"

/obj/item/projectile/beam/fairy
	name = "fairy"
	icon_state = "fairy"
	icon = 'slugstation/icons/fairy.dmi'
	damage = 20
	damage_type = BRUTE

	light_color = LIGHT_COLOR_YELLOW
	hitscan = TRUE
	tracer_type = /obj/effect/projectile/fairy
	impact_type = /obj/effect/projectile/fairy
	muzzle_type = /obj/effect/projectile/fairy
	//beam_segments = 'slugstation/icons/fairy.dmi'
	hitscan_light_intensity = 2
	hitscan_light_range = 1
	hitscan_light_color_override = LIGHT_COLOR_YELLOW
	muzzle_flash_intensity = 3
	muzzle_flash_range = 2
	muzzle_flash_color_override = LIGHT_COLOR_YELLOW

/obj/item/projectile/beam/fairy/fuckyou //dont fucking use this shit
	damage = 500

/obj/effect/proc_holder/spell/aoe_turf/repulse/arbiter
	sound = 'slugstation/sound/lcorp/arbiter/repulse.ogg'
	charge_max = 150
	clothes_req = FALSE
	antimagic_allowed = TRUE
	anti_magic_check = FALSE
	range = 5
	invocation_type = "none"
	sparkle_path = /obj/effect/temp_visual/sparks
	var/repulse_damage = 20

/obj/effect/proc_holder/spell/aoe_turf/repulse/arbiter/cast(list/targets, mob/user = usr)
	. = ..(targets, user, 20)
	var/list/thrown_atoms = .
	for(var/mob/living/L in thrown_atoms)
		if(user.faction_check_mob(L))
			continue
		L.apply_damage(repulse_damage, BRUTE)


/obj/effect/proc_holder/spell/aoe_turf/knock/arbiter
	invocation_type = "none"
	charge_max = 50
	sound = 'sound/magic/arbiter/knock.ogg'
	open_sound = null
