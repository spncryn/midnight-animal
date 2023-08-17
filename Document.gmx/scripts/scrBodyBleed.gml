//Create blood pools.
if speed = 0 and bled = 0 {
    instance_create(x + lengthdir_x(14, image_angle), y + lengthdir_y(14, image_angle), objBloodPool)
    bled = 1
    length = random(24)

    if sprite_index = sprEDeadBlunt
    repeat(1 + random(2)) instance_create(x + lengthdir_x(24, image_angle) - 2 + random(4), y + lengthdir_y(24, image_angle) - 2 + random(4), objBloodPool)

    if sprite_index = sprEDeadCut repeat(1 + random(2))
    instance_create(x + lengthdir_x(6, image_angle) - 2 + random(4), y + lengthdir_y(6, image_angle) - 2 + random(4), objBloodPool)

    if sprite_index = sprEDeadShotgun
    repeat(2 + random(2)) instance_create(x + lengthdir_x(length, image_angle) - 2 + random(4), y + lengthdir_y(length, image_angle) - 2 + random(4), objBloodPool)

    if sprite_index = sprEDeadMachinegun or sprite_index = sprEDeadNail
    repeat(2 + random(2)) instance_create(x + lengthdir_x(length, image_angle) - 2 + random(4), y + lengthdir_y(length, image_angle) - 2 + random(4), objBloodPool)


    if sprite_index = sprEDieLean {
        repeat(2 + random(3)) {
            dir = image_angle
            my_id = instance_create(x, y, objBloodSquirt)
            my_id.image_angle = random(360)
            instance_create(x + lengthdir_x(17, image_angle), y + lengthdir_y(17, image_angle), objBloodPool)
        }
    }

    if sprite_index = sprEDeadHeadCrushed {
        repeat(2 + random(3)) {
            dir = image_angle - 2 + random(4)
            my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt)
            my_id.image_angle = dir - 100 + random(200)
            repeat(2) instance_create(x + lengthdir_x(17, image_angle), y + lengthdir_y(17, image_angle), objBloodPool)
        }
    }

    if sprite_index = sprEDeadSlashedTop scrBodyPartBleed()

    if sprite_index = sprEDeadBlunt {
        if image_index = 0 or image_angle = 6 {
            repeat(1 + random(3)) {
                my_id = instance_create(x + lengthdir_x(13, image_angle), y + lengthdir_y(13, image_angle), objBloodSquirt)
                my_id.image_angle = image_angle - 12 + random(24)
            }
        }
    }

    if sprite_index = sprEDeadShotgun {
        if image_index = 7 {
            repeat(2 + random(3)) {
                dir = image_angle + image_yscale * 12
                my_id = instance_create(x + lengthdir_x(15, dir), y + lengthdir_y(15, dir), objBloodSquirt)
                my_id.image_angle = image_angle + 90 * image_yscale - 20 + random(60)
            }
        }

        if image_index = 3 {
            repeat(2 + random(3)) {
                dir = image_angle - 2 + random(4)
                my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt)
                my_id.image_angle = dir - 30 + random(60)
            }
        }

        if image_index = 6 {
            repeat(1 + random(3)) {
                my_id = instance_create(x + lengthdir_x(13, image_angle), y + lengthdir_y(13, image_angle), objBloodSquirt)
                my_id.image_angle = image_angle - 12 + random(24)
            }
        }
    }

    if sprite_index = sprEDeadCut {
        if image_index = 2 {
            repeat(2 + random(3)) {
                dir = image_angle + image_yscale * 12
                my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt)
                my_id.image_angle = random(360)
            }
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
                repeat(6) {
                    my_id = instance_create(x + lengthdir_x(21, image_angle), y + lengthdir_y(21, image_angle), objBloodSquirt)
                    my_id.image_angle = image_angle - 30 + random(60)
                }
            }
            exit
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
                repeat(6) {
                    my_id = instance_create(x + lengthdir_x(22, image_angle), y + lengthdir_y(22, image_angle), objBloodSquirt)
                    my_id.image_angle = image_angle - 20 + random(40)
                }
            }
    
        } else {
            if image_index < 9 image_index += 0.15
        }
        exit
    }
    
    
    if sprite_index = sprEDieEviscerated {
        image_speed = 0
        if image_index < 28 image_index += 0.15
        if bled = 0 and image_index >= 12 {
            dir = image_angle - image_yscale
            repeat(2) instance_create(x + lengthdir_x(7, dir), y + lengthdir_y(7, dir), objBloodPool)
            bled = 1
            repeat(5) {
                my_id = instance_create(x + lengthdir_x(7, dir - 15), y + lengthdir_y(7, dir - 15), objBloodSquirt)
                my_id.image_angle = image_angle + 90 * image_yscale - 40 + random(80)
            }
        }
        exit
    }
    
    if sprite_index = sprEDeadShotgunVomit {
        image_speed = 0
        if image_index < 25 image_index += 0.15
        if bled = 0 and image_index >= 19 {
            dir = image_angle - image_yscale
            repeat(2) instance_create(x + lengthdir_x(7, dir), y + lengthdir_y(7, dir), objBloodPool)
            bled = 1
            repeat(5) {
                my_id = instance_create(x + lengthdir_x(7, dir - 15), y + lengthdir_y(7, dir - 15), objBloodSquirt)
                my_id.image_angle = image_angle + 90 * image_yscale - 40 + random(80)
            }
        }
        exit
    }
    
    // Head blown off.
    if sprite_index = sprEDeadShotgun and image_index = 6 {
        if bled = 0 {
            if irandom(10)=1 repeat(2) {
                my_id = instance_create(x + lengthdir_x(21, dir), y + lengthdir_y(21, dir), objBloodSquirt)
                my_id.image_angle = image_angle - 20 + random(40)
            }
            
            instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool)
            bled = 1
         
        }
    }

}
