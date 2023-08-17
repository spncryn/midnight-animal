if global.gibfest = 1 exit

flash = true
global.body = id
image_xscale = 1.5
image_yscale = 1.5
bullets = 0

sound_ps(choose(sndElectricSpark1, sndElectricSpark2))
sound_ps(choose(sndCritical1, sndCritical2, sndCritical3))

// Hit effect.
with argument0 {
    if place_meeting(x, y, global.body) {
        global.body.bullets += 1
        instance_destroy()
        sound_ps(sndHitMarker)
        objEffector.whitealpha = 1
    }
}

image_xscale = 1
image_yscale = 1
edir = other.direction

test = 0

scrEnemyGetShocked()
