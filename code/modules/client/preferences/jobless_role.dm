/datum/preference/choiced/jobless_role
	savefile_key = "joblessrole"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/jobless_role/create_default_value()
	return BEOVERFLOW

/datum/preference/choiced/jobless_role/init_possible_values()
	return list(BEOVERFLOW, BERANDOMJOB, RETURNTOLOBBY)

/datum/preference/choiced/jobless_role/should_show_on_page(preference_tab)
	return preference_tab == PREFERENCE_TAB_CHARACTER_PREFERENCES

/datum/preference/choiced/jobless_role/apply_to_human(mob/living/carbon/human/target, value)
	return
