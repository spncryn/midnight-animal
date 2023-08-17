// If the player isn't present, do nothing.
if !scrMovingPlayerExists() exit

// Tie the speed of the enemy animation to the enemy's walking speed.
image_speed = speed * 0.1

// Move away from player.
scrMoveFromPlayer()

// If the enemy is flashed...
if affected = 1 scrEnemyStatusEffects() else {

    // 0 - If the enemy no longer can detect the player...
    if alert = 0 {
        
        // If the enemy is already where it originally was, do nothing; otherwise, return to original location via the same path.
        if x = startx and y = starty nothing = 1 else scrReturnToStart(path)
    }
    
    // Delay between alert states.
    if alertwait > -1 {
    
        // Alert the enemy when the delay expires.
        if alertwait = 0 {
            path_end() alert = 1
        }
        alertwait -= 1
    }
    
    // Behaviour while searching for the player.
        if scrIsSearching(sprite_index) { 
            image_speed = 0.2 
            speed = 0 
            exit 
        }
        
    // Reset path at the end of the path.
    if path_position = 1 {
        path_end() alert = 0 lookreload = 0
    }
    
    // Delay between detection.
    if lookreload > 0 lookreload -= 1
    else {
        seen = scrLook(objPlayer.x, objPlayer.y, 12)
        if seen = 0 {
            path_end() alert = 1
        }
        if seen = 2 {
            path_end() alert = 2
        }
        if seen = 1 and alert > 0 {
            if alert < 3 {
                alert = 4 chasereload = 0
            }
        }
        lookreload = 2
    }
    
    // If the player is dead, end pathing.
    if instance_exists(objPlayerDead) {
        alert = 0 findwall = 1 path_end() speed = sign(speed)
    }
    
    // 1 - If the enemy sees the player, charge at the player.
    if alert < 2 and alert > 0 scrCharge(objPlayer.x, objPlayer.y, 10)
    
    // 2 - If the enemy reaches within certain distance of the player, aim at the player.
    if alert = 2 scrAim(objPlayer.x, objPlayer.y)
    
    // 3 - If the enemy loses sight of the player and the path has ended, reset the alert.
    if alert = 3 and path_index <= 0 alert = 4
    
    // 4 - If the enemy loses sight of the player but is still active, chase the player.
    if alert >= 4 {
        if chasereload > 0 chasereload -= 1
        else {
            chasereload = 2
            if alert >= 4 scrChaseSearch(path, objPlayer.x, objPlayer.y) 
            if alert > 3 alert -= 1
        }
    }
    
    if path_index >= 0 image_speed = path_speed * 0.1 else image_speed = speed * 0.1
}
if scrIsShooting(sprite_index) image_speed = 0.5

// Turn off 'soft' collisions.
scrMoveSolidOff()
