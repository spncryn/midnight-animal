if sprite_index = sprPWalkUnarmed {
    sound_ps(sndSwingFists)
    sprite_index = choose(sprPAttackPunch, sprPAttackUnarmed1, sprPAttackUnarmed2)
    image_speed = 0.4
    reload = 1
    global.shake = 6
}

if sprite_index = sprPWalkHysteria {
    image_speed = 0.4
    reload = 16
    sprite_index = sprPAttackHysteria
    global.shake = 6
    sound_ps(sndSwingHeavy2)
     
    if round(random(10)) = 2 {
        my_id = instance_create(x + lengthdir_x(26, dir), y + lengthdir_y(26, dir), objPsychicSlashMassive) 
            if instance_exists(my_id) {
                sound_ps(sndLeviathanCharged)
                sound_ps(sndMassiveSlash)
                my_id.direction = dir
                my_id.image_angle = my_id.direction
                my_id.image_xscale = random_range(0.5, 0.7) 
                my_id.image_yscale = -left
        }
    } else {
        slash = instance_create(x + lengthdir_x(80, dir), y + lengthdir_y(80, dir), objPsychicSlash) 
            if instance_exists(slash) {
                slash.direction = dir
                slash.image_xscale = -random_range(0.6, 1.2)
                slash.image_yscale = -left
                slash.image_angle = slash.direction
        }
    }
}

if sprite_index = sprPWalkTaser {
    image_speed = 0.4
    reload = 4
    sprite_index = sprPAttackTaser
    global.shake = 6
}

if sprite_index = sprPWalkKatana {
    image_speed = 0.4
    reload = 7
    sound_ps(choose(sndSwingSword2, sndSwingSword3, sndSwingSword4))
    sprite_index = choose(sprPAttackKatanaH1, sprPAttackKatanaH2)
    global.shake = 6
}

if sprite_index = sprPWalkHalberd {
    image_speed = 0.4
    reload = 8
    sprite_index = choose(sprPAttackHalberdV, sprPAttackHalberdH)
    if sprite_index = sprPAttackHalberdV sound_ps(sndSwingHeavy1) else sound_ps(sndSwingHeavy2)
    global.shake = 6
}

if sprite_index = sprPWalkChainsaw {
    sprite_index = sprPAttackChainsaw
    image_speed = 0.4
    reload = 20
    global.shake = 10
    sound_ps(sndChainsawAttack)
    scrHearSomething(x + random(10), y + random(10))
    global.shake = 6
}

if sprite_index = sprPWalkCircularSaw {
    sprite_index = sprPAttackCircularSaw
    image_speed = 0.4
    reload = 20
    global.shake = 10
    sound_ps(sndChainsawAttack)
    scrHearSomething(x + random(10), y + random(10))
    global.shake = 6
}

if sprite_index = sprPWalkCleaver {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackCleaver
    image_speed = 0.4
    reload = 10
    global.shake = 6
}

if sprite_index = sprPWalkKnife {
    sound_ps(sndSwingFists)
    sprite_index = choose(sprPAttackKnife, sprPAttackKnife, sprPAttackKnife, sprPAttackKnife, sprPAttackKnifeSlash1, sprPAttackKnifeSlash1, sprPAttackKnifeSlash2, sprPAttackKnifeSlash2)
    image_speed = 0.4
    reload = 3
    global.shake = 6
}

if sprite_index = sprPWalkKnifePistol {
    sound_ps(sndSwingFists)
    sprite_index = sprPAttackKnifePistol
    image_speed = 0.4
    reload = 9
    global.shake = 6
}

if sprite_index = sprPWalkChain {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackChain
    image_speed = 0.4
    reload = 18
    global.shake = 6
}

if sprite_index = sprPWalkGuitar {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackGuitar
    image_speed = 0.4
    
    reload = 22
    global.shake = 6
}

if sprite_index = sprPWalkClub {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackClub
    image_speed = 0.4
    
    reload = 16
    global.shake = 6
}

if sprite_index = sprPWalkSkateboard {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackSkateboard
    image_speed = 0.4
    reload = 20
    global.shake = 6
}

if sprite_index = sprPWalkBong {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackBong
    image_speed = 0.4
    reload = 20
    global.shake = 6
}
/*
if sprite_index = sprPWalkScythe {
    sound_ps(choose(sndSwingHeavy1, sndSwingHeavy2))
    sprite_index = sprPAttackScythe
    image_speed = 0.4
    reload = 20
    global.shake = 6
}

if sprite_index = sprPWalkScissors {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackScissors
    image_speed = 0.4
    reload = 20
    global.shake = 6
}
*/

if sprite_index = sprPWalkMace {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = choose(sprPAttackMace1, sprPAttackMace2)
    image_speed = 0.4
    reload = 20
    global.shake = 6
}

if sprite_index = sprPWalkHammer {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackHammer
    image_speed = 0.4
    
    reload = 13
    global.shake = 6
}

if sprite_index = sprPWalkBrick {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackBrick
    image_speed = 0.4
    
    reload = 10
    global.shake = 6
}

if sprite_index = sprPWalkWrench {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackWrench
    image_speed = 0.4
    
    reload = 16
    global.shake = 6
}

if sprite_index = sprPWalkScrewdriver {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackScrewdriver
    image_speed = 0.4
    
    reload = 8
    global.shake = 6
}

if sprite_index = sprPWalkBottle {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackBottle
    image_speed = 0.4
    
    reload = 10
    global.shake = 6
}

if sprite_index = sprPWalkBottleBroken {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackBottleBroken
    image_speed = 0.4
    
    reload = 10
    global.shake = 6
}

if sprite_index = sprPWalkNightStick {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackNightStick
    image_speed = 0.4
    
    reload = 8
    global.shake = 6
}

if sprite_index = sprPWalkPipe {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackPipe
    image_speed = 0.4
    reload = 13
    global.shake = 6
}

if sprite_index = sprPWalkBigPipe {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackBigPipe
    image_speed = 0.4
    reload = 13
    global.shake = 6
}

if sprite_index = sprPWalkBat {
    sound_ps(sndSwingBat)
    sprite_index = sprPAttackBat
    image_speed = 0.4
    reload = 12
    global.shake = 6
}

if sprite_index = sprPWalkArm {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackArm
    image_speed = 0.4
    reload = 20
    global.shake = 6
}

if sprite_index = sprPWalkBust {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackBust
    image_speed = 0.4
    reload = 19
    global.shake = 6
}

if sprite_index = sprPWalkAxe {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackAxe
    image_speed = 0.4
    reload = 26
    global.shake = 6
}

if sprite_index = sprPWalkSledgeHammer {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackSledgeHammer
    image_speed = 0.4
    reload = 26
    global.shake = 6
}

if sprite_index = sprPWalkPool {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackPool
    image_speed = 0.4
    
    reload = 11
    global.shake = 6
}

if sprite_index = sprPWalkBag {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackBag
    image_speed = 0.4
    reload = 20
    global.shake = 6
}

if sprite_index = sprPWalkPan {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackPan
    image_speed = 0.4
    reload = 15
    global.shake = 6
}

if sprite_index = sprPWalkCrowbar {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackCrowbar
    image_speed = 0.4
    reload = 20
    global.shake = 6
}

if sprite_index = sprPWalkMachete {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackMachete
    image_speed = 0.4
    reload = 16
    global.shake = 6
}

if sprite_index = sprPWalkLongSword {
    sound_ps(choose(sndSwingSword1, sndSwingSword2, sndSwingSword3, sndSwingSword4))
    sprite_index = choose(sprPAttackLongSword1, sprPAttackLongSword2)
    
    image_speed = 0.4
    reload = 26
    global.shake = 6
}

if sprite_index = sprPWalkPot {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackPot
    
    image_speed = 0.4
    reload = 18
    global.shake = 6
}

if sprite_index = sprPWalkBoilingPot {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackBoilingPot
    
    image_speed = 0.4
    repeat(3 + random(2)) {
        my_id = instance_create(x + lengthdir_x(11, dir) - 2 + random(4), y + lengthdir_y(11, dir) - 2 + random(4), objBoilingWater)
        global.mydir = dir
        with my_id move_contact_solid(global.mydir, 10)
        my_id.direction = point_direction(x, y, my_id.x, my_id.y)
        my_id.speed = 8
        my_id.image_angle = my_id.direction
    }
    reload = 18
    global.shake = 6
}

if sprite_index = sprPWalkDrill {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackDrill
    image_speed = 0.4
    reload = 15
    global.shake = 6
}

if sprite_index = sprPWalkTrophy {
    sound_ps(choose(sndSwing1, sndSwing2))
    sprite_index = sprPAttackTrophy
    
    image_speed = 0.4
    reload = 18
    global.shake = 6
}

if sprite_index = sprPWalkGrenade {
    my_id = instance_create(x + lengthdir_x(14, dir + left * -35), y + lengthdir_y(12, dir + left * -35), objGrenade)
    sound_ps(sndThrowFrag)
    my_id.speed = 10
    my_id.direction = dir - 2 + random(4)
    reload = 6
    image_speed = 0.4
    
    sprite_index = sprPThrow
    global.shake = 6
}

if sprite_index = sprPWalkC4 {
    if instance_number(objC4) <= 6 {
        reload = 10
        sound_ps(choose(sndDeployC41, sndDeployC42))
        image_speed = 0.4
        sprite_index = sprPPlaceC4
    }
}
