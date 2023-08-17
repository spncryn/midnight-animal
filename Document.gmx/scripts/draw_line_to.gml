/// draw_line_to(x1, y1, x2, y2, rotation);
var argc=0;
var x1, y1, x2, y2, rotation;
x1 = argument[argc]; argc++;
y1 = argument[argc]; argc++;
x2 = argument[argc]; argc++;
y2 = argument[argc]; argc++;
rotation = argument[argc]; argc++;

var xx = x1;
var yy = y1;

var xstep = (x2 - x1) / max(abs(x2 - x1), abs(y2 - y1));
var ystep = (y2 - y1) / max(abs(x2 - x1), abs(y2 - y1));

while (xx != x2) or (yy != y2) {
    if (collision_point(xx, yy, objWall, false, true)) { break; }

    draw_sprite_ext(sprBeam, 0, xx, yy, 1, 1, rotation, c_white, 1);

    xx += xstep;
    yy += ystep;
}

while (xx != x2) or (yy != y2) {
    if (collision_point(xx, yy, objSolid, false, true)) { break; }

    draw_sprite_ext(sprBeam, 0, xx, yy, 1, 1, rotation, c_white, 1);

    xx += xstep;
    yy += ystep;
}

while (xx != x2) or (yy != y2) {
    if (collision_point(xx, yy, objEnemy, false, true)) { break; }

    draw_sprite_ext(sprBeam, 0, xx, yy, 1, 1, rotation, c_white, 1);

    xx += xstep;
    yy += ystep;
}
