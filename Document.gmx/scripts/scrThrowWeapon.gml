//Throw weapon.

if global.state = 0 {
    sound_ps(sndThrow)

    // Create weapon.
    weapon = instance_create(x, y, objWeaponThrow)
    weapon.ammo = lastammo
    weapon.image_index = lastweapon
    weapon.friction = 0.1
    if scrCurrentWeaponExt(sprite_index) = 74 // Brick
    or scrCurrentWeaponExt(sprite_index) = 5 // Knife
    or scrCurrentWeaponExt(sprite_index) = 70 // Bottle
        {
            weapon.speed = 16
            weapon.direction = dir
        } else {
            weapon.speed = 12
            weapon.direction = dir - 5 + random(10)
        }
    sprite_index = sprPWalkUnarmed

}
