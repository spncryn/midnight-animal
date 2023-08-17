if round(random(20)) = 2 direffect = 8 - random(16)
if flashed = 1 {
    if effect_duration > 0 {
        alert = 0
        accuracy = 2
        image_speed = 0
        speed = 0 
        path_end()
        angle += direffect
        if round(random(5)) = 2 scrEnemyShoot()
        effect_duration -= 1 
    } else {
        flashed = 0
        affected = 0
        accuracy = 1
        effect_duration = room_speed * 3
        alert = 4
    }
}

if burning = 1 {
    if effect_duration > 0 {
        if round(random(10)) = 2 {
            hp -= 8
            create_damage_general(random(3), global.c_fire, "8", 1, x + choose(-random(24), random(24)), y - 5)
            objEffector.hitalpha = 1
            sound_ps(sndHitMarker)
            eflash = true
            hit_enemy = true
            alarm[1] = 5
        }
        if round(random(4)) = 2 {
            my_id = instance_create(x - 8 + random(16), y - 8 + random(16), objFireBall)
            my_id.direction = random(360)
            my_id.speed = 1 + random(1)
        }
        if round(random(3)) = 2 {
            my_id = instance_create(x - 8 + random(16), y - 8 + random(16), objFlameSmoke)
            my_id.direction = random(360)
            my_id.speed = 0.5 + random(1)
        }
        if !place_free(x + hspeed, y) hspeed = -hspeed
        if !place_free(x, y + vspeed) vspeed = -vspeed
        
        effect_create_below(ef_smoke,x,y,0.2,make_colour_rgb(244, 203, 66))
        speed = 3
        angle += direffect
        alert = 4 
        if hp < 0 scrEnemyGetBurned()
        effect_duration -= 1 
    } else {
        burning = 0
        affected = 0
        effect_duration = room_speed * 3
        alert = 4
    }
}

if shocked = 1 {
    if effect_duration > 0 {
        if round(random(10)) = 2 {
            hp -= 3
            create_damage_general(random(3), global.c_shock, "3", 1, x + choose(-random(24), random(24)), y - 5)
            instance_create(x, y, objElectricity)
            objEffector.hitalpha = 1
            sound_ps(sndHitMarker)
            eflash = true
            hit_enemy = true
            alarm[1] = 5
        }
        speed = 0
        alert = 0
        accuracy = 2
        image_index = 0
        image_speed = 0
        path_end()

        if hp < 0 scrEnemyGetShocked()
        effect_duration -= 1 
    } else {
        shocked = 0
        affected = 0
        effect_duration = room_speed * 3
        alert = 4
        accuracy = 1
    }
}
