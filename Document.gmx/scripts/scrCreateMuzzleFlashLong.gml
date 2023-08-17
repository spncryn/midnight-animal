flash = instance_create(x + lengthdir_x(36, dir), y + lengthdir_y(36, dir), objMuzzleFlash)
flash.direction = dir
flash.image_angle = flash.direction

smoke = instance_create(x + lengthdir_x(36, dir), y + lengthdir_y(36, dir), choose(objMuzzleSmoke, objPistolSmoke))
smoke.direction = dir
smoke.image_angle = smoke.direction

stream = instance_create(x + lengthdir_x(36, dir), y + lengthdir_y(36, dir), objBulletStream)
stream.direction = my_id.direction
stream.image_angle = my_id.image_angle
stream.speed = my_id.speed


