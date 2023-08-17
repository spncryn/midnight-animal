my_id=instance_create(x,y,objEnemyBurn)
my_id.direction=other.direction
my_id.speed=3
 
repeat (10) {
    my_id=instance_create(x,y,objFlameParticle)
    my_id.direction=random(360)
    my_id.speed=2+random(3)
    my_id.friction=0.15
}

global.myscore += 100
global.combotime = 240
global.combo += 1 
create_points("IMMOLATION +100")

sound_ps(sndCatchFire)
instance_destroy()
