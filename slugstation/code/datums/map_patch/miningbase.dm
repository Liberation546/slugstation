/datum/slugstation/map_patch/RandomRuins/LavaRuins/miningbase
	PatchMap(var/x, var/y, var/z)
		var/turf/T = locate(x + 12 - 1, y + 26 - 1, z)
		var/mob/M = locate(/mob/living/simple_animal/turtle) in T
		qdel(M)
		new /mob/living/simple_animal/pet/cat/Proc(T)
