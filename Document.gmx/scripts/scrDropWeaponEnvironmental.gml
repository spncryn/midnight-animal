/// scrDropWeaponEnvironmental(x, y, weapon index)
if !scrMovingPlayerExists() exit
if global.character > 0 exit 

//weapon = instance_nearest(x, y, _WEAPON)
//if point_distance(weapon.x, weapon.y, objPlayer.x, objPlayer.y) < 16 exit

if point_distance(x, y, objPlayer.x, objPlayer.y) < 32 {
    if image_index = 0 image_index = 2
} else {
    if image_index = 2 image_index = 0
}

if image_index = 2 {
    if keyboard_check_pressed(global.interactkey)
    or mouse_check_button_pressed(mb_middle) {
        image_index = 1
        sound_ps(sndPickUpWeapon)
        scrGetWeapon(argument0)
    }
}
