//scrFootstepSounds()
if instance_exists(mnCharacterSelect) exit
    // Prevent the player from moving in a transition (contact with objTransitioner, objTeleporter).
if persistent = 1 exit

// Get the speed of the player depending on the current state.
scrGetPlayerSpeed()

// Initialise controls depending on input.
//if global.xbox = 1 scrPlayerMoveXbox() else scrPlayerMoveKeyboard()        
scrPlayerMoveKeyboard()

// Turn 'soft' solids off.
scrMoveSolidOn()

// Increase player speed gradually.
while (abs(myxspeed) + abs(myyspeed)) > myspeed + 2 {
    myxspeed *= 0.98
    myyspeed *= 0.98
}

// If the player is not moving, then the legs do not move either.
if abs(myxspeed) = 0 and abs(myyspeed) = 0 legindex = 0
else {

    // Otherwise, animate the legs relative to the speed.
    legindex += (abs(myxspeed) + abs(myyspeed)) * 0.1 * factor

    // If the player is walking, animate the legs relative to the speed.
    if scrIsWalking(sprite_index) image_index += (abs(myxspeed) + abs(myyspeed)) * 0.05
}

// Set the direction of the legs relative to the player's direction.
legdir = point_direction(0, 0, myxspeed, myyspeed)

// If the player is moving laterally...
if abs(myxspeed) > 0 {

    // If the space in front of the player laterally is open, move the player forward incrementally by myxspeed.
    if place_free(x + myxspeed, y) x += myxspeed
    else {

        // If the player is not moving longitudinally...
        if myyspeed = 0 {

            // ...'roll' the player around corners (basically prevents hard collisions, getting stuck on geometry).
            if place_free(x + myxspeed, y - 8) y -= myspeed
            else {
                if place_free(x + myxspeed, y + 8) y += myspeed
                else {
                    move_contact_solid(90 - sign(myxspeed) * 90, abs(myxspeed))
                    myxspeed = 0
                }
            }
        }
    }
}

// If the player is moving longitudinally...
if abs(myyspeed) > 0 {

    // If the space in front of the player longitudinally is open, move the player forward incrementally by myxspeed.
    if place_free(x, y + myyspeed) y += myyspeed
    else {

        //If the player is not moving laterally...
        if myxspeed = 0 {

            // ...'roll' the player around corners (basically prevents hard collisions, getting stuck on geometry).
            if place_free(x - 8, y + myyspeed) x -= myspeed
            else {
                if place_free(x + 8, y + myyspeed) x += myspeed
                else {
                    move_contact_solid(-sign(myyspeed) * 90, abs(myyspeed))
                    myyspeed = 0
                }
            }
        }
    }
}

// Bound the player within the room.
if x < -8 x = -8
if x > room_width + 8 x = room_width + 8
if y < -8 y = -8
if y > room_height + 8 y = room_height + 8

// Turn 'soft' solids off.
scrMoveSolidOff()
