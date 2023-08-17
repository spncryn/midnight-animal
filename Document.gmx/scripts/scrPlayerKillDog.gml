/*
with objDog {
    edir = point_direction(objPlayer.lastx, objPlayer.lasty, x, y)
    if place_meeting(x, y, objPlayer) or place_meeting(x + global.spacex, y + global.spacey, objPlayer) {
        mask_index = sprWeaponMask
        SteamIncStat("Dogs", 1)

        //DOG BLUNT KILL
        if objPlayer.sprite_index = sprPAttackClub
        or objPlayer.sprite_index = sprPAttackBat
        or objPlayer.sprite_index = sprPAttackCrowbar
        or objPlayer.sprite_index = sprPAttackPan
        or objPlayer.sprite_index = sprPAttackPot
        or objPlayer.sprite_index = sprPAttackSledgeHammer
        or objPlayer.sprite_index = sprPigButcherAttack
        or objPlayer.sprite_index = sprPAttackPipe
        or objPlayer.sprite_index = sprPAttackPool
        or objPlayer.sprite_index = sprPAttackChain
        or objPlayer.sprite_index = sprPAttackBrick
        or objPlayer.sprite_index = sprPAttackHammer
        or objPlayer.sprite_index = sprPAttackWrench
        or objPlayer.sprite_index = sprPAttackBottle
        or objPlayer.sprite_index = sprPAttackSkateboard
        or objPlayer.sprite_index = sprPAttackBust
        or objPlayer.sprite_index = sprPAttackArm
        or objPlayer.sprite_index = sprPAttackGuitar {
            sound_ps(choose(sndHit, sndHit1, sndHit2, sndHit3))
            sound_ps(choose(sndPunch, sndPunch1, sndPunch2, sndPunch3))
            scrMeleeBlood(x, y)
            global.shake = 18
            my_id = instance_create(x, y, objDeadBody)
            my_id.sprite_index = sprDogDeadBlunt
            my_id.image_index = floor(random(2))
            my_id.image_angle = edir - 10 + random(20)
            my_id.direction = my_id.image_angle
            my_id.speed = 1.5 + random(1)
        } else if global.style = 2 and 
        (objPlayer.sprite_index = sprPAttackPunch 
        or objPlayer.sprite_index = sprPAttackUnarmed1
        or objPlayer.sprite_index = sprPAttackUnarmed2) {
            sound_ps(sndDoorHit)
            sound_ps(choose(sndPunch, sndPunch1, sndPunch2, sndPunch3))
            my_id = instance_create(x, y, objDeadBody)
            my_id.sprite_index = sprDogDeadNonlethal
            my_id.image_index = floor(random(2))
            my_id.image_angle = edir - 10 + random(20)
            my_id.direction = my_id.image_angle
            my_id.speed = 1.5 + random(1)
        } else {
            //DOG SLASH KILL
            sound_ps(choose(sndCut1, sndCut2));
            sound_ps(choose(sndHit, sndHit1, sndHit2, sndHit3))
            global.shake = 14
            
            //Upper half.
            my_id = instance_create(x, y, objDeadBody)
            my_id.sprite_index = sprDogDeadPieces
            my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y) - 5 + random(10)
            my_id.speed = 3 + random(1)
            my_id.friction = 0.15
            death = choose(0, 2)
            my_id.image_index = 0 + death
            my_id.image_angle = my_id.direction
            scrMeleeBlood(x, y)

            //Lower half.
            partdog = instance_create(x, y, objDogPart)
            partdog.sprite_index = sprDogDeadPieces
            partdog.direction = point_direction(objPlayer.x, objPlayer.y, x, y) - 5 + random(10)
            partdog.speed = 1 + random(1)
            partdog.friction = 0.15
            partdog.image_index = 1 + death
            partdog.image_angle = my_id.direction
            scrMeleeBlood(x, y)
        }
        instance_destroy()
    }
}
*/
