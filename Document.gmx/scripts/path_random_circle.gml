///path_random_circle(path,x,y,r1,r2,angle,segments)
//clears an existing path and then adds points to it for a lightning bolt circle,
//where r1 and r2 are the max and min radius allowed.

var dir,angle,delta,r;
//start with a clean slate
path_clear_points(argument0)
//To avoid pointy corners when the path type is smooth, the path must be closed
path_set_closed(argument0,1);
//difference between max and min radius
delta=argument3-argument4;
angle=360/max(1,argument6);
for (dir=argument5-360; dir<argument5; dir+=angle)
{
    //choose a value between the min and max radius
    r=argument3+random(delta);
    path_add_point(argument0,argument1+lengthdir_x(r,dir),argument2+lengthdir_y(r,dir),argument5)
}
