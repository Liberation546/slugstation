/datum/job/lawyer
	title = "Lawyer"
	flag = LAWYER
	department_head = list("Head of Personnel")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	var/lawyers = 0 //Counts lawyer amount
	alt_titles = list("Prosecutor", "Defense Attorney", "Paralegal", "Ace Attorney")

	outfit = /datum/outfit/job/lawyer

	access = list(ACCESS_LAWYER, ACCESS_COURT, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_LAWYER, ACCESS_COURT, ACCESS_SEC_DOORS)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_CIV
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_LAWYER

	changed_maps = list("OmegaStation")

/datum/job/lawyer/proc/OmegaStationChanges()
	return TRUE

/datum/outfit/job/lawyer
	name = "Lawyer"
	jobtype = /datum/job/lawyer

	pda_type = /obj/item/pda/lawyer

	ears = /obj/item/radio/headset/headset_srvsec
	uniform = /obj/item/clothing/under/lawyer/bluesuit
