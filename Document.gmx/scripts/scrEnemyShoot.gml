//if ammo > 0 {

    // SB USRG-SR. 
    if sprite_index = sprEWalkHK417 {
        if reload > 0 reload -= 1
        else {
            ammo -= 1
            light = 10
            global.shake = 3
            sound_ps(sndHK417)
            mask_index = sprWeaponMask
            reload = 3
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) or place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objWall) {
                my_id = instance_create(x, y, objSmokeHit)
                my_id.image_angle = image_angle
                global.dir = angle
                with my_id {
                    move_contact_solid(global.dir, 16)
                }
            } else {           
                my_id = instance_create(x + lengthdir_x(20, angle), y + lengthdir_y(20, angle), objEBullet)
                projectile_enemy(26 + random(4), 4, 0.25, 10)
                scrCreateMuzzleFlashEnemy()
            }
            my_id = instance_create(x + lengthdir_x(5, angle - 5 * image_yscale), y + lengthdir_y(5, angle - 5 * image_yscale), objShell)
            my_id.sprite_index = sprRifleShell
            my_id.image_angle = angle
            my_id.direction = angle - 90 * image_yscale - 20 + random(30)
            my_id.speed = (1 + random(3))
            mask_index = sprMask
        }
    }

    // SVG-76.
    if sprite_index = sprEWalkAK {
        if reload > 0 reload -= 1
        else {
            ammo -= 1
            light = 10
            global.shake = 3
            sound_ps(sndKalashnikov)
            mask_index = sprWeaponMask
            reload = 4
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) or place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objWall) {
                my_id = instance_create(x, y, objSmokeHit)
                my_id.image_angle = image_angle
                global.dir = angle
                with my_id {
                    move_contact_solid(global.dir, 16)
                }
            } else {
                my_id = instance_create(x + lengthdir_x(20, angle), y + lengthdir_y(20, angle), objEBullet)
                projectile_enemy(14, 6, 0.2, 16)
                scrCreateMuzzleFlashEnemy()
            }
            my_id = instance_create(x + lengthdir_x(5, angle - 5 * image_yscale), y + lengthdir_y(5, angle - 5 * image_yscale), objShell)
            my_id.sprite_index = sprRifleShell
            my_id.image_angle = angle
            my_id.direction = angle - 90 * image_yscale - 20 + random(30)
            my_id.speed = (1 + random(3))
            mask_index = sprMask
        }
    }

    // Bronson 1928M.
    if sprite_index = sprEWalkThompson {
        if reload > 0 reload -= 1
        else {
            ammo -= 1
            light = 10
            global.shake = 3
            sound_ps(sndThompson)
            mask_index = sprWeaponMask
            reload = (1 + round(random(2)))
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) or place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objWall) {
                my_id = instance_create(x, y, objSmokeHit)
                my_id.image_angle = image_angle
                global.dir = angle
                with my_id {
                    move_contact_solid(global.dir, 16)
                }
            } else {
                my_id = instance_create(x + lengthdir_x(20, angle), y + lengthdir_y(20, angle), objEBullet)
                projectile_enemy(13 + random(4), 8, 0.4, 6 + random(6))
                scrCreateMuzzleFlashEnemy()
            }
            my_id = instance_create(x + lengthdir_x(5, angle - 5 * image_yscale), y + lengthdir_y(5, angle - 5 * image_yscale), objShell)
            my_id.sprite_index = sprRifleShell
            my_id.image_angle = angle
            my_id.direction = angle - 90 * image_yscale - 20 + random(30)
            my_id.speed = (1 + random(3))
            mask_index = sprMask
        }
    }

    /* Aries Widowmaker.
    if sprite_index = sprSpecialistWalkAA12 {
        if reload > 0 reload -= 1
        else {
            shake = 1
            ammo -= 1
            light = 10
            global.shake = 3
            sound_ps(sndAA12)
            mask_index = sprWeaponMask
            reload = (1 + round(random(2)))
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) or place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objWall) {
                my_id = instance_create(x, y, objSmokeHit)
                my_id.image_angle = image_angle
                global.dir = angle
                with my_id move_contact_solid(global.dir, 16)            
            } else {
                repeat(8) {
                    my_id = instance_create(x + lengthdir_x(20, angle), y + lengthdir_y(20, angle), objEBullet)
                    if instance_exists(my_id) {
                        my_id.direction = angle - 6 + random(12)
                        my_id.speed = (15 + random(4))
                        my_id.image_angle = my_id.direction
                    }
                }
                scrCreateMuzzleFlashEnemy()
            }
            my_id = instance_create(x + lengthdir_x(5, angle - 5 * image_yscale), y + lengthdir_y(5, angle - 5 * image_yscale), objShell)
            my_id.sprite_index = sprShotgunShell
            my_id.image_angle = angle
            my_id.direction = angle - 90 * image_yscale - 20 + random(30)
            my_id.speed = (1 + random(3))
            mask_index = sprMask
        }
    } */

    // Bartoli FR-12.
    if sprite_index = sprEWalkShotgun {
        if reload > 0 reload -= 1
        else {
            sound_ps(choose(sndSPAS01, sndSPAS02, sndSPAS03))
            ammo -= 1
            reload = 20
            global.shake = 6
            mask_index = sprWeaponMask
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) or place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objWall) {
                repeat(8) {
                    my_id = instance_create(x, y, objSmokeHit)
                    global.dir = angle
                    with my_id move_contact_all(global.dir, 26)
                }
            } else {
                repeat(6) {
                    my_id = instance_create(x + lengthdir_x(20, angle), y + lengthdir_y(20, angle), objEBullet)
                    projectile_enemy(16 - random(4), 6, 0.3, 15)
                }
                scrCreateMuzzleFlashEnemy()
            }
            my_id = instance_create(x + lengthdir_x(5, angle - 5 * image_yscale), y + lengthdir_y(5, angle - 5 * image_yscale), objShell)
            my_id.sprite_index = sprShotgunShell
            my_id.image_angle = angle
            my_id.direction = angle - 90 * image_yscale - 20 + random(30)
            my_id.speed = 1 + random(3)
            light = 20
            mask_index = sprMask
        }
    }

    // Bartoli 220.
    if sprite_index = sprEWalkDoubleBarrel {
        if reload > 0 reload -= 1
        else {
            sound_ps(sndDoubleBarrel)
            ammo -= 1
            reload = 15
            mask_index = sprWeaponMask
            global.shake = 6
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) or place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objWall) {
                repeat(16) {
                    my_id = instance_create(x, y, objSmokeHit)
                    global.dir = angle
                    with my_id move_contact_all(global.dir, 26)
                }
            } else {
                repeat(8) {
                    my_id = instance_create(x + lengthdir_x(20, angle), y + lengthdir_y(20, angle), objEBullet)
                    projectile_enemy(14, 10, 0.5, 18) 
                }
                scrCreateMuzzleFlashEnemy()
            }
            light = 20
            mask_index = sprMask
        }
    }

    // SB Zenith 40S.
    if sprite_index = sprEWalkSilencer {
        if reload > 0 reload -= 1
        else {
            sound_ps(sndSilencedPistol)
            ammo -= 1
            reload = 10
            global.shake = 2
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) or place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objWall) {
                my_id = instance_create(x, y, objSmokeHit)
                my_id.image_angle = image_angle
                global.dir = angle
                with my_id {
                    move_contact_solid(global.dir, 16)
                }
            } else {
                my_id = instance_create(x + lengthdir_x(32, angle), y + lengthdir_y(32, angle), objEBullet)
                projectile_enemy(21, 3, 0.9, 20)
                scrCreateMuzzleFlashEnemy()
            }
            my_id = instance_create(x + lengthdir_x(16, angle - 4 * image_yscale), y + lengthdir_y(16, angle - 4 * image_yscale), objShell)
            my_id.sprite_index = sprUziShell
            my_id.image_angle = angle
            my_id.direction = angle - 90 * image_yscale - 20 + random(30)
            my_id.speed = (1 + random(3))
            light = 12
        }
    }

    // SB Zenith 40.
    if sprite_index = sprEWalkHandgun {
        if reload > 0 reload -= 1
        else {
            sound_ps(sndHandgun)
            ammo -= 1
            reload = 10
            global.shake = 2
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) or place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objWall) {
                my_id = instance_create(x, y, objSmokeHit)
                my_id.image_angle = image_angle
                global.dir = angle
                with my_id {
                    move_contact_solid(global.dir, 16)
                }
            } else {
                my_id = instance_create(x + lengthdir_x(32, angle), y + lengthdir_y(32, angle), objEBullet)
                projectile_enemy(12 + random(4), 3, 0.75, 24)
                scrCreateMuzzleFlashEnemy()
            }
            my_id = instance_create(x + lengthdir_x(16, angle - 4 * image_yscale), y + lengthdir_y(16, angle - 4 * image_yscale), objShell)
            my_id.sprite_index = sprUziShell
            my_id.image_angle = angle
            my_id.direction = angle - 90 * image_yscale - 20 + random(30)
            my_id.speed = (1 + random(3))
            light = 12
        }
    }

    // Uzi.
    if sprite_index = sprEWalkUzi {
        sound_ps(sndUzi)
        ammo -= 1
        reload = 1
        global.shake = 3
        
        my_id = instance_create(x + lengthdir_x(32, angle), y + lengthdir_y(32, angle), objEBullet)
        projectile_enemy(16 + random(3), 5, 0.4, 8)
        scrCreateMuzzleFlashEnemy()
        
        my_id = instance_create(x + lengthdir_x(16, dir - 7 - 4 * left), y + lengthdir_y(16, dir - 7 - 4 * left), objShell)
        my_id.sprite_index = sprUziShell
        my_id.image_angle = dir
        my_id.direction = dir - 90 * left - 20 + random(30)
        my_id.speed = (1 + random(3))
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
    }
    /* Commando.
    if sprite_index = sprCommandoWalk {
        if reload > 0 reload -= 1
        else {
            sound_ps(sndHandgun)
            ammo -= 1
            shake = 1
            reload = 5
            sprite_index = sprCommandoAttack
            global.shake = 2
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) or place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objWall) {
                my_id = instance_create(x, y, objSmokeHit)
                my_id.image_angle = image_angle
                global.dir = angle
                with my_id {
                    move_contact_solid(global.dir, 16)
                }
            } else {
                if image_index >= 0 and image_index < 2 {
                    my_id = instance_create(x + lengthdir_x(27, direction + 20), y + lengthdir_y(27, direction + 20), objEBullet)
                    my_id.direction = direction - 4 + random(8)
                    my_id.speed = 20
                    my_id.image_angle = my_id.direction
                    sound_ps(sndHandgun)
                }

                if image_index >= 2 and image_index < 4 {
                    my_id = instance_create(x + lengthdir_x(27, direction - 20), y + lengthdir_y(27, direction - 20), objEBullet)
                    my_id.direction = direction - 4 + random(8)
                    my_id.speed = 20
                    my_id.image_angle = my_id.direction
                    sound_ps(sndHandgun)
                }

            }
            my_id = instance_create(x + lengthdir_x(16, angle - 4 * image_yscale), y + lengthdir_y(16, angle - 4 * image_yscale), objShell)
            my_id.sprite_index = sprUziShell
            my_id.image_angle = angle
            my_id.direction = angle - 90 * image_yscale - 20 + random(30)
            my_id.speed = (1 + random(3))
            light = 12
        }
    }
    */

    // Skorpion (fat enemies).
    if sprite_index = sprEFatGunWalk or sprite_index = sprEFatGunAttack {
        if reload > 0 reload -= 1
        else {
            ammo -= 1
            reload = 1
            global.shake = 6
            sound_ps(sndScorpion)
            sprite_index = sprEFatGunAttack
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) {
                my_id = instance_create(x, y, objSmokeHit)
                global.dir = angle
                with my_id move_contact_all(global.dir, 26)
            } else {
                flash = instance_create(x + lengthdir_x(26, angle - 16), y + lengthdir_y(26, angle - 16), objMuzzleFlash)
                if instance_exists(flash) {
                    flash.direction = angle
                    flash.image_angle = flash.direction
                }
                smoke = instance_create(x + lengthdir_x(26, angle - 16), y + lengthdir_y(26, angle - 16), choose(objMuzzleSmoke, objPistolSmoke))
                if instance_exists(smoke) {
                    smoke.direction = angle
                    smoke.image_angle = smoke.direction
                }
                my_id = instance_create(x + lengthdir_x(26, angle - 16), y + lengthdir_y(26, angle - 16), objEBullet)
                if instance_exists(my_id) {
                    my_id.direction = angle - 6 + random(12)
                    my_id.speed = 24 + random(6)
                    my_id.image_angle = my_id.direction
                }
                stream = instance_create(x + lengthdir_x(26, angle - 16), y + lengthdir_y(26, angle - 16), objEBulletStream)
                stream.direction = angle
                stream.image_angle = stream.direction
            }
            my_id = instance_create(x + lengthdir_x(5, angle - 5 * image_yscale), y + lengthdir_y(5, angle - 5 * image_yscale), objShell)
            my_id.sprite_index = sprUziShell
            my_id.image_angle = angle
            my_id.direction = angle - 90 * image_yscale - 20 + random(30)
            my_id.speed = 1 + random(3)
            light = 20
            mask_index = sprMask
        }
    }
    
    /* MP5 (Juggernauts).
    if sprite_index = sprJuggernautWalkMP5 or sprite_index = sprJuggernautAttackMP5 {
        if reload > 0 reload -= 1
        else {
            ammo -= 1
            reload = 4
            global.shake = 12
            sound_ps(sndMP5)
            sprite_index = sprJuggernautAttackMP5
            if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) {
                my_id = instance_create(x, y, objSmokeHit)
                global.dir = angle
                with my_id move_contact_all(global.dir, 26)
            } else {
                flash = instance_create(x + lengthdir_x(26, angle - 16), y + lengthdir_y(26, angle - 16), objMuzzleFlash)
                if instance_exists(flash) {
                    flash.direction = angle
                    flash.image_angle = flash.direction
                }
                burst = instance_create(x + lengthdir_x(26, angle - 16), y + lengthdir_y(26, angle - 16), objMuzzleLight)
                if instance_exists(burst) {
                    burst.direction = angle
                    burst.image_angle = burst.direction
                }
                smoke = instance_create(x + lengthdir_x(26, angle - 16), y + lengthdir_y(26, angle - 16), choose(objMuzzleSmoke, objPistolSmoke, objShotgunSmoke))
                if instance_exists(smoke) {
                    smoke.direction = angle
                    smoke.image_angle = smoke.direction
                }
                my_id = instance_create(x + lengthdir_x(26, angle - 16), y + lengthdir_y(26, angle - 16), objEBullet)
                if instance_exists(my_id) {
                    my_id.direction = angle - 6 + random(12)
                    my_id.speed = 24 + random(6)
                    my_id.image_angle = my_id.direction
                }
                stream = instance_create(x + lengthdir_x(26, angle - 16), y + lengthdir_y(26, angle - 16), objEBulletStream)
                stream.direction = angle
                stream.image_angle = stream.direction
            }
            my_id = instance_create(x + lengthdir_x(5, angle - 5 * image_yscale), y + lengthdir_y(5, angle - 5 * image_yscale), objShell)
            my_id.sprite_index = sprUziShell
            my_id.image_angle = angle
            my_id.direction = angle - 90 * image_yscale - 20 + random(30)
            my_id.speed = 1 + random(3)
            light = 20
            mask_index = sprMask
        }
    }
    */

//}

