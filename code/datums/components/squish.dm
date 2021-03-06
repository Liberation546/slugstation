#define SHORT 5/7
#define TALL 7/5

/datum/component/squish

/datum/component/squish/AddComponent(datum/target, duration)
	. = ..()
	if(!iscarbon(target))
		return ELEMENT_INCOMPATIBLE

	var/mob/living/carbon/C = target
	var/was_lying = (C.lying != 0)
	addtimer(CALLBACK(src, .proc/RemoveComponent, C, was_lying), duration)

	C.transform = C.transform.Scale(TALL, SHORT)

/datum/component/squish/RemoveComponent(mob/living/carbon/C, was_lying)
	. = ..()
	if(istype(C))
		var/is_lying = (C.lying != 0)
		if(was_lying == is_lying)
			C.transform = C.transform.Scale(SHORT, TALL)
		else
			C.transform = C.transform.Scale(TALL, SHORT)

#undef SHORT
#undef TALL
