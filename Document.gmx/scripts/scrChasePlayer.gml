///scrChasePlayer(path_index,goalx,goaly)
var myx, myy, test, i;
if path_index >= 0 path_end()
image_xscale = 2
image_yscale = 2
myx = argument1 - 4 + random(8)
myy = argument2 - 4 + random(8)

if point_distance(myx, myy, argument1, argument2) > 32 {
        myx = argument1 ;
        myy = argument2;
}

if !mp_grid_path(global.grid, argument0, x, y, myx, myy, 1) alert = 3 else path_start(argument0, 2.5, 0, 1)

image_xscale = 1
image_yscale = 1


