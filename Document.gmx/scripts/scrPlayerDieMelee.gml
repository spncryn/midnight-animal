// God mode.
if global.tgm = 1 exit

// Dodge melee.
if instance_exists(objPlayer) {
    if objPlayer.state_name = "Dash" exit
}

// Screen shake.
global.shake = 10

with objPlayer {
    
    // If the enemy's attack is nonlethal, no blood; otherwise, spawn blood.
    scrMeleeBlood(x, y) 

    // Create the player's body.
    my_id = instance_create(x, y, objPlayerDead) {

        // Blunt deaths.
        if global.my_id.sprite_index = sprEAttackClub
        or global.my_id.sprite_index = sprEAttackChain
        or global.my_id.sprite_index = sprEAttackBat
        or global.my_id.sprite_index = sprEAttackPipe {
            sound_ps(choose(sndHit, sndHit2, sndHit3, sndHit1))
        }

        // Slashed deaths.
        if global.my_id.sprite_index = sprEAttackKnife
        or global.my_id.sprite_index = sprEAttackMachete
        or global.my_id.sprite_index = sprEDodgerAttack {
            sound_ps(choose(sndCut1, sndCut2))
        }

        // Punched to death.
        if global.my_id.sprite_index = sprEFatAttack
        or global.my_id.sprite_index = sprEFatAttackLSD {
            sound_ps(choose(sndHit, sndHit2, sndHit3, sndHit1))
            sound_ps(choose(sndPunch, sndPunch1, sndPunch2, sndPunch3))
        }
    }
    
    // Play sound if killed by aluminium bat.
    if global.my_id.sprite_index = sprEAttackBat sound_ps(sndBatHit)
    
    // Destroy player object.
    instance_destroy()
}

