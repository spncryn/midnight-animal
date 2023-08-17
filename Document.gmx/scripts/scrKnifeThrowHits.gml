//if object_index = objDogPatrol exit
global.shake = 3

edir = other.direction
test = 0

scrBloodShotDead(x, y, 1, edir)
sound_ps(choose(sndCut1, sndCut2))
sound_ps(choose(sndHit, sndHit1, sndHit2, sndHit3))

my_id = instance_create(x, y, objDeadBody)
my_id.sprite_index = sprEDieThrowingKnife
my_id.image_speed = 0.5
my_id.direction = edir
my_id.speed = 0
my_id.image_angle = my_id.direction

repeat(2) {
    my_id = instance_create(x + lengthdir_x(17, image_angle) - 1 + random(2), y + lengthdir_y(17, image_angle) - 1 + random(2), objBloodSquirt)
    my_id.direction = edir - 10 + random(20)
    my_id.image_angle = direction
}

global.myscore += 150
global.combotime = 240
global.combo += 1

// Assign a score.
create_points("+150")

scrEnemyDropWeapon()

// Destroy enemy.
instance_destroy()
