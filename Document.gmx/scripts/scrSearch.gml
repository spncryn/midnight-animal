///scrSearch(goalx,goaly,precision)
if checkreload > 0 checkreload -= 1
else {
    if global.character = 18 dist = 100
    else dist = 420
    
    //If the distance from the enemy's position to the argument's position is less than 480, 
    if point_distance(x, y, argument0, argument1) < dist or path_index >= 0 or speed > 0 {
    //If the enemy sees the player, check is 2. Otherwise, check is 1. Check defaults to 0.
        check = scrLook(argument0, argument1, argument2)
    } else check = 1
    
    //If the enemy is alerted,
    if check = 0 {
    
    //alert=0: No longer alerted.
    //alert<2: Run to player position.
    //alert=2: Take aim at player, and attack.
    //alert=3: Lost sight of player.
        if alert = 0 and alertwait = -1 alertwait = 1
        if alert = 2 or alert = 3 alert = 1
    }
    
    //If the enemy sees the player,
    if check = 2 {
    
        //End the current path, 
        path_end() 
        
        //And take aim at the player/attack.
        alert = 2
    }

    //If the enemy is alerted,
    if check > 0 and check < 2 {
    
    //and the alert is active,
        if alert > 0 {
            
            //the enemy will chase the player.
            alert = 3 scrChasePlayer(path, argument0, argument1)
        } else {
        
            //Otherwise, turn off the alert.
            alert = 0
        }
    }
    checkreload = 30
}

