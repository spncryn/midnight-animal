///Organise this script using scrCurrentWeaponExt.

global.ammo = -1
if scrMovingPlayerExists() {
    if global.character = 0 {
        global.ammo = objPlayer.ammo
        global.maxammo = scrGetSpecificAmmo(argument0)
    }
    
    if global.character = 1 { global.ammo = 0 global.maxammo = 0 }
    if global.character = 2 { global.ammo = objPlayer.ammo global.maxammo = 32 }
    if global.character = 3 { global.ammo = objPlayer.ammo global.maxammo = 6 } 
}
