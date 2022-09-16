/obj/item/toy/plush/nukeplushie/attack_self(mob/user)
	..()
	if(stuffed || grenade)
		if(prob(1))
			to_chat(user, "<span class='big bold'><font color = red>[html_encode("Attention! Delta security level reached!")]</font color><BR>[html_encode(CONFIG_GET(string/alert_delta))]</span><BR>")
			if(user.client.prefs.toggles & SOUND_ANNOUNCEMENTS)
				SEND_SOUND(user, sound('sound/misc/delta_alert.ogg'))
	else
		return
/obj/item/toy/plush/grizz
	name = "Mr. Grizz"
	desc = "A stuffed toy bear, theres a dead radio inside"
	icon = 'yogstation/icons/obj/toy.dmi'
	icon_state = "teddybear"
