// Check to see if player is attacking.
if scrIsSwinging(sprite_index) {

    if scrCurrentWeaponExt(sprite_index) = 79 {
    
        // Glaive.
        global.spacex = lengthdir_x(50, dir)
        global.spacey = lengthdir_y(50, dir)
    } else {
        global.spacex = lengthdir_x(12, dir)
        global.spacey = lengthdir_y(12, dir)
    }

    global.deathshake = 10

    with objEnemy {

        // Check collision.
        if place_meeting(x, y, objPlayer) or place_meeting(x - global.spacex, y - global.spacey, objPlayer) {

            if hit_enemy = false {

                // Normal enemies.                
                global.shake = 12 + random(4)
                sound_ps(sndHitMarker)
                objEffector.hitalpha = 1
                objEffector.hudflash = 10
                light = 20
                eflash = true
                hit_enemy = true
                alarm[1] = 5

                // Armed enemies.
                if global.gibfest = 1 scrEnemyDieExplode()
                else {

                    edir = point_direction(objPlayer.x, objPlayer.y, x, y)
                    switch (global.character) {
                        case 0:
                            scrPlayerAttackKnockOut() scrPlayerKillSlash() scrPlayerKillBlunt() scrPlayerKillCut() break;

                        case 1:
                            thomasMelee() break;

                        case 2:
                            pierretteMelee() break;

                        case 3:
                            simoneMelee() break;
                    }
                }
            }
        }
    }
}
