angle = direction

if scrEnemyIsUnarmed(sprite_index) scrGoGetWeapon() else {
    if alert = 0 {
        if instance_exists(objPlayer) scrMeleeSearch(objPlayer.x, objPlayer.y, 4)
        if alertwait > -1 {
            alertwait -= 1
            if alertwait = 0 {
                path_end() alert = 1
            }
        }
        if scrIsSearching(sprite_index) {
            speed = 0 image_speed = 0.15 exit
        }
        if scrEnemyIsAttacking(sprite_index) {
            image_speed = 1
        }
        if point_distance(x, y, startx, starty) > 4 scrReturn(path)

    }
    if !instance_exists(objPlayer) {
        alert = 0 scrMoveSolidOff() exit
    }
    if alert < 2 and alert > 0 {
        scrAttack(objPlayer.x, objPlayer.y, 10, 4)
        if reload > 0 reload -= 1
        else {
            if point_distance(x, y, objPlayer.x, objPlayer.y) < 18 {
                sound_ps(choose(sndSwing1, sndSwing2))
                if scrIsSearching(sprite_index) sprite_index = scrStopSearch(sprite_index)
                sprite_index = scrGetAttack(sprite_index)
                image_index = 1
                image_speed = 1
                reload = 10
            }
        }
    }
    if alert = 2 {
        scrChasePlayer(path, objPlayer.x, objPlayer.y) alert = 3
    }
    if alert = 3 {
        scrMeleeChaseSearch(objPlayer.x, objPlayer.y, 4)
    }
}
scrMoveSolidOff()

if speed > 0 image_speed = speed * 0.1
if path_index >= 0 image_speed = path_speed * 0.1

