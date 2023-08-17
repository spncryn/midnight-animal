/// scrCreateMuzzleFlash(length)
flash = instance_create(x + lengthdir_x(argument0, dir), y + lengthdir_y(argument0, dir), objMuzzleFlash)
flash.direction = dir
flash.image_angle = flash.direction

/*light = instance_create(x + lengthdir_x(argument0, dir), y + lengthdir_y(argument0, dir), objMuzzleLight)
light.direction = dir
light.image_angle = light.direction*/

smoke = instance_create(x + lengthdir_x(argument0, dir), y + lengthdir_y(argument0, dir), objMuzzleSmoke)
smoke.direction = dir
smoke.image_angle = smoke.direction



