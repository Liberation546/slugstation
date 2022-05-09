
/datum/design/mod_shell
	name = "MOD shell"
	desc = "A 'Nakamura Engineering' designed shell for a Modular Suit."
	id = "mod_shell"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 10000, /datum/material/plasma = 5000)
	construction_time = 25 SECONDS
	build_path = /obj/item/mod/construction/shell
	category = list("MOD Construction")

/datum/design/mod_helmet
	name = "MOD helmet"
	desc = "A 'Nakamura Engineering' designed helmet for a Modular Suit."
	id = "mod_helmet"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 5000)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/helmet
	category = list("MOD Construction")

/datum/design/mod_chestplate
	name = "MOD chestplate"
	desc = "A 'Nakamura Engineering' designed chestplate for a Modular Suit."
	id = "mod_chestplate"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 5000)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/chestplate
	category = list("MOD Construction")

/datum/design/mod_gauntlets
	name = "MOD gauntlets"
	desc = "'Nakamura Engineering' designed gauntlets for a Modular Suit."
	id = "mod_gauntlets"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 5000)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/gauntlets
	category = list("MOD Construction")

/datum/design/mod_boots
	name = "MOD boots"
	desc = "'Nakamura Engineering' designed boots for a Modular Suit."
	id = "mod_boots"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 5000)
	construction_time = 10 SECONDS
	build_path = /obj/item/mod/construction/boots
	category = list("MOD Construction")

/datum/design/mod_plating
	name = "MOD external plating"
	desc = "External plating for a MODsuit."
	id = "mod_plating_standard"
	build_type = MECHFAB|PROTOLATHE
	materials = list(/datum/material/iron = 6000, /datum/material/glass = 3000, /datum/material/plasma = 1000)
	construction_time = 15 SECONDS
	build_path = /obj/item/mod/construction/plating
	category = list("MOD Construction", "Equipment")
	research_icon = 'icons/obj/clothing/modsuit/mod_construction.dmi'
	research_icon_state = "standard-plating"

/datum/design/mod_plating/New()
	. = ..()
	var/obj/item/mod/construction/plating/armor_type = build_path
	var/datum/mod_theme/theme = GLOB.mod_themes[initial(armor_type.theme)]
	name = "MOD [theme.name] plating"
	desc = "External plating for a MODsuit. [theme.desc]"

/datum/design/mod_plating/engineering
	id = "mod_plating_engineering"
	build_path = /obj/item/mod/construction/plating/engineering
	materials = list(/datum/material/iron = 6000, /datum/material/gold = 2000, /datum/material/glass = 1000, /datum/material/plasma = 1000)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
	research_icon_state = "engineering-plating"

/datum/design/mod_plating/atmospheric
	id = "mod_plating_atmospheric"
	build_path = /obj/item/mod/construction/plating/atmospheric
	materials = list(/datum/material/iron = 6000, /datum/material/titanium = 2000, /datum/material/glass = 1000, /datum/material/plasma = 1000)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
	research_icon_state = "atmospheric-plating"

/datum/design/mod_plating/medical
	id = "mod_plating_medical"
	build_path = /obj/item/mod/construction/plating/medical
	materials = list(/datum/material/iron = 6000, /datum/material/silver = 2000, /datum/material/glass = 1000, /datum/material/plasma = 1000)
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
	research_icon_state = "medical-plating"

/datum/design/mod_plating/security
	id = "mod_plating_security"
	build_path = /obj/item/mod/construction/plating/security
	materials = list(/datum/material/iron = 6000, /datum/material/uranium = 2000, /datum/material/glass = 1000, /datum/material/plasma = 1000)
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	research_icon_state = "security-plating"

/datum/design/mod_plating/cosmohonk
	id = "mod_plating_cosmohonk"
	build_path = /obj/item/mod/construction/plating/cosmohonk
	materials = list(/datum/material/iron = 6000, /datum/material/bananium = 2000, /datum/material/glass = 1000, /datum/material/plasma = 1000)
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
	research_icon_state = "cosmohonk-plating"

/datum/design/mod_paint_kit
	name = "MOD paint kit"
	desc = "A paint kit for Modular Suits."
	id = "mod_paint_kit"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 1000, /datum/material/plastic = 500)
	construction_time = 5 SECONDS
	build_path = /obj/item/mod/paint
	category = list("Misc")

//MODsuit modules

/datum/design/module
	name = "MOD Module"
	build_type = MECHFAB
	construction_time = 1 SECONDS
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module
	category = list("MOD Modules")
	var/department_type = MODULE_GENERAL

/datum/design/module/New()
	. = ..()
	var/obj/item/mod/module/module = build_path
	desc = "[initial(module.desc)] It uses [initial(module.complexity)] complexity."

/datum/design/module/mod_storage
	name = "MOD Module: Storage"
	id = "mod_storage"
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 500)
	build_path = /obj/item/mod/module/storage

/datum/design/module/mod_storage_expanded
	name = "MOD Module: Expanded Storage"
	id = "mod_storage_expanded"
	materials = list(/datum/material/iron = 5000, /datum/material/uranium = 2000)
	build_path = /obj/item/mod/module/storage/large_capacity

/datum/design/module/mod_visor_medhud
	name = "MOD Module: Medical Visor"
	id = "mod_visor_medhud"
	materials = list(/datum/material/silver = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/visor/medhud
	department_type = MODULE_MEDICAL

/datum/design/module/mod_visor_diaghud
	name = "MOD Module: Diagnostic Visor"
	id = "mod_visor_diaghud"
	materials = list(/datum/material/gold = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/visor/diaghud
	department_type = MODULE_SCIENCE

/datum/design/module/mod_visor_sechud
	name = "MOD Module: Security Visor"
	id = "mod_visor_sechud"
	materials = list(/datum/material/titanium = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/visor/sechud
	department_type = MODULE_SECURITY

/datum/design/module/mod_visor_meson
	name = "MOD Module: Meson Visor"
	id = "mod_visor_meson"
	materials = list(/datum/material/uranium = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/visor/meson
	department_type = MODULE_SUPPLY

/datum/design/module/mod_visor_welding
	name = "MOD Module: Welding Protection"
	id = "mod_welding"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/welding
	department_type = MODULE_ENGINEERING

/datum/design/module/mod_t_ray
	name = "MOD Module: T-Ray Scanner"
	id = "mod_t_ray"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/t_ray
	department_type = MODULE_ENGINEERING

/datum/design/module/mod_health_analyzer
	name = "MOD Module: Health Analyzer"
	id = "mod_health_analyzer"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/health_analyzer
	department_type = MODULE_MEDICAL

/datum/design/module/mod_stealth
	name = "MOD Module: Cloak"
	id = "mod_stealth"
	materials = list(/datum/material/iron = 1000, /datum/material/bluespace = 500)
	build_path = /obj/item/mod/module/stealth
	department_type = MODULE_SECURITY

/datum/design/module/mod_jetpack
	name = "MOD Module: Ion Jetpack"
	id = "mod_jetpack"
	materials = list(/datum/material/iron = 1500, /datum/material/plasma = 1000)
	build_path = /obj/item/mod/module/jetpack

/datum/design/module/mod_magboot
	name = "MOD Module: Magnetic Stabilizator"
	id = "mod_magboot"
	materials = list(/datum/material/iron = 1000, /datum/material/gold = 500)
	build_path = /obj/item/mod/module/magboot
	department_type = MODULE_ENGINEERING

/datum/design/module/mod_mag_harness
	name = "MOD Module: Magnetic Harness"
	id = "mod_mag_harness"
	materials = list(/datum/material/iron = 1500, /datum/material/silver = 500)
	build_path = /obj/item/mod/module/magnetic_harness
	department_type = MODULE_SECURITY

/datum/design/module/mod_tether
	name = "MOD Module: Emergency Tether"
	id = "mod_tether"
	materials = list(/datum/material/iron = 1000, /datum/material/silver = 500)
	build_path = /obj/item/mod/module/tether
	department_type = MODULE_ENGINEERING

/datum/design/module/mod_mouthhole
	name = "MOD Module: Eating Apparatus"
	id = "mod_mouthhole"
	materials = list(/datum/material/iron = 1500)
	build_path = /obj/item/mod/module/mouthhole

/datum/design/module/mod_rad_protection
	name = "MOD Module: Radiation Protection"
	id = "mod_rad_protection"
	materials = list(/datum/material/iron = 1000, /datum/material/uranium = 1000)
	build_path = /obj/item/mod/module/rad_protection
	department_type = MODULE_ENGINEERING

/datum/design/module/mod_emp_shield
	name = "MOD Module: EMP Shield"
	id = "mod_emp_shield"
	materials = list(/datum/material/iron = 1000, /datum/material/plasma = 1000)
	build_path = /obj/item/mod/module/emp_shield

/datum/design/module/mod_flashlight
	name = "MOD Module: Flashlight"
	id = "mod_flashlight"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/flashlight

/datum/design/module/mod_reagent_scanner
	name = "MOD Module: Reagent Scanner"
	id = "mod_reagent_scanner"
	materials = list(/datum/material/glass = 1000)
	build_path = /obj/item/mod/module/reagent_scanner
	department_type = MODULE_SCIENCE

/datum/design/module/mod_gps
	name = "MOD Module: Internal GPS"
	id = "mod_gps"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/mod/module/gps
	department_type = MODULE_SUPPLY

/datum/design/module/mod_constructor
	name = "MOD Module: Constructor"
	id = "mod_constructor"
	materials = list(/datum/material/iron = 1000, /datum/material/titanium = 500)
	build_path = /obj/item/mod/module/constructor
	department_type = MODULE_ENGINEERING

/datum/design/module/mod_quick_carry
	name = "MOD Module: Quick Carry"
	id = "mod_quick_carry"
	materials = list(/datum/material/iron = 1000, /datum/material/titanium = 500)
	build_path = /obj/item/mod/module/quick_carry
	department_type = MODULE_MEDICAL

/datum/design/module/mod_longfall
	name = "MOD Module: Longfall"
	id = "mod_longfall"
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/mod/module/longfall

/datum/design/module/mod_thermal_regulator
	name = "MOD Module: Thermal Regulator"
	id = "mod_thermal_regulator"
	materials = list(/datum/material/iron = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/thermal_regulator

/datum/design/module/mod_injector
	name = "MOD Module: Injector"
	id = "mod_injector"
	materials = list(/datum/material/iron = 1000, /datum/material/diamond = 500)
	build_path = /obj/item/mod/module/injector
	department_type = MODULE_MEDICAL

/datum/design/module/mod_bikehorn
	name = "MOD Module: Bike Horn"
	id = "mod_bikehorn"
	materials = list(/datum/material/plastic = 500, /datum/material/iron = 500)
	build_path = /obj/item/mod/module/bikehorn
	department_type = MODULE_SERVICE

/datum/design/module/mod_microwave_beam
	name = "MOD Module: Microwave Beam"
	id = "mod_microwave_beam"
	materials = list(/datum/material/iron = 1000, /datum/material/uranium = 500)
	build_path = /obj/item/mod/module/microwave_beam
	department_type = MODULE_SERVICE

/datum/design/module/mod_waddle
	name = "MOD Module: Waddle"
	id = "mod_waddle"
	materials = list(/datum/material/plastic = 1000, /datum/material/iron = 1000)
	build_path = /obj/item/mod/module/waddle
	department_type = MODULE_SERVICE

/datum/design/module/mod_clamp
	name = "MOD Module: Crate Clamp"
	id = "mod_clamp"
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/mod/module/clamp
	department_type = MODULE_SUPPLY

/datum/design/module/mod_drill
	name = "MOD Module: Drill"
	id = "mod_drill"
	materials = list(/datum/material/silver = 1000, /datum/material/iron = 2000)
	build_path = /obj/item/mod/module/drill
	department_type = MODULE_SUPPLY

/datum/design/module/mod_orebag
	name = "MOD Module: Ore Bag"
	id = "mod_orebag"
	materials = list(/datum/material/iron = 1500)
	build_path = /obj/item/mod/module/orebag
	department_type = MODULE_SUPPLY

/datum/design/module/mod_organ_thrower
	name = "MOD Module: Organ Thrower"
	id = "mod_organ_thrower"
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/organ_thrower
	department_type = MODULE_MEDICAL

/datum/design/module/mod_pathfinder
	name = "MOD Module: Pathfinder"
	id = "mod_pathfinder"
	materials = list(/datum/material/uranium = 1000, /datum/material/iron = 1000)
	build_path = /obj/item/mod/module/pathfinder

/datum/design/module/mod_dna_lock
	name = "MOD Module: DNA Lock"
	id = "mod_dna_lock"
	materials = list(/datum/material/diamond = 500, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/dna_lock

/datum/design/module/mod_plasma_stabilizer
	name = "MOD Module: Plasma Stabilizer"
	id = "mod_plasma"
	materials = list(/datum/material/plasma = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/mod/module/plasma_stabilizer

/datum/design/module/mod_glove_translator
	name = "MOD Module: Glove Translator"
	id = "mod_sign_radio"
	materials = list(/datum/material/iron = 750, /datum/material/glass = 500)
	build_path = /obj/item/mod/module/signlang_radio

/datum/design/module/mister_atmos
	name = "MOD Module: Resin Mister"
	id = "mod_mister_atmos"
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 500, /datum/material/silver = 1000, /datum/material/titanium = 1500, /datum/material/uranium = 500)
	build_path = /obj/item/mod/module/mister/atmos
	department_type = MODULE_ENGINEERING

//MODsuit bepis modules

/datum/design/module/disposal
	name = "MOD Module: Disposal Connector"
	id = "mod_disposal"
	materials = list(/datum/material/iron = 2500, /datum/material/titanium = 1000)
	build_path = /obj/item/mod/module/disposal_connector
	department_type = MODULE_SUPPLY

//MODsuit anomalock modules

/datum/design/module/mod_antigrav
	name = "MOD Module: Anti-Gravity"
	id = "mod_antigrav"
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 2000, /datum/material/uranium = 2000)
	build_path = /obj/item/mod/module/anomaly_locked/antigrav
	department_type = MODULE_SCIENCE

/datum/design/module/mod_teleporter
	name = "MOD Module: Teleporter"
	id = "mod_teleporter"
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 2000, /datum/material/bluespace = 2000)
	build_path = /obj/item/mod/module/anomaly_locked/teleporter
	department_type = MODULE_SCIENCE

/datum/design/module/mod_kinesis
	name = "MOD Module: Kinesis"
	id = "mod_kinesis"
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 2000, /datum/material/uranium = 1000, /datum/material/bluespace = 1000)
	build_path = /obj/item/mod/module/anomaly_locked/kinesis
	department_type = MODULE_ENGINEERING
