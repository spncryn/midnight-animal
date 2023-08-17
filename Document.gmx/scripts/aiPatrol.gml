if !scrMovingPlayerExists() exit

// If the enemy is flashed...
if affected = 1 scrEnemyStatusEffects() else {
    if alert = 0 scrPatrol()
    if alertwait > -1 {
            if alertwait = 0 {
                path_end() alert = 1
            }
            alertwait -= 1
        }
        if scrIsSearching(sprite_index) {image_speed=0.2 speed=0 exit}
    if path_position = 1 {
        path_end() alert = 0 lookreload = 0
    }
    if lookreload > 0 lookreload -= 1
    else {
        seen = scrLook(objPlayer.x, objPlayer.y, 12)
        if seen = 0 alert = 1
        if seen = 2 alert = 2
        if seen = 1 and alert > 0 {
            if alert < 3 {
                alert = 5 chasereload = 0
            }
        }
        lookreload = 15
    }
    if instance_exists(objPlayerDead) {
        alert = 0 findwall = 1 path_end() speed = sign(speed)
    }
    if alert < 2 and alert > 0 scrCharge(objPlayer.x, objPlayer.y, 4)
    if alert = 2 scrAim(objPlayer.x, objPlayer.y)
    if alert = 3 and path_index <= 0 alert = 4
    if alert >= 4 {
        if chasereload > 0 chasereload -= 1
        else {
            chasereload = 20
            if alert >= 4 scrChaseSearch(path, objPlayer.x, objPlayer.y) if alert > 3 alert -= 1
        }
    }
    if path_index >= 0 image_speed = path_speed * 0.1
    else image_speed = speed * 0.1
}
if scrIsShooting(sprite_index) image_speed = 0.5
scrMoveSolidOff()
