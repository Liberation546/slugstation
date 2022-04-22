/datum/job/mime
	title = "Mime"
	flag = MIME
	department_head = list("Head of Personnel")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/mime

	alt_titles = list("Mute Entertainer", "Silent Jokester", "Pantomimist")

	access = list(ACCESS_THEATRE)
	minimal_access = list(ACCESS_THEATRE)
	paycheck = PAYCHECK_MINIMAL
	paycheck_department = ACCOUNT_SRV

	display_order = JOB_DISPLAY_ORDER_MIME

/datum/job/mime/after_spawn(mob/living/carbon/human/H, mob/M)
	H.apply_pref_name("mime", M.client)

/datum/outfit/job/mime
	name = "Mime"
	jobtype = /datum/job/mime

	pda_type = /obj/item/pda/mime

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/mime
