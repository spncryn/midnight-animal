if global.gibfest = 1 exit

flash = true
global.my_id = id
image_xscale = 1.5
image_yscale = 1.5
bullets = 0

// Hit effect.
with argument0 {
    if place_meeting(x, y, global.my_id) {
        global.my_id.bullets += 1
        if caliber = 0 instance_destroy()
        sound_ps(sndHitMarker)
        sound_ps(choose(sndBulletFlesh3, sndBulletFlesh2, sndBulletFlesh1))
        global.my_id.alert = 1
        objEffector.whitealpha = 1
    }
}

image_xscale = 1
image_yscale = 1
edir = other.direction

test = 0

// Begin gun kills.

    // Check if armed.
    scrEnemyDropWeapon()

    // Create blood proportional to bullets.
    scrBloodShot(x, y, bullets)

    // Drop health.
    drop_health(1, 3, 2)
    
    // Assign a score.
    global.myscore += 100
    global.combo += 1
    global.combotime = 240
    global.kills += 1
    
    // Create a dead body.
    global.deathshake = 10
    impact = instance_create(x, y, objBlastImpact)
    instance_create(x, y, objHealthPickup)
    my_id = instance_create(x, y, objDeadBody)
    my_id.direction = edir
    my_id.image_angle = my_id.direction
    my_id.speed = 2 + random(1) + bullets * 0.5
    if my_id.speed > 4.5 my_id.speed = 4.5
    if scrBodyIsFlying(my_id.sprite_index) my_id.image_index=0
    my_id.friction = 0.15
    my_id.alarm[0] = 6
    sound_ps(choose(sndCritical1, sndCritical2, sndCritical3))

    // Shotguns.
    if bullets > 1 {

        // Calculate probabilities of 'special' deaths.
        if bullets > 3 {
            if round(random(10)) = 2 scrGetShotgunGibbed() else my_id.sprite_index = choose(sprEDeadShotgunVomit, sprEDeadHeadJerk, sprEShotgunFly, sprEShotgunFly)
            my_id.image_index = 0
            my_id.image_speed = 0
        }

        // Otherwise, just assign a normal death sprite.
        else my_id.sprite_index = sprEDeadShotgun
        my_id.image_index = floor(random(sprite_get_number(my_id.sprite_index)))
        my_id.direction = edir
        my_id.image_angle = my_id.direction
        scrMeleeBlood(x, y)
        create_points("+100")
        
    } else {

        // Deaths for rifles and pistols.

        // Calculate probability of headshot for high-calibre weapons...
        if round(random(5)) = 2 and other.caliber = 1 {
            my_id.sprite_index = sprEDeadHeadshot
            sound_ps(sndHeadshot)

            create_points("HEADSHOT +150")
            global.myscore += 50

            my_id.speed = 0
            my_id.image_angle -= 180
            repeat(10 + random(4)) {
                my_id = instance_create(x, y, choose(objBrains, objBrainsSmall))
                my_id.direction = random(360)
                my_id.image_angle = my_id.direction
                my_id.speed = 2 + random(1)
            }
        } else {
            // ...otherwise, use the normal death sprite.
            my_id.sprite_index = sprEDeadMachinegun
            my_id.speed = 1 + random(2) + bullets * 0.15
            my_id.image_index = floor(random(sprite_get_number(my_id.sprite_index)))
            my_id.direction = edir
            my_id.image_angle = my_id.direction
            
            create_points("+100")
        }

    }

    // Destroy the enemy object.
    instance_destroy()

