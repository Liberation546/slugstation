/mob/living/proc/adjustPaleLoss(amount, updating_health = TRUE, forced = FALSE)
	var/damage_amt = maxHealth * (amount/100)
	return adjustBruteLoss(damage_amt, forced = forced)

/mob/living/simple_animal/adjustPaleLoss(amount, updating_health = TRUE, forced = FALSE)
	. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
