
/mob/living/simple_animal/proc/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	if(!forced && (status_flags & GODMODE))
		return FALSE
	bruteloss = round(clamp(bruteloss + amount, 0, maxHealth),DAMAGE_PRECISION)
	if(updating_health)
		updatehealth()
	return amount

/mob/living/simple_animal/adjustBruteLoss(amount, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[BRUTE])
		. = adjustHealth(amount * damage_coeff[BRUTE] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustFireLoss(amount, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[BURN])
		. = adjustHealth(amount * damage_coeff[BURN] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustOxyLoss(amount, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[OXY])
		. = adjustHealth(amount * damage_coeff[OXY] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustToxLoss(amount, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[TOX])
		. = adjustHealth(amount * damage_coeff[TOX] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustCloneLoss(amount, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[CLONE])
		. = adjustHealth(amount * damage_coeff[CLONE] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustStaminaLoss(amount, updating_health)
	return

// slug start - adds lcorp damage types
/mob/living/simple_animal/adjustRedLoss(amount, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[RED_DAMAGE])
		. = adjustHealth(amount * damage_coeff[RED_DAMAGE] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustWhiteLoss(amount, updating_health = TRUE, forced = FALSE, white_healable = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[WHITE_DAMAGE])
		. = adjustHealth(amount * damage_coeff[WHITE_DAMAGE] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustBlackLoss(amount, updating_health = TRUE, forced = FALSE, white_healable = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[BLACK_DAMAGE])
		. = adjustHealth(amount * damage_coeff[BLACK_DAMAGE] * CONFIG_GET(number/damage_multiplier), updating_health, forced)

/mob/living/simple_animal/adjustPaleLoss(amount, updating_health = TRUE, forced = FALSE)
	if(forced)
		. = adjustHealth(amount * CONFIG_GET(number/damage_multiplier), updating_health, forced)
	else if(damage_coeff[PALE_DAMAGE])
		. = adjustHealth((amount * (maxHealth/100)) * damage_coeff[PALE_DAMAGE] * CONFIG_GET(number/damage_multiplier), updating_health, forced)
// slug end
