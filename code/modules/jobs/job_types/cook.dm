/datum/job/cook
	title = "Cook"
	flag = COOK
	department_head = list("Head of Personnel")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#bbe291"
	var/cooks = 0 //Counts cooks amount

	outfit = /datum/outfit/job/cook

	alt_titles = list("Chef", "Hash Slinger", "Sous-chef", "Culinary Artist")

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV

	display_order = JOB_DISPLAY_ORDER_COOK

	changed_maps = list("OmegaStation", "EclipseStation")

/datum/job/cook/proc/OmegaStationChanges()
	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE)
	minimal_access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE)

/datum/job/cook/proc/EclipseStationChanges()
	total_positions = 4
	spawn_positions = 3

/datum/outfit/job/cook
	name = "Cook"
	jobtype = /datum/job/cook

	pda_type = /obj/item/pda/cook

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/chef
