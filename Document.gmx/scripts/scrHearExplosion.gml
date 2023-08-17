global.distlist = ds_list_create()
with objEnemy {
    if scrIgnoreSound() nothing = 1 else {
        dist = point_distance(x, y, argument0, argument1)
        ds_list_add(global.distlist, dist)
    }
}

ds_list_sort(global.distlist, 1)
with objEnemy {
    if scrIgnoreSound() nothing = 1 else {
        if ds_list_find_value(global.distlist, 0) = dist and dist < 300 {
            if alert = 0 scrChasePlayer(path, argument0, argument1)
        }
        if ds_list_find_value(global.distlist, 1) = dist and dist < 300 {
            if alert = 0 scrChasePlayer(path, argument0, argument1)
        }
        if ds_list_find_value(global.distlist, 2) = dist and dist < 300 {
            if alert = 0 scrChasePlayer(path, argument0, argument1)
        }
    }
}

ds_list_destroy(global.distlist)
