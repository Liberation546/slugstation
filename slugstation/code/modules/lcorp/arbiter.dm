/datum/antagonist/wizard/arbiter
	name = "Arbiter"
	roundend_category = "arbiters"
	give_objectives = FALSE
	move_to_lair = FALSE
	outfit_type = /datum/outfit/arbiter

	var/list/spell_types = list(
		/obj/effect/proc_holder/spell/aimed/fairy,
		/obj/effect/proc_holder/spell/aimed/pillar,
		/obj/effect/proc_holder/spell/aoe_turf/repulse/arbiter,
		/obj/effect/proc_holder/spell/aoe_turf/knock/arbiter
		)

/datum/antagonist/wizard/arbiter/greet()
	to_chat(owner, "<span class='boldannounce'>You are the Arbiter!</span>")

/datum/antagonist/wizard/arbiter/apply_innate_effects(mob/living/mob_override)
	var/mob/living/carbon/human/M = mob_override || owner.current
	add_antag_hud(antag_hud_type, antag_hud_name, M)
	M.faction |= "Head"
	M.faction |= "hostile"
	M.faction -= "neutral"
	ADD_TRAIT(M, TRAIT_BOMBIMMUNE, "Arbiter") // We truly are the elite agent of the Head
	ADD_TRAIT(M, TRAIT_STUNIMMUNE, "Arbiter")
	ADD_TRAIT(M, TRAIT_SLEEPIMMUNE, "Arbiter")
	ADD_TRAIT(M, TRAIT_PUSHIMMUNE, "Arbiter")
	ADD_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, "Arbiter")
	ADD_TRAIT(M, TRAIT_NOFIRE, "Arbiter")
	ADD_TRAIT(M, TRAIT_NODISMEMBER, "Arbiter")
	ADD_TRAIT(M, TRAIT_SANITYIMMUNE, "Arbiter")
	for(var/spell_type in spell_types)
		var/obj/effect/proc_holder/spell/S = new spell_type
		M.mind?.AddSpell(S)

/datum/antagonist/wizard/arbiter/remove_innate_effects(mob/living/mob_override)
	var/mob/living/carbon/human/M = mob_override || owner.current
	remove_antag_hud(antag_hud_type, M)
	M.faction -= "Head"
	M.faction -= "hostile"
	M.faction += "neutral"
	REMOVE_TRAIT(M, TRAIT_BOMBIMMUNE, "Arbiter") // We truly are the elite agent of the Head
	REMOVE_TRAIT(M, TRAIT_STUNIMMUNE, "Arbiter")
	REMOVE_TRAIT(M, TRAIT_SLEEPIMMUNE, "Arbiter")
	REMOVE_TRAIT(M, TRAIT_PUSHIMMUNE, "Arbiter")
	REMOVE_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, "Arbiter")
	REMOVE_TRAIT(M, TRAIT_NOFIRE, "Arbiter")
	REMOVE_TRAIT(M, TRAIT_NODISMEMBER, "Arbiter")
	REMOVE_TRAIT(M, TRAIT_SANITYIMMUNE, "Arbiter")

/datum/outfit/arbiter
	name = "Arbiter"

	uniform = /obj/item/clothing/under/suit/lobotomy/extraction/arbiter
	suit = /obj/item/clothing/suit/armor/extraction/arbiter
	neck = /obj/item/clothing/neck/cloak/arbiter
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/headset_head/alt
	id = /obj/item/card/id

/datum/outfit/arbiter/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/card/id/W = H.wear_id
	W.assignment = "Arbiter"
	W.registered_name = H.real_name
	W.update_label()
	..()

/obj/effect/proc_holder/spell/aimed/fairy 
	name = "Fairy" 
	desc = "Fire a line of damaging essence using power of the Fairy singularity."
	school = SCHOOL_EVOCATION
	charge_max = 100
	clothes_req = FALSE
	projectile_amount = 5
	invocation_type = "none"
	base_icon_state = "lightning"
	action_icon_state = "lightning0"
	sound = 'sound/magic/arbiter/fairy.ogg'
	active_msg = "You activate the power of Fairy singularity!"
	deactive_msg = "You let the energy flow out of your hands back into its storage space..."
	projectile_type = /obj/item/projectile/beam/fairy

/obj/item/projectile/beam/fairy
	name = "fairy"
	icon_state = "fairy"
	damage = 50
	damage_type = BLACK_DAMAGE
	flag = BLACK_DAMAGE
	projectile_piercing = PASSMOB
	projectile_phasing = (ALL & (~PASSMOB) & (~PASSCLOSEDTURF))

	light_color = LIGHT_COLOR_YELLOW
	beam_type = list("fairy", 'icons/effects/beam.dmi')
	hitscan = TRUE
	hitscan_light_intensity = 2
	hitscan_light_range = 1
	hitscan_light_color_override = LIGHT_COLOR_YELLOW
	muzzle_flash_intensity = 3
	muzzle_flash_range = 2
	muzzle_flash_color_override = LIGHT_COLOR_YELLOW
	impact_light_intensity = 4
	impact_light_range = 3
	impact_light_color_override = LIGHT_COLOR_YELLOW

/obj/effect/proc_holder/spell/aimed/pillar
	name = "Pillar"
	desc = "Fire a heavy pillar that will initiate meltdown process for each console it hits and throw enemies around."
	school = SCHOOL_EVOCATION
	charge_max = 300
	clothes_req = FALSE
	invocation_type = "none"
	base_icon_state = "immrod"
	action_icon_state = "immrod"
	sound = 'sound/magic/arbiter/pillar_start.ogg'
	active_msg = "You prepare the pillar."
	deactive_msg = "You remove the pillar from this plane, for now..."
	projectile_type = /obj/projectile/magic/aoe/pillar
	var/fire_delay = 1 SECONDS

/obj/effect/proc_holder/spell/aimed/pillar/fire_projectile(mob/living/user, atom/target)
	current_amount--
	var/list/fired_projs = list()
	for(var/i in 1 to projectiles_per_fire)
		var/obj/projectile/P = new projectile_type(get_turf(user))
		P.firer = user
		P.preparePixelProjectile(target, user)
		for(var/V in projectile_var_overrides)
			if(P.vars[V])
				P.vv_edit_var(V, projectile_var_overrides[V])
		ready_projectile(P, target, user, i)
		addtimer(CALLBACK (P, .obj/projectile/proc/fire), fire_delay)
		fired_projs += P
	return fired_projs

/obj/projectile/magic/aoe/pillar
	name = "pillar"
	icon = 'ModularTegustation/Teguicons/64x64.dmi'
	icon_state = "pillar"
	alpha = 0
	pixel_x = -16
	base_pixel_x = -16
	pixel_y = -16
	base_pixel_y = -16

	damage = 350
	damage_type = BRUTE
	flag = BRUTE
	armour_penetration = 0
	speed = 1.3 // Slow
	nodamage = FALSE
	projectile_piercing = PASSMOB
	projectile_phasing = (ALL & (~PASSMOB))
	hitsound = 'sound/magic/arbiter/pillar_hit.ogg'
	var/list/been_hit = list()

/obj/projectile/magic/aoe/pillar/Initialize()
	. = ..()
	animate(src, alpha = 255, time = 5)

/obj/projectile/magic/aoe/pillar/Moved(atom/OldLoc, Dir)
	..()
	for(var/turf/T in range(1, get_turf(src)))
		new /obj/effect/temp_visual/revenant(T)

/obj/effect/proc_holder/spell/aoe_turf/repulse/arbiter
	sound = 'sound/magic/arbiter/repulse.ogg'
	charge_max = 150
	clothes_req = FALSE
	antimagic_allowed = TRUE
	anti_magic_check = FALSE
	range = 5
	invocation_type = "none"
	sparkle_path = /obj/effect/temp_visual/sparks
	var/repulse_damage = 50

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

/obj/item/clothing/neck/cloak/arbiter
	name = "arbiter's cloak"
	desc = "A fancy cloak worn by the Arbiters of the Head."
	icon_state = "arbitercloak"
	icon = 'slugstation/icons/obj/clothing/arbiter.dmi'

/obj/item/clothing/suit/armor/extraction/arbiter
	name = "arbiter's armored coat"
	desc = "A coat made out of quality cloth, providing immense protection against most damage sources. It is quite heavy."
	armor = list(MELEE = 90, BULLET = 90, LASER = 90, ENERGY = 90, BOMB = 80, BIO = 70, RAD = 10, FIRE = 70, ACID = 90)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = FIRE_PROOF | ACID_PROOF
	allowed = list(/obj/item/gun, /obj/item/ego_weapon, /obj/item/melee)
	icon = 'slugstation/icons/obj/clothing/arbiter.dmi'
	icon_state = "extraction_coat"

/obj/item/clothing/under/suit/lobotomy/extraction/arbiter
	name = "arbiter's uniform"
	desc = "A dark uniform worn by the Arbiters of the Head."
	icon = 'slugstation/icons/obj/clothing/arbiter.dmi'
	icon_state "extraction_suit"
