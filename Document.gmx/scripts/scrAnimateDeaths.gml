if sprite_index = sprEDeadThroat {
    if bled = 0 {
        instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool)
        bled = 1
    } else {
        if round(random(10)) = 2 and life > 0 {
            dir = image_angle + image_yscale * 12
            my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt)
            my_id.image_angle = random(360)
        }
        if life > 0 life -= 1
        else image_speed = 0
    }
    
}

if sprite_index = sprEDieThrowingKnife {
    image_speed = 0
    if image_index < 12 image_index += 0.35
    dir = image_angle - image_yscale
    if bled = 0 {
        if irandom(10) = 1 repeat(2) {
            my_id = instance_create(x + lengthdir_x(21, dir), y + lengthdir_y(21, dir), objBloodSquirt)
            my_id.image_angle = image_angle - 20 + random(40)
        }
        if image_index >= 12 {
            instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool)
            bled = 1
        }
    }
    
}

if sprite_index = sprEBackScissor {
    image_speed = 0
    if life > 0 {
        life -= 1
        if image_index < 7.3 image_index += 0.15
        else image_index = 0
    } else {
        if image_index < 13 image_index += 0.15
        dir = image_angle - image_yscale
        instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool)
    }
    
}

if sprite_index = sprEDeadHeadJerk {
    image_speed = 0
    if life > 0 {
        life -= 2
    } else {
        if image_index < 6 image_index += 0.15
        dir = image_angle - image_yscale
        if bled = 0 {
            bled = 1
            instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool)
            if round(random(12)) = 2 {
                my_id = instance_create(x + lengthdir_x(21, image_angle), y + lengthdir_y(21, image_angle), objBloodSquirt)
                my_id.image_angle = image_angle - 30 + random(60)
            }
        }
        
    }
}
if sprite_index = sprEDeadCracked {
    image_speed = 0
    if life > 0 {
        life -= 1
        if image_index < 3.3 image_index += 0.15
        else image_index = 0
        dir = image_angle - image_yscale
        if bled = 0 {
            bled = 1
            instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool)
            if round(random(30)) = 2 {
                my_id = instance_create(x + lengthdir_x(22, image_angle), y + lengthdir_y(22, image_angle), objBloodSquirt)
                my_id.image_angle = image_angle - 20 + random(40)
            }
        }

    } else {
        if image_index < 9 image_index += 0.15
    }
    
}


if sprite_index = sprEDieEviscerated {
    image_speed = 0
    if image_index < 28 image_index += 0.15
    if bled = 0 and image_index >= 12 {
        dir = image_angle - image_yscale
        instance_create(x + lengthdir_x(7, dir), y + lengthdir_y(7, dir), objBloodPool)
        bled = 1
        repeat(5) {
            my_id = instance_create(x + lengthdir_x(7, dir - 15), y + lengthdir_y(7, dir - 15), objBloodSquirt)
            my_id.image_angle = image_angle + 90 * image_yscale - 40 + random(80)
        }
    }
    
}

if sprite_index = sprEDeadShotgunVomit {
    image_speed = 0
    if image_index < 25 image_index += 0.15
    if bled = 0 and image_index >= 19 {
        dir = image_angle - image_yscale
        instance_create(x + lengthdir_x(7, dir), y + lengthdir_y(7, dir), objBloodPool)
        bled = 1
        repeat(5) {
            my_id = instance_create(x + lengthdir_x(7, dir - 15), y + lengthdir_y(7, dir - 15), objBloodSquirt)
            my_id.image_angle = image_angle + 90 * image_yscale - 40 + random(80)
        }
    }
    
}

if sprite_index = sprEDeadHeadshot {
    image_speed = 0
    if image_index < 13 image_index += 0.15
    if bled = 0 and image_index >= 13 {
        dir = image_angle
        bled = 1

        repeat(6) {
            my_id = instance_create(x + lengthdir_x(22, image_angle), y + lengthdir_y(22, image_angle), objBloodSquirt)
            my_id.image_angle = image_angle - 20 + random(40)
        }
        instance_create(x + lengthdir_x(7, dir), y + lengthdir_y(7, dir), objBloodPool)
    }
    
}

if sprite_index = sprEDeadScrewdriver {
    image_speed = 0
    if life > 0 {
        life -= 1
        if image_index < 7.3 image_index += 0.15
        else image_index = 0
    } else {
        if image_index < 13 image_index += 0.15
    }
    
}

if sprite_index = sprEDeadBoiling {
    image_speed = 0
    if life > 0 {
        life -= 1
        if life > 60 and round(random(3)) = 2 instance_create(x + lengthdir_x(21, image_angle), y + lengthdir_y(21, image_angle), objSteam)
        if image_index < 7.3 image_index += 0.15
        else image_index = 0
    } else {
        if image_index < 13 image_index += 0.15
    }
    
}
