/// get_reflected_vector(cx, cy, incidence_direction, collision_object)
///@description Returns the direction of a reflected vector based on the direction of an incidence vector
///@param {real} cx | Collision x to check for.
///@param {real} cy | Collision y to check for.
///@param {real} incidence_direction | Direction of incidence vector.
///@param {real} collision_object | The instance id to check for collisions with.

/* 
Given the angle incidence, calculates reflected vector direction based on
surface normal of collision object
*/


var n, nx, ny, ix, iy, rx, ry;
var cx = argument0;
var cy = argument1;
var i_dir = argument2;
var obj = argument3;

// Find surface normal
n = collision_normal(cx, cy, objWall, 7.5, 1); // http://www.gmlscripts.com/script/collision_normal 
nx = lengthdir_x(1, n);
ny = lengthdir_y(1, n);
    
// Find incident vector
ix = lengthdir_x(1, i_dir);
iy = lengthdir_y(1, i_dir);
    
// Find reflection vector
rx = ix - 2 * nx * dot_product(ix, iy, nx, ny);
ry = iy - 2 * ny * dot_product(ix, iy, nx, ny);
    
// Find reflection angle
return point_direction(0, 0, rx, ry);
