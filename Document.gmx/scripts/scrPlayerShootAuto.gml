// Check for ammo.
if scrIsUnarmed(sprite_index) or scrCurrentWeaponExt(sprite_index) = 80 exit

if ammo > 0 {
    image_angle = dir

    //Battle rifle.
    if sprite_index = sprPWalkHK417 or sprite_index = sprPTurnHK417 {
        sound_ps(sndHK417)
        scrHearPlayer()
        ammo -= 1
        reload = 3
        warp_hud()
        global.shake = 14
        projectile(20, objBullet, 26 + random(4), 4, 0.25, 10, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprRifleShell)
        sound_ps(choose(snd5561, snd5562, snd5563))
        if sprite_index = sprPWalkHK417 {
            sprite_index = sprPAttackHK417
            image_speed = 0.5
            image_index = 0
        }
        objEffector.amp = 40
    }
    
    // The Patriot.
    if sprite_index = sprPWalkPatriot or sprite_index = sprPTurnPatriot {
        sound_ps(sndPatriot)
        scrHearPlayer()
        reload = 3
        warp_hud()
        global.shake = 16
        projectile(20, objBullet, 12 + random(20), 8, 0.25, 8, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprRifleShell)
        sound_ps(choose(snd5561, snd5562, snd5563))
        if sprite_index = sprPWalkPatriot {
            sprite_index = sprPAttackPatriot
            image_speed = 0.5
            image_index = 0
        }
        objEffector.amp = 40
    }
    
    //Honey Badger.
    if sprite_index = sprPWalkSuppressedMG and global.automatic = 1 {
        sound_ps(sndSilencedMG)
        scrHearPlayer()
        ammo -= 1
        reload = 3  
        global.shake = 13
        warp_hud()
        projectile(20, objBullet, 26 + random(4), 3, 0.33, 10, sprBullet)
        scrCreateMuzzleFlash(36)
        create_casing(sprRifleShell) 
        sound_ps(choose(snd5561, snd5562, snd5563))
        sprite_index = sprPAttackSuppressedMG
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 40
    }

    // Nailgun.
    if sprite_index = sprPWalkNailGun {
        sound_ps(sndNailGun)
        ammo -= 1
        reload = 6
        global.shake = 7
        projectile(20, objNail, 14 + random(7), 8, 1, 10, sprNail)
        sprite_index = sprPAttackNailgun
        image_speed = 1
        image_index = 0
        objEffector.amp = 40  
    }
    
    //P90.
    if sprite_index = sprPWalkP90 {
        sound_ps(sndP90)
        scrHearPlayer()
        ammo -= 1
        reload = 5
        global.shake = 10
        warp_hud()
        projectile(20, objBullet, 26 + random(4), 4, 0.7, 12, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprRifleShell)
        sound_ps(choose(snd5561, snd5562, snd5563))
        sprite_index = sprPAttackP90
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 40
        global.usedgun[0] = 1

    }

    //FAMAE.
    if sprite_index = sprPWalkFAMAE and global.automatic = 1 {
        if reload > 0 reload -= 1
        else {
            sprite_index = sprPAttackFAMAE
            image_speed = 1
            warp_hud()
            sound_ps(sndFAMAE)
            scrHearPlayer()
            ammo -= 1
            reload = 5
            global.shake = 10
            mask_index = sprWeaponMask
            projectile(20, objBullet, 12 + random(4), 6, 0.5, 8, sprBullet)
            scrCreateMuzzleFlash(36)
            create_casing(sprUziShell)
            sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
            objEffector.amp = 40

        }
    }

    //FMG-9.
    if sprite_index = sprPWalkFMG {
        sound_ps(sndFMG9)
        scrHearPlayer()
        ammo -= 1
        reload = 4
        global.shake = 8
        warp_hud()
        projectile(20, objBullet, 21, 3, 0.8, 14, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprUziShell)
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
        objEffector.amp = 40
    }

    //Kalashnikov.
    if sprite_index = sprPWalkAK or sprite_index = sprPTurnAK {
        sound_ps(sndKalashnikov)
        scrHearPlayer()
        ammo -= 1
        reload = 5
        global.shake = 10
        warp_hud()
        projectile(20, objBullet, 14, 6, 0.2, 16, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprRifleShell)
        sound_ps(choose(snd76201, snd76202, snd76203))
        if sprite_index = sprPWalkAK {
            sprite_index = sprPAttackAK
            image_speed = 0.5
            image_index = 0
        }
        objEffector.amp = 40
    }

    //M16A4.
    if sprite_index = sprPWalkM16 {
        sound_ps(sndM16)
        scrHearPlayer()
        ammo -= 1
        reload = 5
        global.shake = 10
        warp_hud()
            projectile(20, objBullet, 16, 6, 0.4, 14, sprBullet)
            scrCreateMuzzleFlash(26)
        create_casing(sprRifleShell)
        sound_ps(choose(snd76201, snd76202, snd76203))
        if sprite_index = sprPWalkM16 {
            sprite_index = sprPAttackM16
            image_speed = 0.5
            image_index = 0
        }
        objEffector.amp = 40
    }
    
    //Aries Vindicator (Mk48).
    if sprite_index = sprPWalkLMG {
        sound_ps(sndLMG)
        scrHearPlayer()
        ammo -= 1
        reload = 2
        global.shake = 13
        warp_hud()
        projectile(20, objBullet, 28 + random(4), 4, 0.12, 8, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprRifleShell)
        sound_ps(choose(snd76201, snd76202, snd76203))
        sprite_index = sprPAttackLMG
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 45

    }

    //Thompson submachine gun.
    if sprite_index = sprPWalkThompson or sprite_index = sprPTurnThompson {
        sound_ps(sndThompson)
        scrHearPlayer()
        ammo -= 1
        reload = 2 + round(random(2))
        global.shake = 10
        warp_hud()
        projectile(20, objBullet, 13 + random(4), 8, 0.4, 6 + random(6), sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprRifleShell)
        sound_ps(choose(snd76201, snd76202, snd76203))
        if sprite_index = sprPWalkThompson {
            sprite_index = sprPAttackThompson
            image_speed = 0.5
            image_index = 0
        }
        objEffector.amp = 45

    }


    //AA-12 (automatic shotgun).
    if sprite_index = sprPWalkAutoShotgun {
        sound_ps(sndAA12)
        scrHearPlayer()
        ammo -= 1
        reload = 9
        global.shake = 17
        warp_hud()
        repeat(6) projectile(20, objBullet, 18 + random(4), 9, 0.12, 8, sprBullet)
        scrCreateMuzzleFlash(26) 
        create_casing(sprShotgunShell)
        sound_ps(choose(snd12GA1, snd12GA2, snd12GA3))
        sprite_index = sprPAttackAutoShotgun
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 50

    }


    // Uzi.
    if sprite_index = sprPWalkUzi {
        sound_ps(sndUzi)
        scrHearPlayer()
        ammo -= 1
        reload = 4
        global.shake = 12
        warp_hud()
        projectile(20, objBullet, 16 + random(3), 5, 0.4, 8, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprUziShell)
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
        sprite_index = sprPAttackUzi
        image_speed = 1
        image_index = 0
        objEffector.amp = 40
    }

    // Suppressed MAC-10.
    if sprite_index = sprPWalkIngram {
        sound_ps(sndSilencedSMG)
        scrHearPlayer()
        ammo -= 1
        reload = 4
        global.shake = 8
        warp_hud()
        projectile(20, objBullet, 18 + random(4), 5, 0.33, 10, sprBullet)
        scrCreateMuzzleFlash(36)
        create_casing(sprUziShell)
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
        sprite_index = sprPAttackIngram
        image_speed = 1
        image_index = 0
        objEffector.amp = 40
        global.usedgun[8] = 1

    }


    // MP5.
    if sprite_index = sprPWalkMP5 or sprite_index = sprPTurnMP5 {
        sound_ps(sndMP5)
        scrHearPlayer()
        ammo -= 1
        reload = 4
        global.shake = 9
        warp_hud()
        projectile(20, objBullet, 22, 4, 0.24, 10, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprUziShell)
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
        if sprite_index = sprPWalkMP5 {
            sprite_index = sprPAttackMP5
            image_speed = 0.5
            image_index = 0
        }
        objEffector.amp = 40
        global.usedgun[7] = 1

    }

    // Dual machine pistols.
    if sprite_index = sprPWalkDW or sprite_index = sprPTurnDW {
        if reload > 0 reload -= 1
        else {
            sound_ps(sndHandgun)
            scrHearPlayer()
            ammo -= 1
            reload = 6
            global.shake = 10
            warp_hud()
            mask_index = sprWeaponMask
                flash = instance_create(x + lengthdir_x(22, armangle1) + lengthdir_x(5, dir + 90), y + lengthdir_y(21, armangle1) + lengthdir_y(5, dir + 90), objMuzzleFlash)
                if instance_exists(flash) {
                    flash.direction = dir
                    flash.image_angle = armangle1
                }

                my_id = instance_create(x + lengthdir_x(22, armangle1) + lengthdir_x(5, dir + 90), y + lengthdir_y(21, armangle1) + lengthdir_y(5, dir + 90), objBullet)
                if instance_exists(my_id) {
                    my_id.direction = armangle1 - 4 + random(8)
                    my_id.speed = 20 + random(4)
                    my_id.image_angle = my_id.direction
                    my_id.damage = 6
                }

            my_id = instance_create(x + lengthdir_x(12, armangle1 - 5 * image_yscale) + lengthdir_x(7, dir + 90), y + lengthdir_y(12, armangle1 - 5 * image_yscale) + lengthdir_y(7, dir + 90), objShell)
            my_id.sprite_index = sprUziShell
            my_id.image_angle = armangle1
            my_id.direction = armangle1 - 90 * image_yscale - 20 + random(30)
            my_id.speed = 1 + random(3)
            sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))

            if ammo > 1 {
                ammo -= 1

                    flash = instance_create(x + lengthdir_x(22, armangle2) + lengthdir_x(7, dir - 90), y + lengthdir_y(21, armangle2) + lengthdir_y(7, dir - 90), objMuzzleFlash)
                    if instance_exists(flash) {
                        flash.direction = dir
                        flash.image_angle = armangle2
                    }
                    my_id = instance_create(x + lengthdir_x(22, armangle2) + lengthdir_x(7, dir - 90), y + lengthdir_y(21, armangle2) + lengthdir_y(7, dir - 90), objBullet)
                    if instance_exists(my_id) {
                        my_id.direction = armangle2 - 4 + random(8)
                        my_id.speed = 20 + random(4)
                        my_id.image_angle = my_id.direction
                        my_id.damage = 5
                    }
                my_id = instance_create(x + lengthdir_x(12, armangle2 + 5 * image_yscale) + lengthdir_x(5, dir - 90), y + lengthdir_y(12, armangle2 + 5 * image_yscale) + lengthdir_y(5, dir - 90), objShell)
                my_id.sprite_index = sprUziShell
                my_id.image_angle = armangle2
                my_id.direction = armangle2 - 90 * image_yscale - 20 + random(30)
                my_id.speed = 1 + random(3)
                sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
            }
            objEffector.amp = 30

        }
    }

    // Skorpion.
    if sprite_index = sprPWalkScorpion {
        sound_ps(sndScorpion)
        scrHearPlayer()
        ammo -= 1
        reload = 2
        global.shake = 13
        warp_hud()
        projectile(20, objBullet, 24 + random(4), 7, 0.8, 6, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprUziShell)
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
        sprite_index = sprPAttackScorpion
        image_speed = 1
        image_index = 0
        objEffector.amp = 40
        global.usedgun[6] = 1

    }

    //Bartoli Auto 9 (AJM-9).
    if sprite_index = sprPWalkAJM and global.automatic = 0 {
        if reload > 0 reload -= 1
        else {
            sound_ps(sndAJMSingle)
            scrHearPlayer()
            ammo -= 1
            reload = 4
            global.shake = 8
            warp_hud()
            projectile(26, objBullet, 26 + random(5), 3, 0.12, 8, sprBullet)
            scrCreateMuzzleFlash(36)
            
            create_casing(sprUziShell)
            sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
            objEffector.amp = 40

        }
    }
    
    // Flamethrower.
    if sprite_index = sprPWalkFlamethrower {
        scrHearPlayer()
        ammo -= 1
        reload = 1
        
        flame=instance_create(x+ lengthdir_x(20, dir), y + lengthdir_y(20, dir), objFlame)
        flame.direction= dir - 1 + random(2)
        flame.speed=8
        flame.image_angle = dir
        if instance_exists(lastflame) flame.target=lastflame
        lastflame=flame
        
        if sprite_index = sprPWalkFlamethrower {
            sprite_index = sprPAttackFlamethrower
            image_speed = 0.5
            image_index = 0
        }
        objEffector.amp = 40
    }
    
    // SIMONE: Tornado-6
    if sprite_index = simoneAim {
        sound_ps(choose(sndRevolver1, sndRevolver2, sndRevolver3))
        scrHearPlayer()
        ammo -= 1
        reload = 2
        global.shake = 16
        warp_hud()
        if ammo = 0 {
            projectile(20, objBullet, 24, 8, 0.6, 300, sprBulletRicochet)
            PROJECTILE.image_blend = make_colour_rgb(66, 209, 244)
        } else projectile(20, objBullet, 16, 8, 0.6, 33, sprBulletRicochet)
        scrCreateMuzzleFlash(36)
        if ammo = 0 stream.image_blend = make_colour_rgb(66, 209, 244) else stream.image_blend = c_white
        sprite_index = simoneFanHammer
        image_index = 0
        image_speed = 0.5
        objEffector.amp = 40 
    }
    
    // PIERRETTE: unshielded.
    if sprite_index = pierretteWalkSMG {
        sound_ps(sndFMG9)
        ammo -= 1
        reload = 4
        global.shake = 8
        projectile(24, objBullet, 21, 0, 0.8, 14, sprShockRound)
        smoke = instance_create(x + lengthdir_x(26, dir), y + lengthdir_y(26, dir), objMuzzleSmoke)
        smoke.direction = dir
        smoke.image_angle = smoke.direction
        
        create_casing(sprUziShell)
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
        sprite_index = pierretteAttackSMG
        image_index = 0
        image_speed = 0.5
        objEffector.amp = 40
    }
}

