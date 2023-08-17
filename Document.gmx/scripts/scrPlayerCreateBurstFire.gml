//Begin guns.

if burststate = 0 {
    if ammo > 0 {
        image_angle = dir
        state = 1
        firecount = 0
        //alarm[1] = 4

        if sprite_index = sprPWalkAJM and global.automatic = 1 {
            wburst = 4
            if reload > 0 reload -= 1
            else {
                sprite_index = sprPAttackAJM
                image_speed = 1
                sound_ps(sndAJMBurst)
            }
        }
        
        /*if sprite_index = sprPWalkSuppressedMG and global.automatic = 1 {
            wburst = 7
            if reload > 0 reload -= 1
            else {
                sprite_index = sprPAttackSuppressedMG
                image_speed = 1
            }
        }*/
        
    }
}

