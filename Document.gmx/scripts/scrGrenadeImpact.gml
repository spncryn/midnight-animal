my_id = instance_create(x, y, objGrenadeExplosion)
my_id.direction = random(360)
my_id.image_angle = random(360)

scrHearExplosion(x + random(10), y + random(10))
my_id = instance_create(x, y, objMuzzleSmoke)
my_id.image_angle = direction
my_id.direction = direction - 180
instance_destroy()
