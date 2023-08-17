if sprite_index = sprThomasDisarmHK417 {
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 2
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 0
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
        sound_ps(sndEjectClipRifle)
        global.combo += 1
        global.combotime = 240
    }
}

if sprite_index = sprThomasDisarmSilencer {
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 3
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 1
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
        sound_ps(sndEjectClip)
        global.combo += 1
        global.combotime = 240
    }
}

if sprite_index = sprPDisarmFAMAE {
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 3
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 2
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
        sound_ps(sndEjectClip)
        global.combo += 1
        global.combotime = 240
    }
}

if sprite_index = sprPDisarmMP5 {
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 3
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 3
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
        sound_ps(sndEjectClip)
        global.combo += 1
        global.combotime = 240
    }
}

if sprite_index = sprPDisarmSkorpion {
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 0
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 4
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
        sound_ps(sndEjectClip)
        global.combo += 1
        global.combotime = 240
    }
}

if sprite_index = sprThomasDisarmHandgun {
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 3
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 5
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
        sound_ps(sndEjectClip)
        global.combo += 1
        global.combotime = 240
    }
}

if sprite_index = sprThomasDisarmShotgun {
    if image_index >= 6 and image_index - image_speed < 6 {
        if ammo > 0 {
            ammo -= 1
            image_index = 0
            my_id = instance_create(x + lengthdir_x(5, dir - 5 * image_yscale), y + lengthdir_y(5, dir - 5 * image_yscale), objShell)
            my_id.sprite_index = sprShotgunShell
            my_id.image_angle = dir
            my_id.direction = dir - 90 * image_yscale - 20 + random(30)
            my_id.speed = 1 + random(3)
            sound_ps(sndInsertShell)
            global.combo += 1
            global.combotime = 240
        } else {
            my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
            my_id.image_index = 6
            my_id.speed = 3
            my_id.direction = random(360)
            my_id.image_angle = my_id.direction
        }
    }
}

if sprite_index = sprPDisarmMagnum {
    if image_index >= 8 and image_index - image_speed < 8 {
        if ammo > 0 {
            ammo -= 1
            image_index = 0
            my_id = instance_create(x + lengthdir_x(5, dir - 5 * image_yscale), y + lengthdir_y(5, dir - 5 * image_yscale), objShell)
            my_id.sprite_index = sprSniperShell
            my_id.image_angle = dir
            my_id.direction = dir - 90 * image_yscale - 20 + random(30)
            my_id.speed = 1 + random(3)
            global.combo += 1
            global.combotime = 240
        } else {
            my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
            my_id.image_index = 7
            my_id.speed = 3
            my_id.direction = random(360)
            my_id.image_angle = my_id.direction
        }
    }
}
if sprite_index = sprPDisarmUzi {
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 1
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 8
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
        sound_ps(sndEjectClip)
        global.combo += 1
        global.combotime = 240
    }
}

if sprite_index = sprPDisarmIngram {
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 1
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 8
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
        sound_ps(sndEjectClip)
        global.combo += 1
        global.combotime = 240
    }
}

if sprite_index = sprThomasDisarmDoubleBarrel {
    if image_index >= 2 and image_index - image_speed < 2 {
        repeat(2) {
            my_id = instance_create(x + lengthdir_x(5, dir), y + lengthdir_y(5, dir), objShell)
            my_id.sprite_index = sprShotgunShell
            my_id.image_angle = random(360)
            my_id.direction = my_id.image_angle
            my_id.speed = 1 + random(3)
        }
        sound_ps(sndReloadRifle)
        global.combo += 1
        global.combotime = 240
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 9
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
    }
}

if sprite_index = sprThomasDisarmKalashnikov {
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 0
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 10
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
        sound_ps(sndEjectClipRifle)
        global.combo += 1
        global.combotime = 240
    }
}

if sprite_index = sprThomasDisarmThompson {
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir + 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir + 90 * left) + lengthdir_y(5, dir), objGunClip)
        my_id.image_index = 3
        my_id.speed = 3.5
        my_id.direction = dir + 90 * left - 20 + random(40)
    }
    if image_index >= 6 and image_index - image_speed < 6 {
        my_id = instance_create(x + lengthdir_x(8, dir - 90 * left) + lengthdir_x(5, dir), y + lengthdir_y(8, dir - 90 * left) + lengthdir_y(5, dir), objDiscardedGun)
        my_id.image_index = 11
        my_id.speed = 3.5
        my_id.direction = dir - 90 * left - 20 + random(40)
        my_id.image_angle = my_id.direction
        sound_ps(sndEjectClipRifle)
        global.combo += 1
        global.combotime = 240
    }
}





