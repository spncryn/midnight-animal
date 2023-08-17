if place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objEnemy) {
    with objEnemy {
        if place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer) {
            if global.combo > 10 my_id = instance_create(objPlayer.x + lengthdir_x(7, objPlayer.dir), objPlayer.y + lengthdir_y(7, objPlayer.dir), objPAttackThroat)
            else my_id = instance_create(objPlayer.x + lengthdir_x(7, objPlayer.dir), objPlayer.y + lengthdir_y(7, objPlayer.dir), objPAttackKnee)
            my_id.image_angle = objPlayer.dir
            scrPlayerDropWeapon()
            instance_destroy()
            scrEnemyDropWeapon()
        }
    }
}
