// God mode.
if global.tgm = 1 exit

// Dodge melee.
if instance_exists(objPlayer) {
    if objPlayer.state_name = "Dash"
    exit
}
objEffector.scratch = 100

// Blunt deaths.
if global.my_id.sprite_index = sprEAttackClub
or global.my_id.sprite_index = sprEAttackChain
or global.my_id.sprite_index = sprEAttackBat
or global.my_id.sprite_index = sprEAttackPipe {
    sound_ps(choose(sndHit, sndHit2, sndHit3, sndHit1))
    global.shake = 20
    create_thought_damaged(global.rubedo, global.albedo, 0.2, 50, 0)
    repeat(2 + random(2)) {
        my_id = instance_create(x, y, objSplat)
        my_id.direction = random(360)
        my_id.speed = 2 + random(2)
    }
    hp -= 60
}

// Slashed deaths.
if global.my_id.sprite_index = sprEAttackKnife
or global.my_id.sprite_index = sprEAttackMachete
or global.my_id.sprite_index = sprEDodgerAttack {
    sound_ps(choose(sndCut1, sndCut2))
    global.shake = 10
    create_thought_damaged(global.rubedo, global.albedo, 0.2, 50, 0)
    repeat(2 + random(2)) {
        my_id = instance_create(x, y, objSplat)
        my_id.direction = random(360)
        my_id.speed = 2 + random(2)
    }

    repeat(2 + random(2)) {
        my_id = instance_create(x, y, objSmudge)
        my_id.direction = random(360)
        my_id.speed = 3 + random(3)
        my_id.image_angle = my_id.direction
    }

    repeat(2) my_id = instance_create(x - 12 + random(24), y - 12 + random(24), objBigBlood)

    hp -= 80
}

// Punched to death.
if global.my_id.sprite_index = sprEFatAttack
or global.my_id.sprite_index = sprEFatAttackLSD {
    sound_ps(choose(sndHit, sndHit2, sndHit3, sndHit1))
    sound_ps(choose(sndPunch, sndPunch1, sndPunch2, sndPunch3))
    global.shake = 30
    create_thought_damaged(global.rubedo, global.albedo, 0.2, 50, 0)
    repeat(2 + random(2)) {
        my_id = instance_create(x, y, objSplat)
        my_id.direction = random(360)
        my_id.speed = 2 + random(2)
    }
    hp -= 200
}


// Play sound if killed by aluminium bat.
if global.my_id.sprite_index = sprEAttackBat sound_ps(sndBatHit)
