if !scrMovingPlayerExists()exit
var dir = point_direction(objPlayer.x, objPlayer.y, x, y)
var dis = argument0;

//with(other) // Change the scope to the other instance in the collision (makes things easier)
//{
var ox = x + lengthdir_x(dis, dir); // Get the check position
var oy = y + lengthdir_y(dis, dir);
while (dis > 0) // Create a loop to check and move back the position if a collision is found
{
    if !place_meeting(ox, oy, _SOLID) // Check for a collision
        {
            break; // No collision is found so break the loop
        }
    dis -= 1; // Collision has been detected so reduce the knockback distance and loop again
}
x += lengthdir_x(dis, dir); // Apply the new position
y += lengthdir_y(dis, dir);
//}
