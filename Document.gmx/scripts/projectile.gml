/// projectile(lengthdir, projectile, speed, spread, critRate, damage, sprite)
PROJECTILE = instance_create(x + lengthdir_x(argument0, dir), y + lengthdir_y(argument0, dir), argument1)
if instance_exists(PROJECTILE) {
    PROJECTILE.speed = argument2
    PROJECTILE.direction = dir - argument3 + random((argument3 * 2))
    PROJECTILE.image_angle = PROJECTILE.direction
    PROJECTILE.critRate = argument4
    PROJECTILE.damage = argument5 + round((random(argument5) * argument4))
    PROJECTILE.sprite_index = argument6
}

if instance_exists(PROJECTILE) {
    stream = instance_create(x + lengthdir_x(argument0, dir), y + lengthdir_y(argument0, dir), objBulletStream)
    stream.direction = PROJECTILE.direction
    stream.image_angle = PROJECTILE.image_angle
    stream.speed = PROJECTILE.speed
} else with stream instance_destroy()
