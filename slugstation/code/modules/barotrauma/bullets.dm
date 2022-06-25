/obj/item/ammo_casing/c38/depleted
	name = "depleted fuel .38 bullet casing"
	desc = "A .38 bullet casing, fashioned out of depleted fuel. Along with increased penetration, the round has been special-made to also inflict radiation sickness on the target."
	caliber = "38"
	color = "#6e786e"
	projectile_type = /obj/item/projectile/bullet/c38/depleted

/obj/item/ammo_box/c38/depleted
	name = "speed loader (.38 Depleted)"
	desc = "Designed to quickly reload revolvers. Depleted bullets inflict radiation sickness on the target."
	ammo_type = /obj/item/ammo_casing/c38/depleted

/obj/item/projectile/bullet/c38/depleted
	damage = 20
	stamina = 40

/obj/item/projectile/bullet/c38/depleted/on_hit(atom/target, blocked)
	. = ..()
	var/mob/living/carbon/C = target
	if(blocked != 100)
		radiation_pulse(C, 200, can_contaminate = FALSE)

/obj/item/ammo_casing/c45/baro
	name = ".45 bullet casing"
	desc = "A .45 caliber submachine gun casing."
	caliber = "baro45"
	projectile_type = /obj/item/projectile/bullet/c45/baro

/obj/item/projectile/bullet/c45/baro
	name = ".45 bullet"
	damage = 10
