/// create_damage_general(speed, colour, string, alpha, x, y)
var s = argument0;
var c = argument1;
var alpha = argument3;
var xpos = argument4;
var ypos = argument5;

d = instance_create(xpos, ypos, objDamageCounter)
d.spd = s
d.text = argument2
d.image_alpha = alpha
d.speed = 3 + random(3)
d.direction = other.direction - 20 + random(40)
if global.rainbow = 1 {
    d.colour = random_color()
} else d.colour = c
