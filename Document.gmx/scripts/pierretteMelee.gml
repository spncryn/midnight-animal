if objPlayer.sprite_index = pierretteBashShield {

    objPlayer.melee_damage = 50
    
    if hit = 0 {
        sound_ps(sndShieldHit)
        sound_ps(sndPunchImpact)
        sound_ps(sndBonesBreak)
        sound_ps(sndTaser)
        knockback(10)
        sleep(50)
        global.shake = 8
        
        instance_create(x, y, objElectricity)
        instance_create(x, y, objMuzzleSmoke)
        instance_create(x, y, objBlastImpact)
        
        hp -= objPlayer.melee_damage
        create_damage_melee(random(3), string(objPlayer.melee_damage), 1, x + choose(-random(24), random(24)), y - 5)
        create_damage_general(random(3), global.c_shock, "3", 1, x + choose(-random(24), random(24)), y - 5)

        objEffector.hitalpha = 1
        sound_ps(sndHitMarker)
        eflash = true
        hit_enemy = true
        alarm[1] = 5
        
        shocked = 1 
        global.combotime = 240
        global.combo += 1
        hit = 1
    } 
    
    if hp <= 0 scrEnemyGetShocked()
}

