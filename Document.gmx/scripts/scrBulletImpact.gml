/// Create impact.
if sprite_index = sprBulletRicochet exit

if sprite_index = sprBullet or sprite_index = sprShotgunPellet {
    if place_meeting(x, y, objEnemy) exit
    sound_ps(choose(sndBulletImpact, sndBulletImpact1, sndBulletImpact2, sndBulletImpact3, sndBulletImpact4, sndBulletImpact5))
    scrHearSomething(x + random(10), y + random(10))
    my_id = instance_create(x, y, objMuzzleSmoke)
    my_id.image_angle = direction
    my_id.direction = direction - 180
    
    my_id=instance_create(x,y,objBulletImpact)
    my_id.image_angle=direction-180
    my_id.direction=direction//-180
    
    my_id=instance_create(x,y,objBlastImpact)
    my_id.image_xscale = 0.25
    my_id.image_yscale = 0.25
    
    my_id = instance_create(x, y, objSmokeHit)
    my_id.image_angle = direction - 180
    my_id.direction=direction//-180
            
    repeat(2 + random(2)) {
        my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objDebris)
        my_id.direction = direction - 140 - random(80)
        my_id.speed = random(4)
    }
    
    repeat(3) {
        my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objDebrisLarge)
        my_id.direction = direction - 10 + random(20)
        my_id.image_xscale = random_range(0.25, 0.5)
        my_id.image_yscale = random_range(0.25, 0.5)
        my_id.speed = random(3)
    }
    
    repeat(3) {
        my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objTinyShard)
        my_id.direction = direction - 140 - random(80)
        my_id.speed = 1 + random(1)
    }
    
    instance_destroy()
}

if sprite_index = sprShockRound {
    my_id = instance_create(x, y, objMuzzleSmoke)
    my_id.image_angle = direction
    my_id.direction = direction - 180
    
    shock = instance_create(x, y, objElectricity)
    shock.image_xscale = 0.25 + random(0.25)
    shock.image_yscale = shock.image_xscale
    instance_destroy()
}
