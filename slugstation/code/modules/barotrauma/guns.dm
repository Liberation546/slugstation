/obj/item/gun/ballistic/revolver/detective/baro
	name = "revolver"
	desc = ".38 caliber."
	fire_sound = 'slugstation/sound/barotrauma/revolver_1.ogg'
	icon = 'slugstation/icons/obj/barotrauma.dmi'
	icon_state = "revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev38

/obj/item/gun/ballistic/revolver/detective/baro/shoot_live_shot(mob/living/user, pointblank, atom/pbtarget, message)
	fire_sound = pick('slugstation/sound/barotrauma/revolver_1.ogg','slugstation/sound/barotrauma/revolver_2.ogg','slugstation/sound/barotrauma/revolver_3.ogg')
	..()

//TODO: baro smg
