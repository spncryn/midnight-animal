release = 0
if reload > 0 reload = 0

lastweapon = scrCurrentWeaponExt(sprite_index)
lastammo = ammo

with _WEAPON {
    if point_distance(x, y, objPlayer.x, objPlayer.y) < 32 {

        if !scrIsGun(image_index) exit

        reload = 1
        scrGetWeaponNonlethal()
        objPlayer.ammo = ammo
        instance_destroy()
    }
}
