// Check if armed.
scrEnemyDropWeapon()

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

if round(random(3)) = 2 {
    body = instance_create(x, y, objEnemyGiveUp)
    body.direction = random(360)
    body.speed = 0
    body.image_angle = body.direction
} else {
    body = instance_create(x, y, objStunnedBody)
    body.sprite_index = choose(sprEHurtElectric, sprEHurt1, sprEHurt2, sprEHurt3)
    body.image_index = 0
    body.direction = random(360)
    body.image_angle = body.direction
    body.speed = 2 + random(1)
    if body.speed > 4.5 body.speed = 4.5
    if scrBodyIsFlying(body.sprite_index) body.image_index = 0
    body.friction = 0.15
}

create_points("PACIFIED +150")
global.myscore += 150

// Destroy the enemy object.
instance_destroy()
