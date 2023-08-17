/// scrPlayerThrow(sprite, sound, object, speed)
sprite_index = argument0
image_speed = 0.5
sound_ps(argument1)
my_id = instance_create(x + lengthdir_x(14, dir + left * -35), y + lengthdir_y(12, dir + left * -35), argument2)
my_id.speed = argument3
my_id.direction = dir - 2 + random(4)
global.shake = 6
alarm[2] = throw_reload
thrown = 1
