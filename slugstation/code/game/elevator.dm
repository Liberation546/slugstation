//welcome to the elevator
//which floor would you like to go to?


/mob/living/simple_animal/hostile/seraph
	name = "Dogma"
	desc = "The Lord is my shepherd; I shall not want."
	health = 2000
	maxHealth = 2000
	attacktext = "purges"
	attack_sound = 'slugstation/sound/Brimstone_lazer_2.wav'
	icon = 'slugstation/icons/mob/abnormality/64x64.dmi'
	icon_state = "white_night"
	icon_living = "white_night"
	health_doll_icon = "white_night"
	faction = list("apostle")
	friendly = "stares down"
	speak_emote = list("preaches")
	melee_damage_type = BRUTE
	melee_damage_lower = 35
	melee_damage_upper = 40
	obj_damage = 600
	environment_smash = ENVIRONMENT_SMASH_WALLS
	speed = 1
	move_to_delay = 5
	ranged = TRUE
	pixel_x = -16
	pixel_y = -16
	loot = list(/obj/item/ego_weapon/paradise)
	deathmessage = "Disappears in a flash of static"
	deathsound = 'slugstation/sound/lcorp/apostle_death.ogg'
	light_color = "#FAE48E"
	light_range = 7
	light_power = 3
	color = "#808080"

/obj/item/toy/fastestbasketball
	name = "Fastket ball"
	icon_state = "basketball"
	item_state = "basketball"
	icon = 'icons/obj/toy.dmi'
	desc = "I sure do hope we dont get hit by that fastest basketball"
	force = 100000
	w_class = WEIGHT_CLASS_BULKY

/datum/emote/living/griddy
	key = "hitthegriddy"
	key_third_person = "hitsthegriddy"
	message = "Hits the griddy"
	message_robot = "Hits the griddy"
	message_AI = "Hits the griddy"
	message_alien = "Hits the griddy"
	message_larva = "Hits the griddy"
	message_monkey = "Hits the griddy"
	message_ipc = "Attempts to hit the griddy, however their coding prevents it" //ipcs cannot hit the griddy
	message_simple =  "Attempts to hit the griddy, failing horribly" //simplemobs must not hit the griddy :1984:
	cooldown = 0.1

datum/emote/living/crungo //this makes me crungo
	key = "crungo"
	key_third_person = "crungo"
	message = "crungoes"
	message_robot = "crungoes"
	message_AI = "crungoes"
	message_alien = "crungoes"
	message_larva = "crungoes"
	message_monkey = "crungoes"
	message_ipc = "crungoes"
	message_simple =  "crungoes"
	cooldown = 0.1


//DO NOT UNCOMMENT THIS CODE, WE MUST NOT SET HIM FREE 
/*
/mob/living/powerfulmob/hostile/ultrafauna/elevatorman
	name = "Elevator man" //oh its the elevator operator you know him
	desc = "welcome to the elevator which floor would you like to on" //beginning the flight
	health = 100000 //going up
	melee_damage_type = BRUTE//im not allowed to accept tips..
	melee_damage_lower = 400 //GET OFF THE DAMN ELEVATOR!!!
	melee_damage_upper = 600 //i said
	speed = 10 //WHICH FLOOR YOU WANNA GO ON!?
	status_flags = GODMODE //you touch the button?
	loot = /obj/item/toy/fastestbasketball //E N J O Y  Y O U R  D A Y
*/
