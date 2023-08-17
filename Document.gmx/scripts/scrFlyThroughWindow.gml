if place_meeting(x, y, objGlassPanelH) {
    global.my_id = id
    with objGlassPanelH {
        if image_index = 0 {
            sound_ps(choose(sndGlass1, sndGlass2))
            image_index = 2
            if object_index = objGlassPanelH {
                shoty = global.my_id.y
                shotdir = global.my_id.direction
                i = 0
                repeat(64) {
                    my_id = instance_create(x + 4, y + i, objShard)
                    my_id.shoty = global.my_id.y
                    my_id.shotdir = global.my_id.direction
                    if frac(i) > 0 my_id.hspeed = sign(lengthdir_x(1, shotdir)) * (1 + random(3))
                    else my_id.hspeed = sign(lengthdir_x(1, shotdir)) * (0.5 + random(1)) + lengthdir_y(1, -45 + i * 0.71) * sign(lengthdir_x(1, shotdir))
                    my_id.image_index = ceil(random(8)) * random(1)
                    my_id.i = i
                    with my_id {
                        dist = point_distance(x + 4, y + i, x + 4, shoty) * 0.5
                        if dist < 1 dist = 1
                        motion_add(shotdir, 2 / dist)
                    }
                    i += 0.5
                }
            }
        }
    }
}

if place_meeting(x, y, objGlassPanelV) {
    global.my_id = id
    with objGlassPanelV {
        if image_index = 0 {
            if place_meeting(x, y, global.my_id) {
                sound_ps(choose(sndGlass1, sndGlass2))
                image_index = 2
                if object_index = objGlassPanelV {
                    shoty = global.my_id.y
                    shotdir = global.my_id.direction
                    i = 0
                    repeat(64) {
                        my_id = instance_create(x + 4, y + i, objShard)
                        my_id.shoty = global.my_id.y
                        my_id.shotdir = global.my_id.direction
                        if frac(i) > 0 my_id.hspeed = sign(lengthdir_x(1, shotdir)) * (1 + random(3))
                        else my_id.hspeed = sign(lengthdir_x(1, shotdir)) * (0.5 + random(1)) + lengthdir_y(1, -45 + i * 0.71) * sign(lengthdir_x(1, shotdir))
                        my_id.image_index = ceil(random(8)) * random(1)
                        my_id.i = i
                        with my_id {
                            dist = point_distance(x + 4, y + i, x + 4, shoty) * 0.5
                            if dist < 1 dist = 1
                            motion_add(shotdir, 2 / dist)
                        }
                        i += 0.5
                    }
                }

            }
        }
    }
}

