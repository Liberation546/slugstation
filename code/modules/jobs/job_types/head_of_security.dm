/datum/job/hos
	title = "Head of Security"
	flag = HOS
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY|DEADMIN_POSITION_CRITICAL
	department_head = list("Captain")
	department_flag = ENGSEC
	head_announce = list(RADIO_CHANNEL_SECURITY)
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 600
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY
	alt_titles = list("Security Commander", "Security Chief")

	outfit = /datum/outfit/job/hos
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY,
			            ACCESS_FORENSICS_LOCKERS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_ATMOSPHERICS, // yogs - HoS needs same access as engineering armband
			            ACCESS_RESEARCH, ACCESS_ENGINE, ACCESS_MINING, ACCESS_MEDICAL, ACCESS_CONSTRUCTION, ACCESS_MAILSORTING,
			            ACCESS_HEADS, ACCESS_HOS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM, ACCESS_BRIG_PHYS) //Yogs: Gives HoS access to the brig physicians locker
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_ARMORY, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY,
			            ACCESS_FORENSICS_LOCKERS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_ALL_PERSONAL_LOCKERS, ACCESS_ATMOSPHERICS, // yogs - HoS needs same access as engineering armband
			            ACCESS_RESEARCH, ACCESS_ENGINE, ACCESS_MINING, ACCESS_MEDICAL, ACCESS_CONSTRUCTION, ACCESS_MAILSORTING,
			            ACCESS_HEADS, ACCESS_HOS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM, ACCESS_BRIG_PHYS) //Yogs: Gives HoS access to the brig physicians locker
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	display_order = JOB_DISPLAY_ORDER_HEAD_OF_SECURITY

	changed_maps = list("YogsPubby")

/datum/job/hos/proc/YogsPubbyChanges()
	access += ACCESS_CREMATORIUM
	minimal_access += ACCESS_CREMATORIUM

/datum/outfit/job/hos
	name = "Head of Security"
	jobtype = /datum/job/hos

	id_type = /obj/item/card/id/silver
	pda_type = /obj/item/pda/heads/hos

	ears = /obj/item/radio/headset/heads/hos/alt
