// Exit if player is dead.
if !scrMovingPlayerExists() exit

// Stumbling behaviour.
if sprite_index = sprEStumble {
    scrMoveSolidOn()
    if !scrPlaceFree(x + hspeed * 2, y) hspeed = 0
    if !scrPlaceFree(x, y + vspeed * 2) vspeed = 0
    scrMoveSolidOff()
    exit
}

// Cap the enemy's movement based on room boundaries.
if x < 0 hspeed = abs(hspeed)
if x > room_width hspeed = -abs(hspeed)
if y < 0 vspeed = abs(vspeed)
if y > room_height vspeed = -abs(vspeed)

// Turn on collision detection.
scrMoveSolidOn()

// Turn around if something is in the way.
if !scrPlaceFree(x + hspeed * 3, y + vspeed * 3) {
    if !scrPlaceFree(x + hspeed * 3, y) hspeed = -hspeed
    if !scrPlaceFree(x, y + vspeed * 3) vspeed = -vspeed
}

// Determine pathing behaviour.
if path_index > 0 {

    // Speed of animation on path.
    image_speed = 0.2

    // If the enemy has reached the end of the path, end the path.
    if path_position = 1 path_end()
}

// Turn off collision detection. 
scrMoveSolidOff()

// If there is no player object, do not alert the enemy.
if !instance_exists(objPlayer) {
    alert = 0 speed = 0 exit
}

scrRegisterHit()

// Normalise HP.
hp_norm = (hp / max_hp) * 100

// Fade in healthbar if damaged.
if hp < max_hp {
    if hp_alpha < 1 hp_alpha += 0.25
    else hp_alpha = 1
}

current = sprite_index
