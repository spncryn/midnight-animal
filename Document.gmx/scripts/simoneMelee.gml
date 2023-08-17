if objPlayer.sprite_index = simonePistolWhip and global.character = 3 {

    objPlayer.melee_damage = 50
    
    if hit = 0 {
        sound_ps(choose(sndPunch, sndPunch1, sndPunch2, sndPunch3))
        sound_ps(sndPunchImpact)
        sound_ps(sndBonesBreak)
        knockback(objPlayer.melee_damage / 10)
        sleep(50)
        global.shake = 8
        instance_create(x, y, objMuzzleSmoke)
        instance_create(x, y, objBlastImpact)
        hp -= objPlayer.melee_damage
        create_damage_melee(random(3), string(objPlayer.melee_damage), 1, x + choose(-random(24), random(24)), y - 5)
        global.combotime = 240
        global.combo += 1
        hit = 1
    } 
    
    if hp <= 0 {
            
        objEffector.whitealpha = 1
            
            // Check if the enemy is armed.
            scrEnemyDropWeapon()
        
            // Destroy enemy.
            instance_destroy()
        
            // Create health.
            drop_health(0, 0, 1)
            
        global.combotime = 240
        global.combo += 1
        global.myscore += 50
        
        body = instance_create(x, y, objEnemyGiveUp)
        body.direction = edir
        body.speed = 0
        body.image_angle = body.direction
            
            // Assign a score.
           create_points("SUBMISSION +100")
    } 
}

