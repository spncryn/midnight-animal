/// Allows bullets to open doors.
with objDoorV {
    if place_meeting(x + lengthdir_x(12, global.dir - 1240), y + lengthdir_y(12, global.dir - 1240), objBullet) {

        if object_index = objDoorV or object_index = objDoorH {
            if solid = 0 {
                if abs(swingspeed) < 24 {
                    swingspeed += lengthdir_x(16, global.dir)
                    if abs(swingspeed) > 3.5 swinger = 1
                }
                if abs(swingspeed) > 24 {
                    swingspeed = sign(swingspeed) * 24
                }
            }
        }
    }
}
