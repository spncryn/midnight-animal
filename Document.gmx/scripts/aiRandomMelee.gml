if !scrMovingPlayerExists() exit
if alert = 0 {
    if instance_exists(objPlayerDead) {
        seen = 1 alert = 0
    }
    if alertwait > -1 {
        if alertwait = 0 {
            path_end() alert = 1
        }
        alertwait -= 1
    }
    if scrIsSearching(sprite_index) {
        image_speed = 0.2 speed = 0 exit
    }
    if path_position = 1 {
        path_end() alert = 0
    }
    if lookreload > 0 lookreload -= 1
    else {
        seen = scrLook(objPlayer.x, objPlayer.y, 12)
        if seen = 0 {
            path_end() alert = 1
        }
        if seen = 2 {
            path_end() alert = 2
        }
        if seen == 1 and alert > 0 alert = 3
        lookreload = 15
    }
    if instance_exists(objPlayerDead) {
        alert = 0 path_end()
    }
}
if instance_exists(objPlayerDead) {
    alert = 0 path_end()
}
if alert < 2 and alert > 0 {
    scrAttack(objPlayer.x, objPlayer.y, 10, 4)
    if reload > 0 reload -= 1
    else {
        if point_distance(x, y, objPlayer.x, objPlayer.y) < 24 {
            sound_play(choose(sndSwing1, sndSwing2))
            if scrIsSearching(sprite_index) sprite_index = scrStopSearch(sprite_index)
            if !scrEnemyIsAttacking(sprite_index) {
                sprite_index = scrGetAttack(sprite_index)
                reload = 10
                image_speed = 0.5
            }
        }
    }
}
if alert = 2 {
    scrChasePlayer(path, objPlayer.x, objPlayer.y) alert = 3
}
if alert = 3 {
    scrMeleeChaseSearch(objPlayer.x, objPlayer.y, 4)
}
if path_index >= 0 image_speed = path_speed * 0.1
else image_speed = speed * 0.1

// Begin attacking player.
if scrEnemyIsAttacking(sprite_index) and!instance_exists(objPlayerDead) {
    angle = direction
    image_speed = 0.5
    
    // Damage player.
    if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objPlayer) or place_meeting(x, y, objPlayer) {
        global.my_id = id
        global.sprite = sprite_index
        with objPlayer {
            if global.blur = 0 global.blur = 20 else global.blur += 5
            with global.my_id {
                if _hit = 1 {
                    if _hitdelay > 0 _hitdelay -= 1
                    else {
                        _hit = 0
                        _hitdelay = 10
                    }
                }
            }
            if global.my_id._hit = 0 {
                damage_player_melee()
                global.my_id._hit = 1
            }
            if hp <= 0 scrPlayerDieMelee()
        }
        killed = 1
        speed = 0
    }
}
scrMoveSolidOff()

if scrEnemyIsAttacking(sprite_index) image_speed = 0.5
else image_speed = (speed + path_speed) * 0.1
