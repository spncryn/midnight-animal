///scrCharge(goalx,goaly,precision)
if scrIsSearching(sprite_index) sprite_index = scrStopSearch(sprite_index)
alert = 1

/// Set distance.
if point_distance(x, y, argument0, argument1) > 240 {
    motion_add(point_direction(x, y, argument0, argument1), 0.25)
    if speed > 4 speed = 4
    angle = point_direction(x, y, argument0, argument1)
} else {
    if speed > 0 speed -= 0.25
    angle = scrRotate(angle, point_direction(x, y, argument0, argument1), 20)
    direction = angle
}

/// Fire weapon.
if reload > 0 reload -= 1
else {
    scrEnemyShoot()
}

checkreload = 0
scrChargeSearch(argument0, argument1, argument2)

