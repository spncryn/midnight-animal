/// create_damage_melee(speed, string, alpha, x, y)
var s = argument0;
var text = argument1;
var alpha = argument2;
var xpos = argument3;
var ypos = argument4;

d = instance_create(xpos, ypos, objDamageCounter)
d.spd = s
d.text = string(round(objPlayer.melee_damage))
d.image_alpha = alpha
d.speed = 3 + random(3)
d.direction = objPlayer.direction - 20 + random(40)//edir - 20 + random(40)
if global.rainbow = 1 {
    d.colour = random_color()
} else d.colour = global.c_damage

