/// create_health_number(text, alpha)
var text = argument0;
var alpha = argument1;

d = instance_create(x + choose(-random(24), random(24)), y - 5, objDamageCounter)
d.colour = global.c_health
d.spd = random(3)
d.text = argument0
d.image_alpha = argument1
d.speed = 3 + random(3)
d.direction = random(360)
