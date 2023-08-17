if sprite_index = sprJohnSmokeCigarette {
    image_speed = 0
    if image_index <= 73 image_index += 0.2
    else {
        sprite_index = sprPWalkUnarmed
        exhaled = 0
    }
    if image_index >= 13 and image_index - 0.2 < 13 sound_ps(sndLighter)
    if image_index >= 46 and image_index - 0.2 < 46 sound_ps(sndInhale)

    if image_index > 71 and exhaled = 0 {

        // Create smoke cloud.
        sound_ps(sndExhale)

        smoke_ring = instance_create(x + lengthdir_x(4, image_angle), y + lengthdir_y(4, image_angle), objSmokeExhale)
        smoke_ring.direction = dir
        smoke_ring.image_angle = dir - 4 + random(8)
        smoke_ring.speed = 0.25

        // Reset player behaviour.
        image_speed = 0
        exhaled = 1
    }
}

if instance_exists(mnPhone) {
    if mnPhone.active {
        if drop = 0 {
            if !scrIsUnarmed(sprite_index) scrPlayerDropWeapon()
            drop = 1
        }
        sprite_index = sprJohnUsePhone
        image_speed = 0.15
    }
    
    if !mnPhone.active and sprite_index = sprJohnUsePhone {
        sprite_index = sprJohnPutAwayPhone
        image_index = 0
        image_speed = 0.15
        drop = 0
    }
}
