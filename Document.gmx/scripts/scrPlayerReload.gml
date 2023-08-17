if scrIsReloading(sprite_index) {

    // Honey Badger.
    if sprite_index = sprPReloadSuppressedMG {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 7 and image_index - global.reloadspeed < 7 {
                sound_ps(sndReloadGeneric)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 2
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadSuppressedMG sprite_index = sprPWalkSuppressedMG
            sound_ps(sndSlideRifle)
        }
    }

    // TAC-SMG SD.
    if sprite_index = sprPReloadFMG {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 7 and image_index - global.reloadspeed < 7 {
                sound_ps(sndMagazineEjectSMG)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 3
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
        } else {
            sound_ps(sndSlideHandgun)
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadFMG sprite_index = sprPWalkFMG
        }
    }
    
    // Kalashnikov.
    if sprite_index = sprPReloadAK {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 7 and image_index - global.reloadspeed < 7 {
                sound_ps(sndEjectClipRifle)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 0
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
        } else {
            sound_ps(sndSlideRifle)
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadAK sprite_index = sprPWalkAK
        }
    }
    
    // HK417.
    if sprite_index = sprPReloadHK417 {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 3 and image_index - global.reloadspeed < 3 {
                sound_ps(sndEjectClipRifle)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 3
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
            if image_index >= 7 and image_index - global.reloadspeed < 7 sound_ps(sndInsertClipRifle)

        } else {
            sound_ps(sndSlideRifle)
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadHK417 sprite_index = sprPWalkHK417
        }
    }
    
    // Thompson.
    if sprite_index = sprPReloadThompson {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 3 and image_index - global.reloadspeed < 3 {
                sound_ps(sndEjectClipRifle)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 3
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
            if image_index >= 7 and image_index - global.reloadspeed < 7 sound_ps(sndInsertClipRifle)

        } else {
            sound_ps(sndSlideRifle)
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadThompson sprite_index = sprPWalkThompson
        }
    }
    
    // M16A4.
    if sprite_index = sprPReloadM16 {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 3 and image_index - global.reloadspeed < 3 {
                sound_ps(sndEjectClipRifle)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 3
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
            if image_index >= 7 and image_index - global.reloadspeed < 7 sound_ps(sndInsertClipRifle)

        } else {
            sound_ps(sndSlideRifle)
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadM16 sprite_index = sprPWalkM16
        }
    }
    
    // Double-barrel shotgun.
    if sprite_index = sprPReloadDoubleBarrel {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed * 1.5
            if image_index >= 3 and image_index - global.reloadspeed < 3 {
                repeat (2) {
                    my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objShell)
                    my_id.sprite_index = sprShotgunShell
                    my_id.image_angle = dir
                    my_id.direction = dir - 90 * left - 20 + random(30)
                    my_id.speed = 1 + random(2)
                }
            }
            if image_index >= 11 and image_index - global.reloadspeed * 1.5 < 11 sound_ps(sndInsertShell)
            if image_index >= 16 and image_index - global.reloadspeed * 1.5 < 16 sound_ps(sndInsertShell)

        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadDoubleBarrel sprite_index = sprPWalkDoubleBarrel
        }
    }
    
    // MP5.
    if sprite_index = sprPReloadMP5 {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 3 and image_index - global.reloadspeed < 3 {
                sound_ps(sndMagazineEjectSMG)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 3
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
        } else {
            sound_ps(sndSlideHandgun)
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadMP5 sprite_index = sprPWalkMP5
        }
    }
    
    // SB Zenith (unsuppressed).
    if sprite_index = sprPReloadPistol {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 5 and image_index - global.reloadspeed < 5 {
                sound_ps(sndEjectClip)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 3
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
            if image_index >= 10 and image_index - global.reloadspeed < 10 sound_ps(sndInsertClip)
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadPistol sprite_index = sprPWalkHandgun
            sound_ps(sndSlideHandgun)
            sound_ps(sndRecharge)
        }
    }
    
    // Maxim 9.
    if sprite_index = sprPReloadSilencer {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 5 and image_index - global.reloadspeed < 5 {
                sound_ps(sndEjectClip)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 3
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
            
            if image_index >= 10 and image_index - global.reloadspeed < 10 sound_ps(sndInsertClip)
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadSilencer sprite_index = sprPWalkSilencer
            sound_ps(sndRecharge)
            sound_ps(sndSlideHandgun)
        }
    }
    
    // Desert Eagle.
    if sprite_index = sprPReloadDesertEagle {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 5 and image_index - global.reloadspeed < 5 {
                sound_ps(sndEjectClipHandgun)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 3
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
            
            if image_index >= 10 and image_index - global.reloadspeed < 10 sound_ps(sndMagDesertEagle)
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadDesertEagle sprite_index = sprPWalkDesertEagle
            sound_ps(sndSlideDesertEagle)
        }
    }
    
    // Simone.
    if sprite_index = simoneReload {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 1 and image_index - global.reloadspeed < 1 {
                sound_ps(sndRevolverOpen)
                sound_ps(sndRevolverShellsOut)
                repeat(6) {
                    my_id = instance_create(x + lengthdir_x(5, dir - 5 * image_yscale), y + lengthdir_y(5, dir - 5 * image_yscale), objShell)
                    my_id.sprite_index = sprSniperShell
                    my_id.image_angle = random(360)
                    my_id.direction = dir - 90 * image_yscale - 20 + random(30)
                    my_id.speed = 1 + random(3)
                }
            }
            if image_index >= 15 and image_index - global.reloadspeed < 15 sound_ps(sndRevolverShellsIn)
            if image_index >= 17 and image_index - global.reloadspeed < 17 sound_ps(sndRevolverClose)
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = simoneReload sprite_index = simoneWalk
            sound_ps(sndRevolverHammer)
        }
    }
    
    // Pierrette: SMG.
    if sprite_index = pierretteReload {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 5 and image_index - global.reloadspeed < 5 {
                sound_ps(sndThrow)
                weapon = instance_create(x, y, objPierretteSMG)
                weapon.speed = 16
                weapon.direction = dir
                weapon.image_angle = random(360)
                weapon.friction = 0.1
            }
            if image_index >= 10 and image_index - global.reloadspeed < 10 sound_ps(sndRespawnGun)
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = pierretteReload sprite_index = pierretteWalkSMG
            sound_ps(sndRecharge)
        }
    }
    
    if sprite_index = pierretteReloadShield {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 5 and image_index - global.reloadspeed < 5 {
                sound_ps(sndThrow)
                weapon = instance_create(x, y, objPierretteSMG)
                weapon.speed = 16
                weapon.direction = dir
                weapon.image_angle = random(360)
                weapon.friction = 0.1
            }
            if image_index >= 10 and image_index - global.reloadspeed < 10 sound_ps(sndRespawnGun)
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = pierretteReloadShield sprite_index = pierretteWalkShield
            sound_ps(sndRecharge)
        }
    }
    
    // Pistol with knife.
    if sprite_index = sprPReloadKnifePistol {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 2 and image_index - global.reloadspeed < 5 {
                sound_ps(sndEjectClip)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 3
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
            if image_index >= 7 and image_index - global.reloadspeed < 7 sound_ps(sndInsertClip)
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadKnifePistol sprite_index = sprPWalkKnifePistol
            sound_ps(sndSlideHandgun)
        }
    }
    
    // Uzi.
    if sprite_index = sprPReloadUzi {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 7 and image_index - global.reloadspeed < 7 {
                sound_ps(sndMagazineEjectSMG)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 2
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadUzi sprite_index = sprPWalkUzi
        }
    }
    
    // Skorpion.
    if sprite_index = sprPReloadScorpion {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 7 and image_index - global.reloadspeed < 7 {
                sound_ps(sndMagazineEjectSMG)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 2
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadScorpion sprite_index = sprPWalkScorpion
        }
    }
    
    // MAC-10.
    if sprite_index = sprPReloadIngram {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 7 and image_index - global.reloadspeed < 7 {
                sound_ps(sndMagazineEjectSMG)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 2
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
        } else {
            sound_ps(sndReloadGeneric)
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadIngram sprite_index = sprPWalkIngram
        }
    }

    // Intervention.
    if sprite_index = sprPReloadSniper {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += 0.2
            if image_index >= 7 and image_index - 0.2 < 7 {
                sound_ps(sndReloadSniper)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 4
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadSniper sprite_index = sprPWalkSniper
        }
    }
    
    // Sieger 300.
    if sprite_index = sprPReloadWA2000 {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += 0.2
            if image_index >= 7 and image_index - 0.2 < 7 {
                sound_ps(sndReloadSniper)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 4
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadWA2000 sprite_index = sprPWalkWA2000
        }
    }

    // Suppressed shotgun.
    if sprite_index = sprPReloadSilencedShotgun {
        if ammo < 12 {
            if image_index * 10 = 47.5 sound_ps(sndInsertShell)
            if image_index < 9 image_index += global.reloadspeed else {
                ammo += 1
                image_index = 5
                sound_ps(sndInsertShell)
            }
        } else {
            if image_index < sprite_get_number(sprite_index) - 1 image_index += global.reloadspeed
            else {
                sound_ps(sndCockShotgun)
                sound_ps(sndRecharge)
                sprite_index = sprPWalkSilencedShotgun
            }
        }
    }
    
    // KSG.
    if sprite_index = sprPReloadKSG {
        if ammo < 14 {
            if image_index * 10 = 47.5 sound_ps(sndInsertShell)
            if image_index < 9 image_index += global.reloadspeed else {
                ammo += 1
                image_index = 5
                sound_ps(sndInsertShell)
            }
        } else {
            if image_index < sprite_get_number(sprite_index) - 1 image_index += global.reloadspeed
            else {
                sound_ps(sndCockShotgun)
                sprite_index = sprPAttackKSG
                image_speed = 0.25
            }
        }
    }
    
    // Shotgun.
    if sprite_index = sprPReloadShotgun {
        if ammo < 6 {
            if image_index * 10 = 47.5 sound_ps(sndInsertShell)
            if image_index < 9 image_index += global.reloadspeed else {
                ammo += 1
                image_index = 5
                sound_ps(sndInsertShell)
            }
        } else {
            if image_index < sprite_get_number(sprite_index) - 1 image_index += global.reloadspeed
            else {
                sound_ps(sndCockShotgun)
                sprite_index = sprPCockShotgun
                image_speed = 0.25
            }
        }
    }
    
    // HK417.
    if sprite_index = sprPReloadDisruptor {
        if image_index < sprite_get_number(sprite_index) - 1 {
            image_index += global.reloadspeed
            if image_index >= 8 and image_index - global.reloadspeed < 8 {
                sound_ps(sndDisruptorReload)
                my_id = instance_create(x + lengthdir_x(5, dir - 5 * left), y + lengthdir_y(5, dir - 5 * left), objGunClip)
                my_id.image_index = 3
                my_id.image_angle = dir
                my_id.direction = dir - 90 * left - 20 + random(30)
                my_id.speed = 1 + random(2)
            }
            //if image_index >= 18 and image_index - global.reloadspeed < 18 sound_ps(sndInsertClipRifle)

        } else {
            ammo += (global.maxammo - ammo)
            if sprite_index = sprPReloadDisruptor sprite_index = sprPWalkDisruptor
        }
    }

}

//Additional states:

// Reload weapons if empty automatically, or if manually triggered.
if ammo = 0 or keyboard_check_pressed(ord('R')) scrGetPlayerReload()

//Reload dual G18s.
//if (ammo = 0 or keyboard_check_pressed(ord('F'))) and (sprite_index = sprPWalkDW or sprite_index = sprPTurnDW) {
if ammo = 0  and (sprite_index = sprPWalkDW or sprite_index = sprPTurnDW) {
    if mags > 0 {
        sprite_index = sprPReloadDW
        image_index = 0
        image_speed = 0
    } else {
        sprite_index = sprPWalkUnarmed
        image_index = 0
        image_speed = 0

        //Drop weapons when magazine is depleted.
        my_id = instance_create(x, y, objBeretta)
        my_id.direction = -45 - random(13)
        my_id.speed = 2

        my_id = instance_create(x, y, objBeretta)
        my_id.direction = 45 + random(13)
        my_id.speed = 2
    }
}

if sprite_index = sprPReloadDW {
    if image_index = 3 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 2
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }

    if image_index = 4 {
        my_id = instance_create(x + lengthdir_x(8, dir + 270 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 270 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 2
        my_id.speed = 3.5
        my_id.direction = dir + 270 * left - 20 + random(40)
    }
    
    if image_index < 16 image_index += global.reloadspeed
    else {
        //mags -= 2 
        sprite_index = sprPWalkDW
    }
    
    if image_index > 10 and ammo = 0 {
        ammo = 32
        mags -= 1
        sound_ps(sndMagazineEjectSMG) 
        sound_ps(sndRecharge)
    }
    
    if image_index > 13 and ammo = 32 {
        ammo = 64
        mags -= 1
        sound_ps(sndMagazineEjectSMG) 
        sound_ps(sndRecharge)
    }
}

