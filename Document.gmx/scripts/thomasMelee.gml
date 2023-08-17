if scrIsSwinging(objPlayer.sprite_index) and global.character = 1 {

    if objPlayer.sprite_index = thomasStrikeR1
    or objPlayer.sprite_index = thomasStrikeR2
    or objPlayer.sprite_index = thomasStrikeR3
    or objPlayer.sprite_index = thomasStrikeR4
    objPlayer.melee_damage = 33 + round(random(50))
    
    else if objPlayer.sprite_index = thomasStrikeL1
    or objPlayer.sprite_index = thomasStrikeL2
    or objPlayer.sprite_index = thomasStrikeL3
    or objPlayer.sprite_index = thomasStrikeL4
    objPlayer.melee_damage = 150
    
    if hit = 0 {
        sound_ps(choose(sndPunch, sndPunch1, sndPunch2, sndPunch3))
        sound_ps(sndPunchImpact)
        sound_ps(sndBonesBreak)
        sleep(50)
        knockback(objPlayer.melee_damage / 15)
        global.shake = 8
        instance_create(x, y, objMuzzleSmoke)
        instance_create(x, y, objBlastImpact)
        hp -= objPlayer.melee_damage
        create_damage_melee(random(3), string(objPlayer.melee_damage), 1, x + choose(-random(24), random(24)), y - 5)
        global.combotime = 240
        global.combo += 1
        global.myscore += 100
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
            
            create_money()
            
        global.combotime = 240
        global.combo += 1
        
        body = instance_create(x, y, objDeadBody)
        body.direction = edir
        body.speed = 1.5 + random(1)
        body.image_angle = body.direction
            
        if round(random(3)) = 2 {
            body.sprite_index = choose(sprEHurt1, sprEHurt2, sprEHurt3)
            body.image_index = 0
            body.image_speed = 0.15
            body.speed = 1 + random(2)
        } else {
            body.sprite_index = sprEHurtBlunt
            body.direction = edir - 10 + random(20)
            body.image_angle = body.direction
            body.speed = 1 + random(2)
            body.image_index = 4 + floor(random(11))             
        }
        
        // Assign a score.
        create_points("KNOCKOUT +100")
            
         /*if objPlayer.sprite_index = thomasStrike6 {
            global.shake = 11
            sound_ps(choose(sndPunch, sndPunch1, sndPunch2, sndPunch3))
            sound_ps(sndPunchImpact)
            sound_ps(sndBonesBreak)
            instance_create(x, y, objHitImpact)
            instance_create(x, y, objMuzzleSmoke)
            body.sprite_index = sprEKnockedBack
            body.speed = 4.5
        }*/
    } 
}

