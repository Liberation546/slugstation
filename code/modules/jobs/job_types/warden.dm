/datum/job/warden
	title = "Warden"
	flag = WARDEN
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	minimal_player_age = 7
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY

	outfit = /datum/outfit/job/warden

	alt_titles = list("Brig Watchman", "Brig Superintendent", "Security Staff Sergeant", "Security Dispatcher", "Prison Supervisor")

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_MECH_SECURITY, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_FORENSICS_LOCKERS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_MECH_SECURITY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM) // See /datum/job/warden/get_access()
	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_SEC
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_WARDEN

	changed_maps = list("YogsPubby", "OmegaStation")

/datum/job/warden/proc/YogsPubbyChanges()
	access += ACCESS_CREMATORIUM
	minimal_access += ACCESS_CREMATORIUM

/datum/job/warden/proc/OmegaStationChanges()
	return TRUE

/datum/job/warden/get_access()
	var/list/L = list()
	L = ..() | check_config_for_sec_maint()
	return L

/datum/outfit/job/warden
	name = "Warden"
	jobtype = /datum/job/warden

	pda_type = /obj/item/pda/warden

	ears = /obj/item/radio/headset/headset_sec/alt
	uniform = /obj/item/clothing/under/rank/warden
