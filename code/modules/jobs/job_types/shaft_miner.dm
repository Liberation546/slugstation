/datum/job/mining
	title = "Shaft Miner"
	flag = MINER
	department_head = list("Head of Personnel")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the quartermaster and the head of personnel"
	selection_color = "#dcba97"
	alt_titles = list("Lavaland Scout", "Prospector", "Junior Miner", "Major Miner")

	outfit = /datum/outfit/job/miner

	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_SHAFT_MINER

	changed_maps = list("EclipseStation", "OmegaStation")

/datum/job/mining/proc/OmegaStationChanges()
	total_positions = 2
	spawn_positions = 2
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	supervisors = "the head of personnel"


/datum/job/mining/proc/EclipseStationChanges()
	total_positions = 6
	spawn_positions = 4

/datum/outfit/job/miner
	name = "Shaft Miner"
	jobtype = /datum/job/mining

	pda_type = /obj/item/pda/shaftminer

	ears = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
