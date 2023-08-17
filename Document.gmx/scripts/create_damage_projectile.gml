/// create_damage_projectile(speed, colour, alpha, x, y)
var s = argument0;
var c = argument1;
var alpha = argument2;
var xpos = argument3;
var ypos = argument4;

d = instance_create(xpos, ypos, objDamageCounter)
d.spd = s
d.text = string(round(other.damage))
d.image_alpha = alpha
d.speed = 3 + random(3)
d.direction = other.direction - 20 + random(40)
if global.rainbow = 1 {
    d.colour = random_color()
} else d.colour = c
