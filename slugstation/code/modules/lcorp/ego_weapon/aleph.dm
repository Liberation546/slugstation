/obj/item/ego_weapon/paradise
	name = "paradise lost"
	desc = "\"Behold: you stood at the door and knocked, and it was opened to you. \
	I come from the end, and I am here to stay for but a moment.\""
	icon_state = "paradise"
	force = 13
	damtype = PALE_DAMAGE
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("purged", "purified")
	hitsound = 'slugstation/sound/lcorp/paradise.ogg'
	var/ranged_cooldown
	var/ranged_cooldown_time = 0.8 SECONDS
	var/ranged_damage = 15

/obj/item/ego_weapon/paradise/afterattack(atom/A, mob/living/user, proximity_flag, params)
	if(ranged_cooldown > world.time)
		return
	var/turf/target_turf = get_turf(A)
	if(!istype(target_turf))
		return
	if(get_dist(user, target_turf) < 2)
		return
	..()
	var/mob/living/carbon/human/H = user
	ranged_cooldown = world.time + ranged_cooldown_time
	playsound(target_turf, 'slugstation/sound/lcorp/paradise_ranged.ogg', 50, TRUE)
	var/damage_dealt = 0
	to_chat(user, "starting damage")
	for(var/turf/open/T in range(target_turf, 1))
		to_chat(user, "making effect")
		new /obj/effect/temp_visual/paradise_attack(T)
		for(var/mob/living/L in T.contents)
			to_chat(user, "applying damage")
			L.apply_damage(ranged_damage, PALE_DAMAGE, null, L.run_armor_check(null, PALE_DAMAGE))
			if((L.stat < DEAD) && !(L.status_flags & GODMODE))
				damage_dealt += ranged_damage
	if(damage_dealt > 0)
		H.adjustStaminaLoss(-damage_dealt*0.5)
		H.adjustBruteLoss(-damage_dealt*0.3)
		H.adjustFireLoss(-damage_dealt*0.3)

/obj/item/ego_weapon/paradise/EgoAttackInfo(mob/user)
	return "<span class='notice'>It deals [force] [damtype] damage in melee.\n\
	Use it on a distant target to perform special attack that can heal you.</span>"


/obj/effect/temp_visual/paradise_attack
	icon = 'slugstation/icons/lcorp_effects.dmi'
	icon_state = "paradise_attack"
	duration = 10

/obj/effect/temp_visual/paradise_attack/Initialize()
	..()
	animate(src, alpha = 0, time = duration)
