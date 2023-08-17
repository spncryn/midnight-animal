if objPlayer.sprite_index = sprPAttackPunch
or objPlayer.sprite_index = sprPAttackBag
or objPlayer.sprite_index = sprPAttackDrill
or objPlayer.sprite_index = sprPAttackUnarmed1
or objPlayer.sprite_index = sprPAttackUnarmed2
or objPlayer.sprite_index = sprPAttackDrill {
    
    knockback(16)
    if objPlayer.sprite_index = sprPAttackDrill
    objPlayer.melee_damage = 50 + round(random(50))

    if objPlayer.sprite_index = sprPAttackPunch
    or objPlayer.sprite_index = sprPAttackBag
    or objPlayer.sprite_index = sprPAttackDrill
    or objPlayer.sprite_index = sprPAttackUnarmed1
    or objPlayer.sprite_index = sprPAttackUnarmed2
    objPlayer.melee_damage = 20 + random(20)

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
        create_points("INCAPACITATED +100")
        global.combotime = 240
        global.combo += 1
        global.myscore = 100
    }

}
