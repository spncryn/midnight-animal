// JOHN
if global.character = 0 {
    if sprite_index = sprPDrinkSoda {
        
        if image_index < 34 image_index += 0.25 else {
            sprite_index = global.current
            instance_create(x, y, objHealingEffect)
            can = instance_create(x, y, objSodaCan)
            can.speed = 2 + random(2)
            can.friction = 0.2
            can.direction = dir - 8 + random(16)
            can.image_angle = can.direction
            can.empty = true
            sound_ps(choose(sndCanDrop1, sndCanDrop2, sndCanDrop3, sndCanDrop4))
        }
        
        // Fully restore the player's health.
        if image_index > 13 and image_index < 14 {
            hp += max_hp / 3
            sound_ps(sndCollectHealth)
            create_health_number(floor(max_hp / 3), 1)
            global.screeneffect = 16
        }
        
        if image_index > 21 and image_index < 22 {
            hp += max_hp / 3
            sound_ps(sndCollectHealth)
            create_health_number(floor(max_hp / 3), 1)
            global.screeneffect = 16
        }
        
        if image_index > 25 and image_index < 26 {
            hp += max_hp / 3
            sound_ps(sndCollectHealth)
            create_health_number(floor(max_hp / 3), 1)
            global.screeneffect = 16
        }    
    }
}

// PIERRETTE
if global.character = 2 {
    if sprite_index = pierretteWalkSMG and ready = 1 {
        sprite_index = pierretteDeployShield
        image_index = 0 
        image_speed = 0.2
        sound_ps(sndDeployShield)
        ready = 2
    }
    
    if ready = 2 ready = 0
}

// SIMONE
if global.character = 3 {
    if sprite_index = simoneExecuteShield1 
    or sprite_index = simoneExecuteShield2 {
        aimon = 0
        if image_index < 16 image_index += 0.4 else {
            body = instance_create(x + lengthdir_x(26, dir), y, objDeadBody)
            if sprite_index = simoneExecuteShield2 {
                body.sprite_index = sprEDeadExecuted
                body.image_index = 0
            } else {
                body.sprite_index = sprEDeadHeadshot
                body.image_index = 13
            }
            objEffector.letterbox = false
            body.image_speed = 0
            body.direction=dir
            body.image_yscale= choose(1, -1)
            body.image_xscale = 1
            body.speed=1
            body.friction = 0.15
            body.image_angle=body.direction
            
            sprite_index = simoneWalk
            aimon = 1
            
            create_points("EXECUTION +100")
            global.myscore += 200
            global.combo += 1
            global.combotime = 240
            
            // Fully restore the player's health.
            hp += max_hp
            sound_ps(sndCollectHealth)
            create_health_number(max_hp, 1)
            global.screeneffect = 16
        }
        
        if image_index > 10 and image_index < 12 sound_ps(sndRevolverHammer)
        if image_index > 13 and dead = 0 {
            ammo -= 1
            sound_ps(choose(sndRevolver1, sndRevolver2, sndRevolver3))
            sound_ps(choose(sndCritical1, sndCritical2, sndCritical3))
            global.shake = 10

            repeat(20 + random(4)) {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), choose(objBrains, objBrainsSmall))
                my_id.direction = dir - 5 + random(10)
                my_id.image_angle = my_id.direction
                my_id.speed = 3 + random(3)
            }
            repeat(10) {
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objHeadPiece)
                my_id.direction = dir - 10 + random(20)
                my_id.speed = 3 + random(3)
            }
            dead = 1
        }
    }
    
    if sprite_index = simoneExecuteShieldSnap {
        aimon = 0
        if image_index < 5 image_index += 0.15 else {
            
            body = instance_create(x, y, objDeadBody)
            body.sprite_index = sprEDeadNeckSnapped
            body.image_speed = 0
            body.image_index = random(5)
            body.direction=dir
            body.image_yscale=choose(1, -1)
            body.image_xscale=1
            body.speed=1
            body.friction = 0.15
            body.image_angle=body.direction
            
            aimon = 1
            sprite_index = simoneWalk
            
            create_points("EXECUTION +100")
            global.myscore += 200
            global.combo += 1
            global.combotime = 240
            
            objEffector.letterbox = false
            
            // Fully restore the player's health.
            hp += max_hp
            sound_ps(sndCollectHealth)
            create_health_number(max_hp, 1)
            global.screeneffect = 16
        }
        
        if image_index > 2 and image_index < 4 and dead = 0 {
            sound_ps(sndBonesBreak)
            global.shake = 5
            dead = 1
        }
    }
}

// Reset.
if dead = 1 and scrIsWalking(sprite_index) dead = 0 
if shield = 1 and scrIsWalking(sprite_index) shield = 0 
