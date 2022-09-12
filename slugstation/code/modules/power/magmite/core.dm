// this whole thing is a shameless port of draconic evolution's draconic reactor

/obj/machinery/magmite_reactor
	name = "magmite reactor core"
	desc = "The core of a magmite reactor."
	icon = 'slugstation/icons/obj/magmite/core.dmi'
	icon_state = "cool"
	resistance_flags = INDESTRUCTIBLE
	layer = MASSIVE_OBJ_LAYER
	density = TRUE
	var/fuel = 0 // how much fuel do we have
	var/saturation // how much energy saturation do we have
	var/strength // how strong is the shield
	var/temp // how hot are we

/obj/machinery/magmite_reactor/Initialize()
	. = ..()
	update_size()

/obj/machinery/magmite_reactor/proc/update_size()
	var/matrix/size = new()
	var/matrix/maxsize = new()
	size.Scale(0.25, 0.25)
	size.Translate(-32, -32)
	maxsize.Translate(-32, -32)
	size.Interpolate(maxsize, (fuel / 10368))
	transform = size

/obj/machinery/magmite_reactor/proc/update_state()
	CRASH("hey shithead you didnt do this yet")

/obj/machinery/magmite_reactor/proc/handle_reaction()
	CRASH("hey shithead you didnt do this yet")
	// TODO: make the reactor do the thing

/obj/machinery/magmite_reactor/proc/begin_meltdown()
	CRASH("hey shithead you didnt do this yet")
	// TODO: make the reactor do the thing

/obj/machinery/magmite_reactor/proc/explode()
	explosion(src, 16, 32, 64, silent = TRUE, ignorecap = TRUE)
	for(var/mob/MN in GLOB.player_list)
		if(MN.z == src.z)
			if(get_dist(get_turf(MN), get_turf(src)) <= 96)
				MN.playsound_local(get_turf(src), vol = 100, pressure_affected = FALSE, S = 'slugstation/sound/magmite/fusion_explosion.ogg')
			else
				MN.playsound_local(get_turf(src), vol = 100, pressure_affected = FALSE, S = 'slugstation/sound/magmite/boom.ogg')
	qdel(src)
