my_id = instance_create(x, y, objWeaponThrow)
my_id.direction = random(360)
my_id.speed = 1
my_id.friction = 0.1
my_id.image_index = scrCurrentWeaponExt(sprite_index)
my_id.ammo = ammo

sprite_index = sprPWalkUnarmed

