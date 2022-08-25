/mob/living/simple_animal/hostile/abnormality/melting_love
	name = "Melting Love"
	desc = "A pink slime creature, resembling a female humanoid."
	icon = 'slugstation/icons/mob/abnormality/melting_love.dmi'
	icon_state = "melting_love"
	icon_living = "melting_love"
	pixel_x = -16
	faction = list("slime")
	speak_emote = list("gurgle")
	attacktext = "glomps"
	gender = FEMALE
	/* Stats */
	health = 4000
	maxHealth = 4000
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	melee_damage_type = BRUTE
	melee_damage_lower = 0
	melee_damage_upper = 0
	projectiletype = /obj/item/projectile/melting_blob
	ranged = TRUE
	minimum_distance = 0
	ranged_cooldown_time = 5 SECONDS
	speed = 2
	move_to_delay = 4
	/* Sounds */
	projectilesound = 'sound/effects/attackblob.ogg'
	attack_sound = 'sound/effects/attackblob.ogg'
	deathsound = 'sound/effects/blobattack.ogg'
	attack_action_types = list(/datum/action/innate/abnormality_attack/melt_breach)
	/*Vars and others */
	loot = list(/obj/item/gun/ego_gun/adoration)
	del_on_death = FALSE
	var/is_breaching = FALSE
	var/spawned_big_slime = FALSE
	var/dead_big_slime = FALSE

/datum/action/innate/abnormality_attack/melt_breach
	name = "Toggle Breach Status"
	icon_icon = 'slugstation/icons/obj/lcorp_plushie.dmi'
	button_icon_state = "melt"

/datum/action/innate/abnormality_attack/melt_breach/Activate()
	if(istype(A, /mob/living/simple_animal/hostile/abnormality/melting_love))
		var/mob/living/simple_animal/hostile/abnormality/melting_love/M = A
		if(M.is_breaching)
			M.reverse_breach_effect()
		else
			M.breach_effect()
		to_chat(M, span_hierophant("You are no[M.is_breaching ? "w" : " longer"] breaching."))
	else
		to_chat(owner, span_warning("You are not Melting Love!"))

/mob/living/simple_animal/hostile/abnormality/melting_love/proc/breach_effect()
	icon = 'slugstation/icons/mob/abnormality/melting_breach.dmi'
	icon_living = "melting_breach"
	icon_state = icon_living
	icon_dead = "melting_breach_dead"
	gender = PLURAL
	pixel_x = -32
	desc = "A pink hunched creature with long arms, there are also visible bones coming from insides of the slime."
	obj_damage = 600
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	if(dead_big_slime)
		melee_damage_lower = 40
		melee_damage_upper = 64
	else
		melee_damage_lower = 30
		melee_damage_upper = 50
	ranged = TRUE
	is_breaching = TRUE
	return

/mob/living/simple_animal/hostile/abnormality/melting_love/proc/reverse_breach_effect()
	icon = initial(icon)
	icon_living = initial(icon_living)
	icon_state = initial(icon_state)
	icon_dead = initial(icon_dead)
	gender = initial(gender)
	pixel_x = initial(pixel_x)
	desc = initial(desc)
	obj_damage = initial(obj_damage)
	environment_smash = initial(environment_smash)
	melee_damage_lower = initial(melee_damage_lower)
	melee_damage_upper = initial(melee_damage_upper)
	ranged = FALSE
	is_breaching = FALSE
	return

/mob/living/simple_animal/hostile/abnormality/melting_love/death(gibbed)
	if(!is_breaching)
		icon = 'slugstation/icons/mob/abnormality/melting_breach.dmi'
		icon_living = "melting_breach_dead"
		pixel_x = -32
	density = FALSE
	animate(src, alpha = 0, time = 10 SECONDS)
	QDEL_IN(src, 10 SECONDS)
	..()

/mob/living/simple_animal/hostile/abnormality/melting_love/adjustHealth(amount, updating_health, forced)
	. = ..()
	if(. > 0)
		if(!client)
			if(!is_breaching)
				breach_effect()

/mob/living/simple_animal/hostile/abnormality/melting_love/PickTarget(list/Targets) // We attack corpses first if there are any thanks mobs
	var/list/highest_priority = list()
	var/list/lower_priority = list()
	for(var/mob/living/L in Targets)
		if(!CanAttack(L))
			continue
		if(L.health < 0 || L.stat == DEAD)
			if(ishuman(L))
				highest_priority += L
			else
				lower_priority += L
		else if(L.health < L.maxHealth*0.5)
			lower_priority += L
	if(LAZYLEN(highest_priority))
		return pick(highest_priority)
	if(LAZYLEN(lower_priority))
		return pick(lower_priority)
	return ..()

/* Attacks */
/mob/living/simple_animal/hostile/abnormality/melting_love/CanAttack(atom/the_target)
	if(!is_breaching)
		return FALSE
	if(isliving(target) && !ishuman(target))
		var/mob/living/L = target
		if(L.stat == DEAD)
			return FALSE
	return ..()

/mob/living/simple_animal/hostile/abnormality/melting_love/OpenFire(atom/A)
	if(!spawned_big_slime)
		return 0
	. = ..()

/mob/living/simple_animal/hostile/abnormality/melting_love/MoveToTarget(list/possible_targets)
	if(!is_breaching)
		return FALSE
	if(ranged_cooldown <= world.time)
		OpenFire(target)
	return ..()

/mob/living/simple_animal/hostile/abnormality/melting_love/AttackingTarget()
	. = ..()
	if(!ishuman(target))
		return
	var/mob/living/carbon/human/H = target
	if(H.health <= HEALTH_THRESHOLD_DEAD && !HAS_TRAIT(H, TRAIT_NODEATH))
		if(spawned_big_slime == FALSE)
			SpawnBigSlime(H)
			return
		else
			slimeconv(H)
	return

/* Slime Conversion */
/mob/living/simple_animal/hostile/abnormality/melting_love/proc/slimeconv(mob/living/H)
	if(!H)
		return FALSE
	var/turf/T = get_turf(H)
	visible_message("<span class='danger'>[src] glomps on [H] as another slime pawn appears!</span>")
	var/mob/living/simple_animal/hostile/melt_slime/L = new /mob/living/simple_animal/hostile/melt_slime(T)
	L.stored_mob = H
	H.forceMove(L)
	return TRUE

/mob/living/simple_animal/hostile/abnormality/melting_love/proc/SpawnBigSlime(mob/living/victim)
	var/mob/living/simple_animal/hostile/melt_slime/big/S = new(get_turf(victim))
	RegisterSignal(S, COMSIG_MOB_DEATH, .proc/SlimeDeath)
	S.stored_mob = victim
	victim.forceMove(S)
	spawned_big_slime = TRUE

/* Checking if bigslime is dead or not and apply a damage buff if yes */
/mob/living/simple_animal/hostile/abnormality/melting_love/proc/SlimeDeath(datum/source, gibbed)
	if(is_breaching)
		melee_damage_lower = 40
		melee_damage_upper = 64
	dead_big_slime = TRUE
	projectiletype = /obj/item/projectile/melting_blob/enraged
	adjustBruteLoss(-maxHealth)
	for(var/mob/M in GLOB.player_list)
		if(M.z == z && M.client)
			to_chat(M, "<span class='userdanger'>You can hear a gooey cry!</span>")
			SEND_SOUND(M, 'sound/creatures/legion_death_far.ogg')
			flash_color(M, flash_color = "#FF0081", flash_time = 50)
	return TRUE

/obj/item/projectile/melting_blob
	name = "slime projectile"
	icon = 'slugstation/icons/obj/lcorp_projectile.dmi'
	icon_state = "slime"
	desc = "A glob of infectious slime. It's going for your heart."
	nodamage = TRUE
	spread = 10
	speed = 1.2
	hitsound = "sound/effects/footstep/slime1.ogg"
	var/maxdmg = null
	var/mindmg = null
	maxdmg = 90
	mindmg = 50

/obj/item/projectile/melting_blob/enraged
	desc = "A glob of infectious slime. It's going for your heart. It seems bigger..."
	maxdmg = 120
	mindmg = 60

/obj/item/projectile/melting_blob/on_hit(target)
	if(ismob(target))
		var/mob/living/H = target
		if("slime" in H.faction)
			H.visible_message("<span class='warning'>[src] vanishes on contact with [target]!</span>")
			qdel(src)
			return BULLET_ACT_BLOCK
		if(H.stat == DEAD && ishuman(H))
			var/turf/T = get_turf(H)
			visible_message("<span class='danger'>[src] submerges in \the [H] and another slime pawn appears!</span>")
			var/mob/living/simple_animal/hostile/melt_slime/L = new /mob/living/simple_animal/hostile/melt_slime(T)
			L.stored_mob = H
			H.forceMove(L)
			return BULLET_ACT_HIT
		H.visible_message("<span class='warning'>[H] is hit by [src], [H.p_they()] seem to wither away!</span>")
		H.apply_damage(rand(mindmg,maxdmg), BRUTE)
		if(!isbot(H) && isliving(H))
			for(var/i = 1 to 10)
				addtimer(CALLBACK(H, /mob/living/proc/apply_damage, rand(4,6), TOX), 2 SECONDS * i)
			return BULLET_ACT_HIT
	. = ..()

/* Slimes (HE) */
/mob/living/simple_animal/hostile/melt_slime
	name = "slime pawn"
	desc = "Some skeletal remains are floating in it..."
	icon = 'slugstation/icons/mob/abnormality/slime_pawn.dmi'
	icon_state = "little_slime"
	icon_living = "little_slime"
	faction = list("slime")
	speak_emote = list("gurgle")
	attacktext = "glomps"
	/* Stats */
	health = 400
	maxHealth = 400
	obj_damage = 200
	melee_damage_type = BRUTE
	melee_damage_lower = 12
	melee_damage_upper = 24
	rapid_melee = 2
	speed = 2
	move_to_delay = 3
	/* Sounds */
	deathsound = 'sound/effects/blobattack.ogg'
	attack_sound = 'sound/effects/attackblob.ogg'
	/* Vars and others */
	robust_searching = TRUE
	stat_attack = DEAD
	del_on_death = TRUE
	var/mob/living/stored_mob

/mob/living/simple_animal/hostile/melt_slime/Initialize()
	. = ..()
	playsound(get_turf(src), 'sound/effects/footstep/slime1.ogg', 50, 1)
	var/matrix/init_transform = transform
	transform *= 0.1
	alpha = 25
	animate(src, alpha = 255, transform = init_transform, time = 5)

/mob/living/simple_animal/hostile/melt_slime/Life()
	if(stored_mob)
		src.desc = "You recognize the remains of [stored_mob]..."
	..()

/mob/living/simple_animal/hostile/slime/PickTarget(list/Targets) // We attack corpses first if there are any thanks mobs
	var/list/highest_priority = list()
	var/list/lower_priority = list()
	for(var/mob/living/L in Targets)
		if(!CanAttack(L))
			continue
		if(L.health < 0 || L.stat == DEAD)
			if(ishuman(L))
				highest_priority += L
			else
				lower_priority += L
		else if(L.health < L.maxHealth*0.5)
			lower_priority += L
	if(LAZYLEN(highest_priority))
		return pick(highest_priority)
	if(LAZYLEN(lower_priority))
		return pick(lower_priority)
	return ..()

/mob/living/simple_animal/hostile/melt_slime/CanAttack(atom/the_target)
	if(isliving(target) && !ishuman(target))
		var/mob/living/L = target
		if(L.stat == DEAD)
			return FALSE
	return ..()

/mob/living/simple_animal/hostile/melt_slime/AttackingTarget()
	. = ..()
	if(!ishuman(target))
		return
	var/mob/living/carbon/human/H = target
	if(H.stat != DEAD)
		if(H.health <= HEALTH_THRESHOLD_DEAD && HAS_TRAIT(H, TRAIT_NODEATH))
			slimeconv(H)
	else
		slimeconv(H)

/* Slime Conversion */
/mob/living/simple_animal/hostile/melt_slime/proc/slimeconv(mob/living/H)
	if(!H)
		return FALSE
	var/turf/T = get_turf(H)
	visible_message("<span class='danger'>[src] glomps on [H] as another slime pawn appears!</span>")
	var/mob/living/simple_animal/hostile/melt_slime/L = new /mob/living/simple_animal/hostile/melt_slime(T)
	L.stored_mob = H
	H.forceMove(L)
	return TRUE

/mob/living/simple_animal/hostile/melt_slime/death(gibbed)
	visible_message(span_warning("The slime on [src] starts to disperse, and you see something underneath!"))
	var/turf/T = get_turf(src)
	if(T)
		if(stored_mob)
			stored_mob.forceMove(get_turf(src))
			stored_mob = null
		else
			new /obj/effect/mob_spawn/human/corpse/damaged/legioninfested(T)
	..(gibbed)

/* Big Slimes (WAW) */
/mob/living/simple_animal/hostile/melt_slime/big
	name = "Big Slime"
	desc = "Some skeletal remains are floating in it..."
	icon = 'slugstation/icons/mob/abnormality/big_slime.dmi'
	icon_state = "big_slime"
	icon_living = "big_slime"
	pixel_x = -8
	/* Stats */
	health = 2000
	maxHealth = 2000
	melee_damage_lower = 24
	melee_damage_upper = 40

/mob/living/simple_animal/hostile/melt_slime/big/Initialize()
	. = ..()
	playsound(get_turf(src), 'sound/effects/footstep/slime1.ogg', 50, 1)
	if(stored_mob)
		src.desc = "You recognize the remains of [stored_mob]..."
	var/matrix/init_transform = transform
	transform *= 0.1
	alpha = 25
	animate(src, alpha = 255, transform = init_transform, time = 5)
