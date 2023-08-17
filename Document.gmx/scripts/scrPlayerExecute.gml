if reload > 0 exit
image_xscale = 2
image_yscale = 2
lastweapon = scrCurrentWeaponExt(objPlayer.sprite_index)
lastammo = objPlayer.ammo
global.state = 0

if scrIsWalking(sprite_index) {

    with objEnemyGiveUp {
        
        // PIERRETTE: Pacification.
        if global.character = 2 {
            if place_meeting(x, y, objPlayer) {
                objEffector.blackalpha = 1
                objEffector.letterbox = true
                body = instance_create(x, y, objDeadBody)
                body.sprite_index = sprECuffed
                body.image_speed = 0
                body.image_index = round(random(sprite_get_number(body.sprite_index)))
                body.image_angle = image_angle
                body.direction = body.image_angle
                instance_destroy()
                
                create_points("RESTRAINED +50")
                global.myscore += 50
            }
        }
        
        // SIMONE: Submission.
        if global.character = 3 {
            if place_meeting(x, y, objPlayer) and objPlayer.shield = 0 {
                with objPlayer {
                    sprite_index = simoneWalkShield
                    shield = 1
                }  
                objEffector.letterbox = true 
                instance_destroy()
            }
        }
    }

    with objStunnedBody {
    
        // PIERRETTE: Pacification.
        if global.character = 2 {
            if place_meeting(x, y, objPlayer) {
                objEffector.blackalpha = 1
                objEffector.letterbox = true
                body = instance_create(x, y, objDeadBody)
                body.sprite_index = sprECuffed
                body.image_speed = 0
                body.image_index = round(random(sprite_get_number(body.sprite_index)))
                body.image_angle = image_angle
                body.direction = body.image_angle
                instance_destroy()
                
                create_points("RESTRAINED +50")
                global.myscore += 50
            }
        }
    }
    // JOHN: Knocked out.
    with objKnockedOut {
        if place_meeting(x, y, objPlayer) and global.state = 0 and global.character = 0 {
            global.state = 1
            px = objPlayer.x
            py = objPlayer.y

            // Leaning executions.
            if sprite_index = sprEGetUpLean {

                // Chainsaw kill lean.
                if scrCurrentWeaponExt(objPlayer.sprite_index) = 31 kill = instance_create(x, y, objPKillChainsawLean)
                else {
                    kill = instance_create(x, y, choose(objPKillLean, objPKillLeanNonlethal))
                }

                kill.image_angle = angle
                kill.px = px
                kill.py = py
                kill.ammo = objPlayer.ammo
                objEffector.letterbox = true
                instance_destroy()
            } else {
            
                // Normal executions.
                kill = instance_create(x, y, scrGetExecution(objPlayer.sprite_index))
                kill.image_angle = angle
                kill.px = px
                kill.py = py
                objEffector.letterbox = true 
                instance_destroy()
                
                // Blunt kills.
                if kill.object_index = objPBluntKill {

                    switch (scrCurrentWeaponExt(objPlayer.sprite_index)) {
                        case 4: kill.sprite_index = sprPBatKill break;
                        case 17: kill.sprite_index = sprPKillCrowbar break;
                        case 44: kill.sprite_index = sprPKillGuitar break;
                        case 39: kill.sprite_index = sprPKillArm break;
                        case 40: kill.sprite_index = sprPKillBust break;
                        case 75: kill.sprite_index = sprPPipeKill break;
                        case 24: kill.sprite_index = sprPKillPot break;
                        case 22: kill.sprite_index = sprPKillPan break;
                    }
                }
            }
        }
    }

    if global.state = 1 instance_destroy()
}

image_xscale = 1 
image_yscale = left
