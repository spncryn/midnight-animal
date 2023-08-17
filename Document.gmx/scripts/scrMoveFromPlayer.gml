if !scrMovingPlayerExists() exit

/*if scrPlayerHasGun(objPlayer.sprite_index) and point_distance(x, y, objPlayer.x, objPlayer.y) < 24 {
    if scrPlaceFree(x + lengthdir_x(24, objPlayer.dir), y + lengthdir_y(24, objPlayer.dir)) {
        x += lengthdir_x(4, objPlayer.dir)
        y += lengthdir_y(4, objPlayer.dir)
    }
}
