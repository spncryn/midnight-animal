// raycast(startX,startY,dir,object)
// startX - x to start raycast from
// startY - y to start raycast from
// dir - direction to raycast in
// object - object that blocks raycast
// You can use variables hitX/hitY after this script has called

maxDistance = 1280; // Stop raycast after this many pixels
bigSteps = 32; // Check raycast in chunks
smallSteps = 1; // Find exact point of collision

checks = 0;
checkX = argument0;
checkY = argument1;
while(checks < 1280) {
    lenX = lengthdir_x(bigSteps,argument2);
    lenY = lengthdir_y(bigSteps,argument2);
    if !collision_line(checkX,checkY,checkX+lenX,checkY+lenY,argument3,true,false) {
        checkX += lenX;
        checkY += lenY;
        checks += bigSteps;
    }
    else {
        lenX = lengthdir_x(smallSteps,argument2);
        lenY = lengthdir_y(smallSteps,argument2);
        if !collision_point(checkX+lenX,checkY+lenY,argument3,true,false) {
            checkX += lenX;
            checkY += lenY;
        }
        else {
            checks = 999999; // End raycast
        }
        checks += smallSteps;
    }
}

hitX = checkX;
hitY = checkY;
