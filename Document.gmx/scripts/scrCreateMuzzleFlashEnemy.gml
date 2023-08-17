// Muzzle effects.
flash = instance_create(x + lengthdir_x(26, angle), y + lengthdir_y(26, angle), objMuzzleFlash)
if instance_exists(flash) {
    flash.direction = angle
    flash.image_angle = flash.direction
}
smoke = instance_create(x + lengthdir_x(26, angle), y + lengthdir_y(26, angle), choose(objMuzzleSmoke, objPistolSmoke))
if instance_exists(smoke) {
    smoke.direction = angle
    smoke.image_angle = smoke.direction
}

// Bullet trail.
stream = instance_create(x + lengthdir_x(26, angle), y + lengthdir_y(26, angle), objBulletStream)
stream.direction = my_id.direction
stream.image_angle = my_id.image_angle
stream.speed = my_id.speed
