/// Kill enemy.

repeat(10) {
    chunk = instance_create(x + 16 - random(32), y + 16 - random(32), choose(objFleshChunk, objFleshChunkLarge))
    chunk.direction = point_direction(x, y, chunk.x, chunk.y)
    chunk.speed = 2 + random(3)
    chunk.friction = 0.15
}

repeat(20) {
    gib = instance_create(x + 16 - random(32), y + 16 - random(32), choose(objBrains, objIntestine))
    gib.direction = point_direction(x, y, gib.x, gib.y)
    gib.speed = 2 + random(4)
    gib.friction = 0.15
}
scrExtremeGore(x, y)
scrExtremeGore(x, y)
splat = instance_create(x, y, objDeadBody)
splat.sprite_index = sprBloodyExploded

body = instance_create(x, y, objDeadBody)
    //if scrIsFat(object_index) body.sprite_index = sprEFatExploded
    //else if object_get_parent(object_index) = objDogPatrol body.sprite_index = sprDogExploded
    //else 
body.sprite_index = sprEDeadExploded
body.direction = random(360)
body.image_angle = body.direction
body.speed = 2 + random(1)
body.image_index = random(4)

repeat(2) {
    limb = instance_create(x, y, objBodyPart)
    limb.sprite_index = sprELimbs
    limb.direction = random(360)
    limb.image_angle = body.direction
    limb.speed = 2 + random(1)
    limb.image_index = random(3)
}

sound_ps(choose(sndFullGib1, sndFullGib2, sndFullGib3, sndFullGib4))

global.myscore += 100
global.combo += 1
global.combotime = 240

create_points("CHUNKED +100")

instance_destroy()

