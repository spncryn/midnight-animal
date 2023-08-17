if !scrMovingPlayerExists() exit
var lx1, ly1, lx2, ly2, i, xadd, yadd, dir, stop;
i = 0
lx1 = x
ly1 = y
lx2 = argument0
ly2 = argument1

// check defaults to 0; if the enemy sees the player, check is 2; otherwise, check is 1.  
check = 0

// dist is the direction from the enemy to the player.
dist = point_direction(x, y, argument0, argument1) 

// If the enemy's distance from the player is greater than 320 pixels, the enemy doesn't detect the player.
if dist > global.dist_detection or scrCheckBack(point_direction(objPlayer.x, objPlayer.y, x, y), direction) = 1 return 1 else { 

    // Initialise some variables calculating distance.
    dir = point_direction(x, y, argument0, argument1) 
    xadd = lengthdir_x(argument2, dir)
    yadd = lengthdir_y(argument2, dir)
    
    // See over furniture.
    with objFurniture solid = 0
    stop = 0
    
    // See through doors.
    with objDoorV {
        test = solid solid = 1
    }
    
    with objDoorV2 {
        test = solid solid = 1
    }
    scrMoveSolidOn()
    with objRenovationWallV solid = 0
    with objRenovationWallH solid = 0

    // Render 'soft' objects rigid in terms of collision.
    with objWindow solid = 0
    
    // Repeat collision mask over the object's length and width.
    repeat round((point_distance(x, y, argument0, argument1) - 8) * (1 / argument2)) {
        if stop = 0 {
        
            // If the enemy can see through the collision, return check = 2. 
            if scrSeeThroughCollision(lx1, ly1) {
                if check = 0 check = 2
            }
            
            if !scrPlaceFree(lx1, ly1) {
                check = 1 stop = 1
            }
        }
        lx1 += xadd
        ly1 += yadd
    }
    
    // Disable collision with 'soft' objects (things that can be seen through, seen over, etc). 
    with objRenovationWallV solid = 1
    with objRenovationWallH solid = 1
    with objWindow solid = 1
    with objDoorV solid = test
    with objFurniture solid = 1
    
    //If the enemy sees the player, check is 2. Otherwise, check is 1. 
    return check
}
