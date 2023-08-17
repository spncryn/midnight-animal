// Slashed.
if objPlayer.sprite_index = sprPAttackChainsaw
or objPlayer.sprite_index = sprPAttackCircularSaw
or objPlayer.sprite_index = sprPAttackAxe
or objPlayer.sprite_index = sprPAttackMachete
or objPlayer.sprite_index = sprPAttackLongSword1
or objPlayer.sprite_index = sprPAttackLongSword2
or objPlayer.sprite_index = sprPAttackKatanaH1
or objPlayer.sprite_index = sprPAttackKatanaH2
or objPlayer.sprite_index = sprPAttackLeviathan
or objPlayer.sprite_index = sprPAttackHalberdH
or objPlayer.sprite_index = sprPAttackHalberdV {

        objPlayer.melee_damage = 50 + round(random(50))

        if hit = 0 {
            alert = 1
            sound_ps(choose(sndCut1, sndCut2))
            instance_create(x, y, objCutImpact)
            slash = instance_create(x, y, objBlastImpact)
            slash.image_xscale = 0.3
            slash.image_yscale = image_xscale
            slash.image_angle = random(360)
            slash.direction = slash.image_angle
            hp -= objPlayer.melee_damage
            create_damage_melee(random(3), string(objPlayer.melee_damage), 1, x + choose(-random(24), random(24)), y - 5)
            global.combotime = 240
            global.combo += 1
            hit = 1
        }

        if hp <= 0 {
            drop_health(0, 0, 2)
            sound_ps(sndDrawKnife)
            sound_ps(choose(sndDismemberment1, sndDismemberment2, sndDismemberment3, sndDismemberment4))

            // Check if the enemy is armed.
            scrEnemyDropWeapon()

            // Destroy enemy.
            instance_destroy()

            // Points.
            global.myscore += 100
            global.combo += 1
            global.combotime = 240
            global.kills += 1

            objEffector.whitealpha = 1

            body = instance_create(x, y, objDeadBody)
            body.sprite_index = sprEDeadSlashedBottom
            body.direction = edir - 10 + random(20)
            body.image_angle = body.direction
            body.speed = 1 + random(1)
            body.friction = 0.15
            body.alarm[0] = 6
            body.image_index = floor(random(sprite_get_number(body.sprite_index)))

            //DECAPITATION 0 
            if body.image_index = 0 {
                global.shake = 12
                scrMeleeBlood(x, y)
                scrGoreCut(x, y, edir - 180, 0)

                // Create head.
                part = instance_create(x, y, objSeveredHead)
                part.direction = random(360)
                part.speed = 1 + random(2)

                // Assign a score.
                create_points("DECAPITATED +100")
            }

            //CUT IN HALF CLEAN 1 
            if body.image_index = 1 {
                scrMeleeBlood(x, y)
                scrGoreCut(x, y, edir - 180, 1)
                part = instance_create(body.x + lengthdir_x(22, edir), body.y + lengthdir_y(18, edir), objBodyPart)
                part.sprite_index = sprEDeadSlashedTop

                // Create lower half of body.
                part.direction = edir - 10 + random(20)
                part.speed = 3 + random(1)
                part.friction = 0.15
                part.image_index = 1
                part.alarm[0] = 6
                part.image_angle = part.direction

                // Assign a score.
                create_points("BISECTED +100")
            }

            //UPPER HALF CUT 2 
            if body.image_index = 2 {
                scrMeleeBlood(x, y)
                scrGoreCut(x, y, edir - 180, 0)
                part = instance_create(body.x + lengthdir_x(22, edir), body.y + lengthdir_y(18, edir), objBodyPart)
                part.sprite_index = sprEDeadSlashedTop

                // Create lower half of body.
                part.direction = edir - 10 + random(20)
                part.speed = 3 + random(1)
                part.friction = 0.15
                part.image_index = 2
                part.alarm[0] = 6
                part.image_angle = part.direction

                // Assign a score.
                create_points("BISECTED +100")
            }

            //CUT IN HALF w. EVISCERATION 3 
            if body.image_index = 3 {
                scrMeleeBlood(x, y)
                scrGoreCut(x, y, edir - 180, 1)

                // Create lower half of body.
                part = instance_create(body.x + lengthdir_x(22, edir), body.y + lengthdir_y(18, edir), objBodyPart)
                part.sprite_index = sprEDeadSlashedTop
                part.direction = edir - 10 + random(20)
                part.speed = 3 + random(1)
                part.friction = 0.15
                part.image_index = 3
                part.alarm[0] = 6
                part.image_angle = part.direction

                // Assign a score.
                create_points("BISECTED +100")
            }

            //CUT IN HALF w. SPINE 4
            if body.image_index = 4 {
                scrMeleeBlood(x, y)
                scrGoreCut(x, y, edir - 180, 1)
                part = instance_create(body.x + lengthdir_x(22, edir), body.y + lengthdir_y(18, edir), objBodyPart)
                part.sprite_index = sprEDeadSlashedTop

                // Create lower half of body.
                part.direction = edir - 10 + random(20)
                part.speed = 3 + random(1)
                part.friction = 0.15
                part.image_index = 4
                part.alarm[0] = 6
                part.image_angle = part.direction

                // Assign a score.
                create_points("BISECTED +100")
            }

            //R. ARM CUT 5 
            if body.image_index = 5 {
                scrMeleeBlood(x, y)
                scrGoreCut(x, y, edir - 180, 0)

                // Create right arm.
                part = instance_create(body.x + lengthdir_x(22, edir), body.y + lengthdir_y(18, edir), objBodyPart)
                part.sprite_index = sprEDeadSlashedTop
                part.direction = point_direction(objPlayer.x, objPlayer.y, x, y) - 45
                part.speed = 3 + random(1)
                part.friction = 0.15
                part.image_index = 5
                part.alarm[0] = 6
                part.image_angle = part.direction
                part.image_yscale = 1

                // Assign a score.
               create_points("DISMEMBERED +100")
            }

            //L. ARM CUT
            if body.image_index = 6 {
                scrMeleeBlood(x, y)
                scrGoreCut(x, y, edir - 180, 0)

                // Create left arm.
                part = instance_create(body.x + lengthdir_x(22, edir), body.y + lengthdir_y(18, edir), objBodyPart)
                part.sprite_index = sprEDeadSlashedTop
                part.direction = point_direction(objPlayer.x, objPlayer.y, x, y) + 45
                part.speed = 3 + random(1)
                part.friction = 0.15
                part.image_index = 6
                part.alarm[0] = 6
                part.image_angle = part.direction
                part.image_yscale = 1

                // Assign a score.
                create_points("DISMEMBERED +100")
            }

        }
    }
    /*
    if objPlayer.sprite_index = sprPAttackKatanaV {
        sound_ps(choose(sndDismemberment1, sndDismemberment2, sndDismemberment3, sndDismemberment4))
        scrMeleeBlood(x, y)
        scrGoreCut(x, y, edir - 180, 1)
        body.sprite_index = sprEDeadSplit
        body.direction = edir - 10 + random(20)
        body.image_angle = body.direction
        body.speed = 1
        body.friction = 0.3
        body.alarm[0] = 6
        body.image_index = floor(random(sprite_get_number(body.sprite_index)))
    }
