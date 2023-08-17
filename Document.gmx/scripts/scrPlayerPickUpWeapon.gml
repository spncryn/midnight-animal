global.state = 0

// Scale player to get weapon.
objPlayer.image_xscale = 4
objPlayer.image_yscale = 4

// Drop current weapon.
lastweapon = scrCurrentWeaponExt(sprite_index)
lastammo = ammo

//if scrIsUnarmed(sprite_index) noweapon = 1 else noweapon = 0
with _WEAPON {
    if global.state = 0 {
        if point_distance(x, y, objPlayer.x, objPlayer.y) < 32 {
            scrGetWeapon(image_index)
            instance_destroy()
            objPlayer.ammo = ammo
            global.state = 1 
        }
    }
}

objPlayer.image_xscale = 1
objPlayer.image_yscale = 1
if global.state = 0 scrThrowWeapon()

