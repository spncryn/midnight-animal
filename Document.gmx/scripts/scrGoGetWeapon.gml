globalvar check;
scrMoveSolidOn()
if weaponfind = 0 {
    k = 0
    target = 0
    if checkreload > 0 checkreload -= 1
    else {
        checkreload = 10
        global.check = 0
        while k < instance_number(_WEAPON) and global.check = 0 {
            target = scrInstanceNearest(_WEAPON, k)
            if instance_exists(target) {
                    if !scrCollisionLineExt(x, y, target.x, target.y, 4) {
                        global.check = 1
                        weaponfind = 1
                    }
            }
            k += 1
        }
    }

    if weaponfind = 0 and instance_exists(objPlayer) {
        dist = point_distance(x, y, objPlayer.x, objPlayer.y)
        if dist < 32 {
            dir = point_direction(objPlayer.x, objPlayer.y, x, y)
            direction = dir - 180
            scrMoveSolidOn()
            if scrPlaceFree(x + lengthdir_x(1, dir), y + lengthdir_y(1, dir)) {
                x += lengthdir_x(1, dir)
                y += lengthdir_y(1, dir)
            }
            scrMoveSolidOff()
            image_speed = 0.1
        }
    }

} else {
    if !instance_exists(target) {
        weaponfind = 0 speed = 0
    } else {
        speed = 2
        direction = point_direction(x, y, target.x, target.y)
        image_speed = 0.2
        if place_meeting(x, y, target) {
            my_id = -123123

            if target.image_index = 0 {
                my_id = instance_create(x, y, enemyRandom) my_id.sprite_index = sprEWalkHK417
            }
            else if target.image_index = 1 {
                my_id = instance_create(x, y, enemyRandom) my_id.sprite_index = sprEWalkShotgun
            }

            else if target.image_index = 2 {
                my_id = instance_create(x, y, objEnemyMeleePatrol) my_id.sprite_index = sprEWalkClub
            }

            else if target.image_index = 3 {
                my_id = instance_create(x, y, objEnemyMeleePatrol) my_id.sprite_index = sprEWalkPipe
            }

            else if target.image_index = 4 {
                my_id = instance_create(x, y, objEnemyMeleePatrol) my_id.sprite_index = sprEWalkBat
            }

            else if target.image_index = 5 {
                my_id = instance_create(x, y, objEnemyMeleePatrol) my_id.sprite_index = sprEWalkKnife
            }

            else if target.image_index = 6 {
                my_id = instance_create(x, y, enemyRandom) my_id.sprite_index = sprEWalkDoubleBarrel
            }

            else if target.image_index = 7 {
                my_id = instance_create(x, y, enemyRandom) my_id.sprite_index = sprEWalkSilencer
            }

            else if target.image_index = 8 {
                my_id = instance_create(x, y, objEnemyDodger) my_id.sprite_index = sprEDodgerWalk
            }

            else if target.image_index = 18 {
                my_id = instance_create(x, y, objEnemyMeleeRandom) my_id.sprite_index = sprEWalkMachete
            }
            else if target.image_index = 26 {
                my_id = instance_create(x, y, enemyRandom) my_id.sprite_index = sprEWalkAK
            }

            else if target.image_index = 27 {
                my_id = instance_create(x, y, enemyRandom)
                my_id.sprite_index = sprEWalkHandgun
            }
            else if target.image_index = 34 {
                my_id = instance_create(x, y, objEnemyMeleeRandom) my_id.sprite_index = sprEWalkChain
            }
            else if target.image_index = 41 {
                my_id = instance_create(x, y, enemyRandom)
                my_id.sprite_index = sprEWalkThompson
            } else exit
            if instance_exists(target) my_id.ammo = target.ammo    
            //sound_ps(sndPickupWeapon)
            with target instance_destroy()
            with my_id {
                if scrMovingPlayerExists() scrChasePlayer(path, objPlayer.x, objPlayer.y)
            }        
            instance_destroy()

        }

        if !scrPlaceFree(x + hspeed * 3, y + vspeed * 3) {
            if !scrPlaceFree(x + hspeed * 3, y) hspeed = -hspeed
            if !scrPlaceFree(x, y + vspeed * 3) vspeed = -vspeed
            weaponfind = 0
        }

    }
}

//scrMoveSolidOff()
exit

