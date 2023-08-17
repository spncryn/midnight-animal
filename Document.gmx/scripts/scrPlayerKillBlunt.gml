if objPlayer.sprite_index = sprPAttackClub
or objPlayer.sprite_index = sprPAttackBat
or objPlayer.sprite_index = sprPAttackCrowbar
or objPlayer.sprite_index = sprPAttackPan
or objPlayer.sprite_index = sprPAttackPot
or objPlayer.sprite_index = sprPAttackSledgeHammer
or objPlayer.sprite_index = sprPAttackPipe
or objPlayer.sprite_index = sprPAttackPool
or objPlayer.sprite_index = sprPAttackChain
or objPlayer.sprite_index = sprPAttackBag
or objPlayer.sprite_index = sprPAttackSkateboard
or objPlayer.sprite_index = sprPAttackBust
or objPlayer.sprite_index = sprPAttackArm
or objPlayer.sprite_index = sprPAttackBrick
or objPlayer.sprite_index = sprPAttackGuitar
or objPlayer.sprite_index = sprPAttackHammer
or objPlayer.sprite_index = sprPAttackWrench
or objPlayer.sprite_index = sprPAttackBottle
or objPlayer.sprite_index = sprPAttackBong {
    
    if hit = 0 {
    
        if objPlayer.sprite_index = sprPAttackClub
        or objPlayer.sprite_index = sprPAttackBat
        or objPlayer.sprite_index = sprPAttackCrowbar 
        or objPlayer.sprite_index = sprPAttackArm
        or objPlayer.sprite_index = sprPAttackBrick
        or objPlayer.sprite_index = sprPAttackGuitar
        or objPlayer.sprite_index = sprPAttackHammer
        or objPlayer.sprite_index = sprPAttackWrench
        objPlayer.melee_damage = 40 + round(random(40))
        
        if objPlayer.sprite_index = sprPAttackPan
        or objPlayer.sprite_index = sprPAttackPot
        or objPlayer.sprite_index = sprPAttackPipe
        or objPlayer.sprite_index = sprPAttackPool
        or objPlayer.sprite_index = sprPAttackChain
        or objPlayer.sprite_index = sprPAttackBag
        or objPlayer.sprite_index = sprPAttackSkateboard
        or objPlayer.sprite_index = sprPAttackBottle
        objPlayer.melee_damage = 30 + random(30)
        
        if objPlayer.sprite_index = sprPAttackSledgeHammer
        objPlayer.melee_damage = 80 + random(80)
        
        if objPlayer.sprite_index = sprPAttackBottle
        or objPlayer.sprite_index = sprPAttackBust
        or objPlayer.sprite_index = sprPAttackBong
        objPlayer.melee_damage = 250
        
        knockback(objPlayer.melee_damage / 15)
        
        alert = 1
        sound_ps(choose(sndHit, sndHit1, sndHit2, sndHit3))
        sleep(50)
        
        if objPlayer.sprite_index = sprPAttackBat sound_ps(sndBatHit)
        if objPlayer.sprite_index = sprPAttackPan sound_ps(sndPanHit)   
        // Breakables.
        if objPlayer.sprite_index = sprPAttackBottle or objPlayer.sprite_index = sprPAttackBong {
            sound_ps(sndGlass1)
            objPlayer.sprite_index = sprPWalkUnarmed
        }
        if objPlayer.sprite_index = sprPAttackPool objPlayer.sprite_index = sprPWalkUnarmed
        //if sprite_index = sprPAttackScissors sprite_index = sprPWalkUnarmed
        //if sprite_index = sprPAttackBust sprite_index = sprPWalkUnarmed
        
        instance_create(x, y, objHitImpact)
        instance_create(x, y, objBlastImpact)
        hp -= objPlayer.melee_damage
        create_damage_melee(random(3), string(objPlayer.melee_damage), 1, x + choose(-random(24), random(24)), y - 5)
        global.combotime = 240
        global.combo += 1
        hit = 1
    }
    
    if hp <= 0 {
            objEffector.whitealpha = 1
            
            // Create health.
            drop_health(0, 0, 2)
            
            // Check if the enemy is armed.
            scrEnemyDropWeapon()
        
            // Destroy enemy.
            instance_destroy()
        
            body = instance_create(x, y, objDeadBody)
            body.direction = edir
            body.speed = 1.5 + random(1)
            body.image_angle = body.direction
            
        if round(random(10)) = 2 {
            body.sprite_index = sprEDeadCracked
            body.image_index = 0
            body.direction = edir - 10 + random(20)
            body.image_angle = body.direction
            sound_ps(sndBonesBreak)
            global.shake = 8
            scrMeleeBlood(x, y)
    
            // Assign a score.
            create_points("BRAINED +100")
        } else {
            body.sprite_index = sprEDeadBlunt
            body.direction = edir - 10 + random(20)
            body.image_angle = body.direction
            body.speed = 1 + random(2)
            body.image_index = 4 + floor(random(11))
            body.alarm[0] = 6
            scrMeleeBlood(x, y)
    
            // Assign a score.
            create_points("BLUNT TRAUMA +100")
        }
    }

}
