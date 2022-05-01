/datum/chemical_reaction/morbphine
	name = "Morbphine"
	id = /datum/reagent/medicine/morbphine
	results = list(/datum/reagent/medicine/morbphine = 3)
	required_reagents = list(/datum/reagent/medicine/morphine = 1, /datum/reagent/blood = 1, /datum/reagent/ash = 1)

/datum/chemical_reaction/gondola
	name = "gondola"
	id = "gondola"
	required_reagents = list(/datum/reagent/gondola_powder = 30, /datum/reagent/pax = 30)
	
/datum/chemical_reaction/gondola/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	if (location) new /mob/living/simple_animal/pet/gondola(location)
