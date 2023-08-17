var dist;

// dist is used to calculate the distance from the enemy to the player.
dist = point_distance(x, y, argument0, argument1)

// If the distance is greater than 240 pixels, chase the player.
if dist > 240 scrChasePlayer(path, objPlayer.x, objPlayer.y) else {

    // Otherwise, stop.
    speed = 0
    
    // If the distance is greater than 80 pixels, rotate towards the player.
    //if dist > 80 angle = point_direction(x, y, objPlayer.x, objPlayer.y) else 
    angle = scrRotate(angle, point_direction(x, y, argument0, argument1), 20)
    
    // If the enemy has ammo...
    if ammo > 0 {
        
        // Time between shots.
        if reload > 0 reload -= 1 else {
            
            // If the enemy is searching for the player, stop searching for the player...
            if scrIsSearching(sprite_index) sprite_index=scrStopSearch(sprite_index)
            
            // ...and start shooting.
            scrEnemyShoot()
        }
        
        // Aggressively move towards the player.
        scrChargeSearch(objPlayer.x,objPlayer.y,4)
    } else {
        if dropped = 0 {
            // ...otherwise, drop the current weapon (empty)...
            scrEnemyDropWeapon()
            
            // ...and pull out a knife (accompanied with sound).
            sprite_index = sprEWalkKnife
            sound_ps(sndDrawKnife)
            dropped = 1
        }
    }
}
