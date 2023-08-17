if global.gibfest = 1 scrEnemyDieExplode()
else {

    energie -= 2
    flash = true

    image_xscale = 1.5
    image_yscale = 1.5

    with objEffector alarm[1] = 5

    image_xscale = 1
    image_yscale = 1
    edir = other.direction

    test = 0

        
        // Check if armed.
        scrEnemyDropWeapon()
        
            // ...assign a score.
        global.myscore += 100
        global.combo += 1
        global.combotime = 240

        create_points("SKEWERED +100")

        // Create a dead body.
        global.deathshake = 10
        impact = instance_create(x, y, objBlastImpact)

        DeadBody = instance_create(x, y, objDeadBody)
        DeadBody.direction = edir
        DeadBody.image_angle = DeadBody.direction
        DeadBody.speed = 4 + random(1)
        if DeadBody.speed > 4.5 DeadBody.speed = 4.5
        DeadBody.friction = 0.2
        DeadBody.image_index = floor(random(19))
        DeadBody.alarm[0] = 6

        sound_ps(choose(sndDismemberment1, sndDismemberment2, sndDismemberment3, sndDismemberment4))
        DeadBody.sprite_index = sprEDeadSlashedBottom
        DeadBody.direction = edir - 10 + random(20)
        DeadBody.image_angle = DeadBody.direction
        DeadBody.speed = 1 + random(1)
        DeadBody.friction = 0.15
        DeadBody.alarm[0] = 6
        DeadBody.image_index = floor(random(sprite_get_number(DeadBody.sprite_index)))

        //DECAPITATION 0 
        if DeadBody.image_index = 0 {
            global.shake = 12
            scrMeleeBlood(x, y)
            scrGoreCut(x, y, edir - 180, 0)

            // Create head.
            part = instance_create(x, y, objSeveredHead)
            part.direction = random(360)
            part.speed = 1 + random(2)
        }

        //CUT IN HALF CLEAN 1 
        if DeadBody.image_index = 1 {
            scrMeleeBlood(x, y)
            scrGoreCut(x, y, edir - 180, 1)
            part = instance_create(DeadBody.x + lengthdir_x(22, edir), DeadBody.y + lengthdir_y(18, edir), objBodyPart)
            part.sprite_index = sprEDeadSlashedTop

            // Create lower half of body.
            part.direction = edir - 10 + random(20)
            part.speed = 3 + random(1)
            part.friction = 0.15
            part.image_index = 1
            part.alarm[0] = 6
            part.image_angle = part.direction
        }

        //UPPER HALF CUT 2 
        if DeadBody.image_index = 2 {
            scrMeleeBlood(x, y)
            scrGoreCut(x, y, edir - 180, 0)
            part = instance_create(DeadBody.x + lengthdir_x(22, edir), DeadBody.y + lengthdir_y(18, edir), objBodyPart)
            part.sprite_index = sprEDeadSlashedTop

            // Create lower half of body.
            part.direction = edir - 10 + random(20)
            part.speed = 3 + random(1)
            part.friction = 0.15
            part.image_index = 2
            part.alarm[0] = 6
            part.image_angle = part.direction
        }

        //CUT IN HALF w. EVISCERATION 3 
        if DeadBody.image_index = 3 {
            scrMeleeBlood(x, y)
            scrGoreCut(x, y, edir - 180, 1)

            // Create lower half of body.
            part = instance_create(DeadBody.x + lengthdir_x(22, edir), DeadBody.y + lengthdir_y(18, edir), objBodyPart)
            part.sprite_index = sprEDeadSlashedTop
            part.direction = edir - 10 + random(20)
            part.speed = 3 + random(1)
            part.friction = 0.15
            part.image_index = 3
            part.alarm[0] = 6
            part.image_angle = part.direction

        }

        //CUT IN HALF w. SPINE 4
        if DeadBody.image_index = 4 {
            scrMeleeBlood(x, y)
            scrGoreCut(x, y, edir - 180, 1)
            part = instance_create(DeadBody.x + lengthdir_x(22, edir), DeadBody.y + lengthdir_y(18, edir), objBodyPart)
            part.sprite_index = sprEDeadSlashedTop

            // Create lower half of body.
            part.direction = edir - 10 + random(20)
            part.speed = 3 + random(1)
            part.friction = 0.15
            part.image_index = 4
            part.alarm[0] = 6
            part.image_angle = part.direction
        }

        //R. ARM CUT 5 
        if DeadBody.image_index = 5 {
            scrMeleeBlood(x, y)
            scrGoreCut(x, y, edir - 180, 0)

            // Create right arm.
            part = instance_create(DeadBody.x + lengthdir_x(22, edir), DeadBody.y + lengthdir_y(18, edir), objBodyPart)
            part.sprite_index = sprEDeadSlashedTop
            part.direction = point_direction(objPlayer.x, objPlayer.y, x, y) - 45
            part.speed = 3 + random(1)
            part.friction = 0.15
            part.image_index = 5
            part.alarm[0] = 6
            part.image_angle = part.direction
            part.image_yscale = 1
        }

        //L. ARM CUT
        if DeadBody.image_index = 6 {
            scrMeleeBlood(x, y)
            scrGoreCut(x, y, edir - 180, 0)

            // Create left arm.
            part = instance_create(DeadBody.x + lengthdir_x(22, edir), DeadBody.y + lengthdir_y(18, edir), objBodyPart)
            part.sprite_index = sprEDeadSlashedTop
            part.direction = point_direction(objPlayer.x, objPlayer.y, x, y) + 45
            part.speed = 3 + random(1)
            part.friction = 0.15
            part.image_index = 6
            part.alarm[0] = 6
            part.image_angle = part.direction
            part.image_yscale = 1

        }

        // Destroy the enemy object.
        instance_destroy()
    }

