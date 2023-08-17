global.distlist = ds_list_create()
with objEnemy {
    //if scrIgnoreSound()
    //nothing = 1
    //else {
        dist = point_distance(x, y, objPlayer.x, objPlayer.y)
        ds_list_add(global.distlist, dist)
    //}
}

ds_list_sort(global.distlist, 1)
with objEnemy {
    //if scrIgnoreSound()
    //nothing = 1
    //else {

        if scrIsSuppressed(objPlayer.sprite_index) {
            if ds_list_find_value(global.distlist, 0) = dist and dist < 24 {
                if alert = 0 scrChasePlayer(path, objPlayer.x, objPlayer.y)
            }
            if ds_list_find_value(global.distlist, 1) = dist and dist < 24 {
                if alert = 0 scrChasePlayer(path, objPlayer.x, objPlayer.y)
            }
            if ds_list_find_value(global.distlist, 2) = dist and dist < 24 {
                if alert = 0 scrChasePlayer(path, objPlayer.x, objPlayer.y)
            }
        } else {
            if ds_list_find_value(global.distlist, 0) = dist and dist < 210 {
                if alert = 0 scrChasePlayer(path, objPlayer.x, objPlayer.y)
            }
            if ds_list_find_value(global.distlist, 1) = dist and dist < 210 {
                if alert = 0 scrChasePlayer(path, objPlayer.x, objPlayer.y)
            }
            if ds_list_find_value(global.distlist, 2) = dist and dist < 210 {
                if alert = 0 scrChasePlayer(path, objPlayer.x, objPlayer.y)
            }
        }

    //}
}

ds_list_destroy(global.distlist)

