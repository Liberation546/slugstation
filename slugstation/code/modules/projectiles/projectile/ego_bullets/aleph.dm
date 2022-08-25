/obj/item/projectile/ego_bullet/melting_blob
	name = "slime projectile"
	icon_state = "slime"
	desc = "A glob of infectious slime. It's going for your heart."
	damage = 88
	damage_type = BRUTE
	flag = BRUTE
	hitsound = "sound/effects/footstep/slime1.ogg"

/obj/item/projectile/ego_bullet/melting_blob/on_hit(target)
	var/mob/living/H = target
	if(!isbot(H) && isliving(H))
		H.visible_message("<span class='warning'>[target] is hit by [src], [H.p_they()] seem[H.p_s()] to wither away!</span>")
		for(var/i = 1 to 10)
			addtimer(CALLBACK(H, /mob/living/proc/apply_damage, rand(4,6), TOX, null, 0), 2 SECONDS * i)
		return BULLET_ACT_HIT
	else
		H.visible_message("<span class='warning'>[target] is hit by [src]!")
	. = ..()
