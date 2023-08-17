if objPlayer.sprite_index = sprPAttackKnife
or objPlayer.sprite_index = sprPAttackKnifeSlash1
or objPlayer.sprite_index = sprPAttackKnifeSlash2
or objPlayer.sprite_index = sprPAttackBottleBroken
or objPlayer.sprite_index = sprPAttackCleaver
or objPlayer.sprite_index = sprPAttackKatanaThrust
or objPlayer.sprite_index = sprPAttackKnifePistol {

    objPlayer.melee_damage = 30 + round(random(30))
    
    if hit = 0 {
        alert = 1
        sound_ps(choose(sndCut1, sndCut2))
        instance_create(x, y, objSlashImpact)
        instance_create(x, y, objCutImpact)
        hp -= objPlayer.melee_damage
        create_damage_melee(random(3), string(objPlayer.melee_damage), 1, x + choose(-random(24), random(24)), y - 5)
        global.combotime = 240
        global.combo += 1
        hit = 1
    }
    
    if hp <= 0 {
    
        // Create health.
        drop_health(0, 0, 2)
        
        body = instance_create(x, y, objDeadBody)
        
        body.direction = edir
        body.speed = 1.5 + random(1)
        body.image_angle = body.direction
        
        if round(random(5)) = 2 {
            body.sprite_index = sprEDieEviscerated
            body.image_index = 0
            create_points("EVISCERATED +100")
        } else {
            body.sprite_index = sprEDeadCut
            create_points("+100")
        }
    
        body.image_index = 5 + floor(random(12))
        body.direction = edir - 10 + random(20)
        body.image_angle = body.direction
        body.speed = 1 + random(2)
        body.alarm[0] = 6
        scrMeleeBlood(x, y)
    
        if body.image_index = 6 or body.image_index = 7 or body.image_index = 8 or body.image_index = 9 or body.image_index = 13 or body.image_index = 16
        scrMeleeBlood(x, y)
        scrGoreCut(x, y, edir - 180, 0)
        
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
    }
}
