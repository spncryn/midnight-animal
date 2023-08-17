// Handle unarmed attacks.
if sprite_index = sprPAttackPunch 
or sprite_index = sprPAttackBag 
or sprite_index = sprPAttackDrill 
or sprite_index = sprPAttackUnarmed1
or sprite_index = sprPAttackUnarmed2
or sprite_index = sprPAttackDrill {

    lastx = x
    lasty = y
    global.spacex = lengthdir_x(24, dir)
    global.spacey = lengthdir_y(24, dir)
    //x += global.spacex
    //y += global.spacey

    global.my_id = id
    
    // Hit enemies.
    with objEnemy {
        
        // Check to see if the enemy can be hit.
        if scrCantGetHit(object_index) valid = 0 else valid = 1
        
        // Check collision.
        if //place_meeting(x, y, objPlayer) or 
        place_meeting(x - global.spacex, y - global.spacey, objPlayer) and valid = 1 {
        
            // Set mask of the sprite.
            if scrCollisionLineExt(x, y, objPlayer.lastx, objPlayer.lasty, 4) {
                scrMoveSolidOff() mask_index = sprMask objPlayer.x = objPlayer.lastx objPlayer.y = objPlayer.lasty exit
            }
            //mask_index = sprMask
            
            // Set direction relative to player.
            edir = point_direction(objPlayer.lastx, objPlayer.lasty, x, y)
            
            if sprite_index = sprPAttackDrill objPlayer.melee_damage = 50 + round(random(50))
            else objPlayer.melee_damage = 10 + round(random(10))
            
            if hit = 0 {
                alert = 1
                sound_ps(choose(sndPunch, sndPunch1, sndPunch2, sndPunch3))
                sound_ps(sndPunchImpact)
                sound_ps(sndBonesBreak)
                sleep(60)
                global.shake = 8
                instance_create(x, y, objMuzzleSmoke)
                instance_create(x, y, objBlastImpact)
                hp -= objPlayer.melee_damage
                create_damage_melee(random(3), string(objPlayer.melee_damage), 1, x + choose(-random(24), random(24)), y - 5)
                hit = 1
                global.combotime = 240
                global.combo += 1
            } 

            if hp <= 0 {
                instance_destroy()
                objEffector.whitealpha = 1
                    
                    // Check if the enemy is armed.
                    scrEnemyDropWeapon()
                
                    // Destroy enemy.
                    instance_destroy()

                    scrEnemyGetKnockedOut(object_index, edir - 10 + random(20))  
            
                    // Assign a score.
                    create_points("INCAPACITATION +50")
            } 
        }
    }
    x = lastx
    y = lasty
}
