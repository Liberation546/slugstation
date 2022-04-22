/datum/job/captain
	title = "Captain"
	flag = CAPTAIN
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY|DEADMIN_POSITION_CRITICAL
	department_head = list("CentCom")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "NanoTrasen officers and Space law" //Changed to officer to separate from CentCom officials being their superior.
	selection_color = "#ccccff"
	req_admin_notify = 1
	space_law_notify = 1 //Yogs
	minimal_player_age = 14
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_COMMAND
	alt_titles = list("Station Commander", "Facility Director")

	outfit = /datum/outfit/job/captain

	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	mind_traits = list(TRAIT_DISK_VERIFIER)

	display_order = JOB_DISPLAY_ORDER_CAPTAIN

/datum/job/captain/get_access()
	return get_all_accesses()

/datum/job/captain/announce(mob/living/carbon/human/H)
	..()
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, .proc/minor_announce, "Captain [H.real_name] on deck!"))

/datum/outfit/job/captain
	name = "Captain"
	jobtype = /datum/job/captain

	id_type = /obj/item/card/id/gold
	pda_type = /obj/item/pda/captain
	
	glasses = /obj/item/clothing/glasses/sunglasses
