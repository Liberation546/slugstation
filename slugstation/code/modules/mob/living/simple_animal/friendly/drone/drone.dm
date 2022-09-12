/mob/living/simple_animal/drone/common
	initial_language_holder = /datum/language_holder/drone/common

/datum/language_holder/drone/common
	understood_languages = list(/datum/language/drone = list(LANGUAGE_ATOM),
								/datum/language/machine = list(LANGUAGE_ATOM),
								/datum/language/common = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/drone = list(LANGUAGE_ATOM),
							/datum/language/common = list(LANGUAGE_ATOM))
