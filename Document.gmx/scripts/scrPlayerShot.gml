with other {
    if place_meeting(x, y, _SOLID) {
        addx = lengthdir_x(4, direction - 180)
        addy = lengthdir_y(4, direction - 180)
        while place_meeting(x, y, _SOLID) {
            x += addx
            y += addy
        }
    }
}

// Generate blood.
with other instance_destroy()

global.my_id = id
bullets = 0
with objBullet {
    if place_meeting(x, y, global.my_id) {
        global.my_id.bullets += 1
        my_id = instance_create(x, y, objSplat)
        my_id.image_angle = image_angle
        my_id.direction = image_angle
        my_id.speed = random(1)
        instance_destroy()
    }
}

// Blood base on lethality.
if hp > 0 {
    hp -= 1
    scrBloodShot(x, y, bullets)
} else scrBloodShotDead(x, y, bullets, other.direction)
