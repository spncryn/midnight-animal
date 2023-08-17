if global.character = 1 {
    if !scrIsUnarmed(sprite_index) {
        my_id = instance_create(x, y, objWeaponThrow)
        my_id.direction = random(360)
        my_id.speed = 1
        my_id.friction = 0.1
        my_id.image_index = scrCurrentWeaponExt(sprite_index)
        my_id.ammo = ammo
    }

    if finish = 0 {
        sprite_index = sprJohnSmokeCigarette
        finish = 1
    }
}

if global.character = 3 {
    if finish = 0 {
        sprite_index = simoneHolsterGun
        finish = 1
    }
}
