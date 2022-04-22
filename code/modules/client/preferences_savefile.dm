//This is the lowest supported version, anything below this is completely obsolete and the entire savefile will be wiped.
#define SAVEFILE_VERSION_MIN	18

//This is the current version, anything below this will attempt to update (if it's not obsolete)
//	You do not need to raise this if you are adding new values that have sane defaults.
//	Only raise this value when changing the meaning/format/name/layout of an existing value
//	where you would want the updater procs below to run
#define SAVEFILE_VERSION_MAX	35

/*
SAVEFILE UPDATING/VERSIONING - 'Simplified', or rather, more coder-friendly ~Carn
	This proc checks if the current directory of the savefile S needs updating
	It is to be used by the load_character and load_preferences procs.
	(S.cd=="/" is preferences, S.cd=="/character[integer]" is a character slot, etc)

	if the current directory's version is below SAVEFILE_VERSION_MIN it will simply wipe everything in that directory
	(if we're at root "/" then it'll just wipe the entire savefile, for instance.)

	if its version is below SAVEFILE_VERSION_MAX but above the minimum, it will load data but later call the
	respective update_preferences() or update_character() proc.
	Those procs allow coders to specify format changes so users do not lose their setups and have to redo them again.

	Failing all that, the standard sanity checks are performed. They simply check the data is suitable, reverting to
	initial() values if necessary.
*/
/datum/preferences/proc/savefile_needs_update(savefile/S)
	var/savefile_version
	READ_FILE(S["version"], savefile_version)

	if(savefile_version < SAVEFILE_VERSION_MIN)
		S.dir.Cut()
		return -2
	if(savefile_version < SAVEFILE_VERSION_MAX)
		return savefile_version
	return -1

//should these procs get fairly long
//just increase SAVEFILE_VERSION_MIN so it's not as far behind
//SAVEFILE_VERSION_MAX and then delete any obsolete if clauses
//from these procs.
//This only really meant to avoid annoying frequent players
//if your savefile is 3 months out of date, then 'tough shit'.

/datum/preferences/proc/update_preferences(current_version, savefile/S)
	// Fixes savefile corruption caused by https://github.com/yogstation13/Yogstation/pull/9767
	if(current_version < 25) // This is the only thing that makes V25 different.
		if(LAZYFIND(be_special,"Ragin"))
			be_special -= "Ragin"
			be_special += "Ragin Mages"
	if (current_version < 35)
		toggles |= SOUND_ALT
	return

/datum/preferences/proc/update_character(current_version, savefile/S)
	if(current_version < 19)
		pda_style = "mono"
	if(current_version < 20)
		pda_color = "#808000"
	if((current_version < 21) && features["ethcolor"] && (features["ethcolor"] == "#9c3030"))
		features["ethcolor"] = "9c3030"
	if(current_version < 22)
		job_preferences = list() //It loaded null from nonexistant savefile field.
		var/job_civilian_high = 0
		var/job_civilian_med = 0
		var/job_civilian_low = 0

		var/job_medsci_high = 0
		var/job_medsci_med = 0
		var/job_medsci_low = 0

		var/job_engsec_high = 0
		var/job_engsec_med = 0
		var/job_engsec_low = 0

		READ_FILE(S["job_civilian_high"], job_civilian_high)
		READ_FILE(S["job_civilian_med"], job_civilian_med)
		READ_FILE(S["job_civilian_low"], job_civilian_low)
		READ_FILE(S["job_medsci_high"], job_medsci_high)
		READ_FILE(S["job_medsci_med"], job_medsci_med)
		READ_FILE(S["job_medsci_low"], job_medsci_low)
		READ_FILE(S["job_engsec_high"], job_engsec_high)
		READ_FILE(S["job_engsec_med"], job_engsec_med)
		READ_FILE(S["job_engsec_low"], job_engsec_low)

		//Can't use SSjob here since this happens right away on login
		for(var/job in subtypesof(/datum/job))
			var/datum/job/J = job
			var/new_value
			var/fval = initial(J.flag)
			switch(initial(J.department_flag))
				if(CIVILIAN)
					if(job_civilian_high & fval)
						new_value = JP_HIGH
					else if(job_civilian_med & fval)
						new_value = JP_MEDIUM
					else if(job_civilian_low & fval)
						new_value = JP_LOW
				if(MEDSCI)
					if(job_medsci_high & fval)
						new_value = JP_HIGH
					else if(job_medsci_med & fval)
						new_value = JP_MEDIUM
					else if(job_medsci_low & fval)
						new_value = JP_LOW
				if(ENGSEC)
					if(job_engsec_high & fval)
						new_value = JP_HIGH
					else if(job_engsec_med & fval)
						new_value = JP_MEDIUM
					else if(job_engsec_low & fval)
						new_value = JP_LOW
			if(new_value)
				job_preferences[initial(J.title)] = new_value
	if(current_version < 23)
		all_quirks -= "Physically Obstructive"
		all_quirks -= "Neat"
		all_quirks -= "NEET"
	if(current_version < 26) //The new donator hats system obsolesces the old one entirely, we need to update.
		donor_hat = null
		donor_item = null
	if(current_version < 27)
		map = TRUE
		flare = TRUE
	if(current_version < 28)
		if(!job_preferences)
			job_preferences = list()
	if(current_version < 29)
		purrbation = FALSE
	if(current_version < 30) //Someone doesn't know how to code and make savefiles get corrupted
		if(!ispath(donor_hat))
			donor_hat = null
		if(!ispath(donor_item))
			donor_item = null
	if(current_version < 31) //Someone doesn't know how to code and make jukebox and autodeadmin the same thing
		toggles &= ~DEADMIN_ALWAYS
		toggles &= ~DEADMIN_ANTAGONIST
		toggles &= ~DEADMIN_POSITION_HEAD
		toggles &= ~DEADMIN_POSITION_SECURITY
		toggles &= ~DEADMIN_POSITION_SILICON //This last one is technically a no-op but it looks cleaner and less like someone forgot
	if(current_version < 32) // Changed skillcape storage
		if(skillcape != 1)
			var/path = subtypesof(/datum/skillcape)[skillcape]
			var/datum/skillcape/cape = new path()
			skillcape_id = cape.id
			qdel(cape)
	if(current_version < 33) //Reset map preference to no choice
		if(preferred_map)
			to_chat(parent, span_userdanger("Your preferred map has been reset to nothing. Please set it to the map you wish to play on."))
		preferred_map = null
	if(current_version < 34) // default to on
		toggles |= SOUND_VOX
		

/datum/preferences/proc/load_path(ckey,filename="preferences.sav")
	if(!ckey)
		return
	path = "data/player_saves/[ckey[1]]/[ckey]/[filename]"

/datum/preferences/proc/load_preferences()
	if(!path)
		return FALSE
	if(!fexists(path))
		return FALSE

	var/savefile/S = new /savefile(path)
	if(!S)
		return FALSE
	S.cd = "/"

	var/needs_update = savefile_needs_update(S)
	if(needs_update == -2)		//fatal, can't load any data
		return FALSE

	//general preferences
	READ_FILE(S["asaycolor"], asaycolor)
	READ_FILE(S["ooccolor"], ooccolor)
	READ_FILE(S["lastchangelog"], lastchangelog)
	READ_FILE(S["UI_style"], UI_style)
	READ_FILE(S["hotkeys"], hotkeys)
	READ_FILE(S["chat_on_map"], chat_on_map)
	READ_FILE(S["max_chat_length"], max_chat_length)
	READ_FILE(S["see_chat_non_mob"] , see_chat_non_mob)
	READ_FILE(S["see_rc_emotes"] , see_rc_emotes)
	READ_FILE(S["tgui_fancy"], tgui_fancy)
	READ_FILE(S["tgui_lock"], tgui_lock)
	READ_FILE(S["buttons_locked"], buttons_locked)
	READ_FILE(S["windowflash"], windowflashing)
	READ_FILE(S["be_special"] , be_special)
	READ_FILE(S["player_alt_titles"], player_alt_titles)

	READ_FILE(S["default_slot"], default_slot)
	READ_FILE(S["chat_toggles"], chat_toggles)
	READ_FILE(S["toggles"], toggles)
	READ_FILE(S["ghost_form"], ghost_form)
	READ_FILE(S["ghost_orbit"], ghost_orbit)
	READ_FILE(S["ghost_accs"], ghost_accs)
	READ_FILE(S["ghost_others"], ghost_others)
	READ_FILE(S["preferred_map"], preferred_map)
	READ_FILE(S["ignoring"], ignoring)
	READ_FILE(S["ghost_hud"], ghost_hud)
	READ_FILE(S["inquisitive_ghost"], inquisitive_ghost)
	READ_FILE(S["uses_glasses_colour"], uses_glasses_colour)
	READ_FILE(S["clientfps"], clientfps)
	READ_FILE(S["parallax"], parallax)
	READ_FILE(S["ambientocclusion"], ambientocclusion)
	READ_FILE(S["auto_fit_viewport"], auto_fit_viewport)
	READ_FILE(S["widescreenpref"], widescreenpref)
	READ_FILE(S["pixel_size"], pixel_size)
	READ_FILE(S["scaling_method"], scaling_method)
	READ_FILE(S["menuoptions"], menuoptions)
	READ_FILE(S["enable_tips"], enable_tips)
	READ_FILE(S["tip_delay"], tip_delay)
	READ_FILE(S["pda_style"], pda_style)
	READ_FILE(S["pda_color"], pda_color)
	READ_FILE(S["id_in_pda"], id_in_pda)

	READ_FILE(S["skillcape"], skillcape)
	READ_FILE(S["skillcape_id"], skillcape_id)
	READ_FILE(S["map"], map)
	READ_FILE(S["flare"], flare)
	READ_FILE(S["bar_choice"], bar_choice)
	READ_FILE(S["show_credits"], show_credits)

	// yogs start - Donor features
	READ_FILE(S["donor_pda"], donor_pda)
	READ_FILE(S["donor_hat"], donor_hat)
	READ_FILE(S["borg_hat"], borg_hat)
	READ_FILE(S["donor_item"], donor_item)
	READ_FILE(S["purrbation"], purrbation)
	READ_FILE(S["yogtoggles"], yogtoggles)

	READ_FILE(S["accent"], accent) // Accents, too!
	// yogs end

	//try to fix any outdated data if necessary
	if(needs_update >= 0)
		update_preferences(needs_update, S)		//needs_update = savefile_version if we need an update (positive integer)

	//Sanitize
	asaycolor			= sanitize_ooccolor(sanitize_hexcolor(asaycolor, 6, 1, initial(asaycolor)))
	ooccolor			= sanitize_ooccolor(sanitize_hexcolor(ooccolor, 6, 1, initial(ooccolor)))
	lastchangelog		= sanitize_text(lastchangelog, initial(lastchangelog))
	UI_style			= sanitize_inlist(UI_style, GLOB.available_ui_styles, GLOB.available_ui_styles[1])
	hotkeys				= sanitize_integer(hotkeys, FALSE, TRUE, initial(hotkeys))
	chat_on_map			= sanitize_integer(chat_on_map, FALSE, TRUE, initial(chat_on_map))
	max_chat_length 	= sanitize_integer(max_chat_length, 1, CHAT_MESSAGE_MAX_LENGTH, initial(max_chat_length))	
	see_chat_non_mob	= sanitize_integer(see_chat_non_mob, FALSE, TRUE, initial(see_chat_non_mob))
	see_rc_emotes		= sanitize_integer(see_rc_emotes, FALSE, TRUE, initial(see_rc_emotes))
	tgui_fancy			= sanitize_integer(tgui_fancy, FALSE, TRUE, initial(tgui_fancy))
	tgui_lock			= sanitize_integer(tgui_lock, FALSE, TRUE, initial(tgui_lock))
	buttons_locked		= sanitize_integer(buttons_locked, FALSE, TRUE, initial(buttons_locked))
	windowflashing		= sanitize_integer(windowflashing, FALSE, TRUE, initial(windowflashing))
	default_slot		= sanitize_integer(default_slot, 1, max_save_slots, initial(default_slot))
	toggles				= sanitize_integer(toggles, 0, ~0, initial(toggles)) // Yogs -- Fixes toggles not having >16 bits of flagspace
	clientfps			= sanitize_integer(clientfps, 0, 1000, 0)
	parallax			= sanitize_integer(parallax, PARALLAX_INSANE, PARALLAX_DISABLE, null)
	ambientocclusion	= sanitize_integer(ambientocclusion, FALSE, TRUE, initial(ambientocclusion))
	auto_fit_viewport	= sanitize_integer(auto_fit_viewport, FALSE, TRUE, initial(auto_fit_viewport))
	widescreenpref  	= sanitize_integer(widescreenpref, FALSE, TRUE, initial(widescreenpref))
	pixel_size			= sanitize_integer(pixel_size, PIXEL_SCALING_AUTO, PIXEL_SCALING_3X, initial(pixel_size))
	scaling_method  	= sanitize_text(scaling_method, initial(scaling_method))
	ghost_form			= sanitize_inlist(ghost_form, GLOB.ghost_forms, initial(ghost_form))
	ghost_orbit 		= sanitize_inlist(ghost_orbit, GLOB.ghost_orbits, initial(ghost_orbit))
	ghost_accs			= sanitize_inlist(ghost_accs, GLOB.ghost_accs_options, GHOST_ACCS_DEFAULT_OPTION)
	ghost_others		= sanitize_inlist(ghost_others, GLOB.ghost_others_options, GHOST_OTHERS_DEFAULT_OPTION)
	menuoptions			= SANITIZE_LIST(menuoptions)
	be_special			= SANITIZE_LIST(be_special)
	pda_style			= sanitize_inlist(pda_style, GLOB.pda_styles, initial(pda_style))
	pda_color			= sanitize_hexcolor(pda_color, 6, 1, initial(pda_color))
	skillcape       	= sanitize_integer(skillcape, 1, 82, initial(skillcape))
	skillcape_id		= sanitize_text(skillcape_id, initial(skillcape_id))

	if(skillcape_id != "None" && !(skillcape_id in GLOB.skillcapes))
		skillcape_id = "None"

	map					= sanitize_integer(map, FALSE, TRUE, initial(map))
	flare				= sanitize_integer(flare, FALSE, TRUE, initial(flare))
	bar_choice			= sanitize_text(bar_choice, initial(bar_choice))

	var/bar_sanitize = FALSE
	for(var/A in GLOB.potential_box_bars)
		if(bar_choice == A)
			bar_sanitize = TRUE
			break
	if(!bar_sanitize)
		bar_choice = "Random"
	if(!player_alt_titles) player_alt_titles = new()
	show_credits	= sanitize_integer(show_credits, FALSE, TRUE, initial(show_credits))

	// yogs start - Donor features & yogtoggles
	yogtoggles		= sanitize_integer(yogtoggles, 0, (1 << 23), initial(yogtoggles))
	donor_pda		= sanitize_integer(donor_pda, 1, GLOB.donor_pdas.len, 1)
	purrbation      = sanitize_integer(purrbation, FALSE, TRUE, initial(purrbation))

	accent			= sanitize_text(accent, initial(accent)) // Can't use sanitize_inlist since it doesn't support falsely default values.
	// yogs end

	load_keybindings(S) // yogs - Custom keybindings

	return TRUE

/datum/preferences/proc/save_preferences()
	if(!path)
		return FALSE
	var/savefile/S = new /savefile(path)
	if(!S)
		return FALSE
	S.cd = "/"

	WRITE_FILE(S["version"] , SAVEFILE_VERSION_MAX)		//updates (or failing that the sanity checks) will ensure data is not invalid at load. Assume up-to-date

	//general preferences
	WRITE_FILE(S["asaycolor"], asaycolor)
	WRITE_FILE(S["ooccolor"], ooccolor)
	WRITE_FILE(S["lastchangelog"], lastchangelog)
	WRITE_FILE(S["UI_style"], UI_style)
	WRITE_FILE(S["hotkeys"], hotkeys)
	WRITE_FILE(S["chat_on_map"], chat_on_map)
	WRITE_FILE(S["max_chat_length"], max_chat_length)
	WRITE_FILE(S["see_chat_non_mob"], see_chat_non_mob)
	WRITE_FILE(S["see_rc_emotes"], see_rc_emotes)
	WRITE_FILE(S["tgui_fancy"], tgui_fancy)
	WRITE_FILE(S["tgui_lock"], tgui_lock)
	WRITE_FILE(S["buttons_locked"], buttons_locked)
	WRITE_FILE(S["windowflash"], windowflashing)
	WRITE_FILE(S["be_special"], be_special)
	WRITE_FILE(S["player_alt_titles"], player_alt_titles)
	WRITE_FILE(S["default_slot"], default_slot)
	WRITE_FILE(S["toggles"], toggles)
	WRITE_FILE(S["chat_toggles"], chat_toggles)
	WRITE_FILE(S["ghost_form"], ghost_form)
	WRITE_FILE(S["ghost_orbit"], ghost_orbit)
	WRITE_FILE(S["ghost_accs"], ghost_accs)
	WRITE_FILE(S["ghost_others"], ghost_others)
	WRITE_FILE(S["preferred_map"], preferred_map)
	WRITE_FILE(S["ignoring"], ignoring)
	WRITE_FILE(S["ghost_hud"], ghost_hud)
	WRITE_FILE(S["inquisitive_ghost"], inquisitive_ghost)
	WRITE_FILE(S["uses_glasses_colour"], uses_glasses_colour)
	WRITE_FILE(S["clientfps"], clientfps)
	WRITE_FILE(S["parallax"], parallax)
	WRITE_FILE(S["ambientocclusion"], ambientocclusion)
	WRITE_FILE(S["auto_fit_viewport"], auto_fit_viewport)
	WRITE_FILE(S["widescreenpref"], widescreenpref)
	WRITE_FILE(S["pixel_size"], pixel_size)
	WRITE_FILE(S["scaling_method"], scaling_method)
	WRITE_FILE(S["menuoptions"], menuoptions)
	WRITE_FILE(S["enable_tips"], enable_tips)
	WRITE_FILE(S["tip_delay"], tip_delay)
	WRITE_FILE(S["pda_style"], pda_style)
	WRITE_FILE(S["pda_color"], pda_color)
	WRITE_FILE(S["id_in_pda"], id_in_pda)
	WRITE_FILE(S["skillcape"], skillcape)
	WRITE_FILE(S["skillcape_id"], skillcape_id)
	WRITE_FILE(S["show_credits"], show_credits)
