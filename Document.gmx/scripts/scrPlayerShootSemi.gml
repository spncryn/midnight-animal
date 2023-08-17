// Check for ammo.
if scrIsUnarmed(sprite_index) or scrCurrentWeaponExt(sprite_index) = 80 exit

if ammo > 0 {
    image_angle = dir

    //SB Geist (crossbow).
    if sprite_index = sprPWalkCrossbow or sprite_index = sprPTurnCrossbow {
        sound_ps(sndCrossbow)
        ammo -= 1
        reload = 20
        global.shake = 7
        projectile(20, objNail, 32, 0, 0.5, 80, sprNail)
        if sprite_index = sprPWalkCrossbow {
            sprite_index = sprPAttackCrossbow
            image_speed = 0.4
            image_index = 0
        }
        objEffector.amp = 20
    }

    //Bow.
    if sprite_index = sprPWalkBow {
        sound_ps(sndBow)
        ammo -= 1
        reload = 4
        damage = 90
        global.shake = 7
        projectile(4, objArrow, 32, 0, 0.8, 100, sprArrow)
        sprite_index = sprPAttackBow
        image_speed = 0.4
        image_index = 0
        objEffector.amp = 20

    }

    //Bartoli FR-12 (SPAS-12).
    if sprite_index = sprPWalkShotgun or sprite_index = sprPTurnShotgun {
        sound_ps(choose(sndSPAS01, sndSPAS02, sndSPAS03))
        scrHearPlayer()
        ammo -= 1
        reload = 20
        global.shake = 15
        warp_hud()
        repeat(6) projectile(20, objBullet, 16 - random(4), 6, 0.3, 15 + random(5), sprShotgunPellet)
        scrCreateMuzzleFlash(26)
        
        create_casing(sprShotgunShell)
        sound_ps(choose(snd12GA1, snd12GA2, snd12GA3))
        if sprite_index = sprPWalkShotgun {
            sprite_index = sprPAttackShotgun
            image_speed = 0.5
            image_index = 0
        }
        objEffector.amp = 45
    }

    //KSG.
    if sprite_index = sprPWalkKSG {
        sound_ps(sndKSG)
        scrHearPlayer()
        ammo -= 1
        reload = 24
        global.shake = 15
        warp_hud()
        repeat(6) projectile(20, objBullet, 20 - random(4), 3, 0.4, 20 + random(5), sprShotgunPellet)
        scrCreateMuzzleFlash(26)

        create_casing(sprShotgunShell)
        sound_ps(choose(snd12GA1, snd12GA2, snd12GA3))
        if sprite_index = sprPWalkKSG {
            sprite_index = sprPAttackKSG
            image_speed = 0.5
            image_index = 0
        }
        objEffector.amp = 45
    }

    //Bartoli 220 (double-barrel shotgun).
    if sprite_index = sprPWalkDoubleBarrel or sprite_index = sprPTurnDoubleBarrel {
        sound_ps(sndDoubleBarrel)
        scrHearPlayer()
        ammo -= 1
        reload = 6
        global.shake = 10
        warp_hud()
        repeat(8) projectile(20, objBullet, 14, 10, 0.5, 22, sprShotgunPellet)

        scrCreateMuzzleFlash(26)
        if sprite_index = sprPWalkDoubleBarrel {
            sprite_index = sprPAttackDoubleBarrel
            image_speed = 0.5
            image_index = 0
        }
        objEffector.amp = 45

    }

    if sprite_index = sprPWalkSawedOff {
        sound_ps(sndDoubleBarrel)
        scrHearPlayer()
        ammo -= 1
        reload = 4
        global.shake = 15
        warp_hud()
        repeat(4) projectile(20, objBullet, 14, 10, 0.5, 24, sprShotgunPellet)

        scrCreateMuzzleFlash(26)
        sprite_index = sprPAttackSawedOff
        image_speed = 0.4
        image_index = 0
        objEffector.amp = 40
    }

    //Model 1887 (lever-action shotgun).
    if sprite_index = sprPWalk1887 {
        sound_ps(snd1887)
        scrHearPlayer()
        ammo -= 1
        reload = 7
        global.shake = 15
        warp_hud()
        repeat(4) projectile(20, objBullet, 15 + random(6), 5, 0.5, 30, sprShotgunPellet)
        scrCreateMuzzleFlash(26)
        
        create_casing(sprShotgunShell)
        sound_ps(choose(snd12GA1, snd12GA2, snd12GA3))
        sprite_index = sprPAttack1887
        image_speed = 0.4
        image_index = 0
        objEffector.amp = 40
    }

    if sprite_index = sprPWalkIthaca {
        sound_ps(sndIthaca)
        scrHearPlayer()
        ammo -= 1
        reload = 7
        global.shake = 15
        warp_hud()
        repeat(8) projectile(20, objBullet, 15 + random(6), 7, 0.3, 20, sprShotgunPellet)
        scrCreateMuzzleFlash(26)

        create_casing(sprShotgunShell)
        sound_ps(choose(snd12GA1, snd12GA2, snd12GA3))
        sprite_index = sprPAttackIthaca
        image_speed = 0.33
        image_index = 0
        objEffector.amp = 40
    }

    //SB Zenith 40S (suppressed pistol).
    if sprite_index = sprPWalkSilencer {
        sound_ps(sndSilencedPistol)
        scrHearPlayer()
        ammo -= 1
        reload = 6
        damage = 10
        global.shake = 12
        warp_hud()
        projectile(20, objBullet, 21, 3, 0.9, 20, sprBullet)
        scrCreateMuzzleFlash(36)
        create_casing(sprUziShell)
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
        sprite_index = sprPAttackSilencer
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 40
    }


    //SB Zenith 40 (H&K P30L).
    if sprite_index = sprPWalkHandgun {
        sound_ps(sndHandgun)
        scrHearPlayer()
        ammo -= 1
        reload = 6
        global.shake = 14
        warp_hud()
        projectile(20, objBullet, 12 + random(4), 3, 0.75, 24, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprUziShell)
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
        sprite_index = sprPAttackHandgun
        image_speed = 1
        image_index = 0
        objEffector.amp = 40

    }

    // Desert Eagle.
    if sprite_index = sprPWalkDesertEagle or sprite_index = sprPTurnDesertEagle {
        sound_ps(sndDesertEagle)
        scrHearPlayer()
        ammo -= 1
        reload = 14
        global.shake = 16
        warp_hud()
        projectile(20, objBullet, 17 + random(4), 4, 0.4, 50, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprUziShell)
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
        if sprite_index = sprPWalkDesertEagle {
            sprite_index = sprPAttackDesertEagle
            image_speed = 0.5
            image_index = 0
        }
        image_speed = 1
        image_index = 0
        objEffector.amp = 40

    }

    //Mauser C96.
    if sprite_index = sprPWalkMauser {
        sound_ps(sndMauser)
        scrHearPlayer()
        ammo -= 1
        reload = 6
        global.shake = 14
        warp_hud()
        projectile(20, objBullet, 14 + random(4), 3, 0.9, 16, sprBullet)
        scrCreateMuzzleFlash(36)

        create_casing(sprUziShell)
        sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
        sprite_index = sprPAttackMauser
        image_speed = 1
        image_index = 0
        objEffector.amp = 40

    }

    //Aries DB357 (.357 Magnum).
    if sprite_index = sprPWalkMagnum {
        sound_ps(sndMagnum)
        scrHearPlayer()
        ammo -= 1
        reload = 10
        global.shake = 16
        warp_hud()
        projectile(20, objBullet, 31, 0, 0.6, 40, sprBullet)
        scrCreateMuzzleFlash(36)
        sprite_index = sprPAttackMagnum
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 40
    }

    // Realizer (.44 Magnum).
    if sprite_index = sprPWalkRealizer {
        sound_ps(sndRealizer)
        scrHearPlayer()
        ammo -= 1
        reload = 10
        global.shake = 16
        warp_hud()
        projectile(20, objBullet, 28, 1, 1, 30, sprBullet)
        scrCreateMuzzleFlash(36)
        sprite_index = sprPAttackRealizer
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 40
    }

    //Bronson M310 (CheyTac Intervention).
    if sprite_index = sprPWalkSniper {
        sprite_index = sprPAttackSniper
        image_speed = 0.25
        sound_ps(sndIntervention)
        scrHearPlayer()
        ammo -= 1
        reload = 36
        global.shake = 18
        warp_hud()
        projectile(20, objBullet, 38, 4, 0.7, 90, sprBullet)
        PROJECTILE.image_xscale = 2
        PROJECTILE.caliber = 1
        scrCreateMuzzleFlash(36)
        create_casing(sprSniperShell)
        objEffector.amp = 50

    }

    //Sieger 300 (WA2000).
    if sprite_index = sprPWalkWA2000 {
        sprite_index = sprPAttackWA2000
        image_speed = 0.35
        sound_ps(sndWA2000)
        scrHearPlayer()
        ammo -= 1
        reload = 22
        global.shake = 11
        warp_hud()
        projectile(20, objBullet, 32, 0, 0.8, 70, sprBullet)
        PROJECTILE.image_xscale = 2
        PROJECTILE.caliber = 1
        scrCreateMuzzleFlash(36)

        create_casing(sprSniperShell)
        objEffector.amp = 30

    }

    // M1 Garand.
    if sprite_index = sprPWalkGarand {
        sprite_index = sprPAttackGarand
        image_speed = 0.25
        sound_ps(sndGarand)
        scrHearPlayer()
        ammo -= 1
        reload = 18
        if ammo = 0 sound_ps(sndGarandPing)
        global.shake = 13
        warp_hud()
        projectile(20, objBullet, 28, 1, 0.5, 35, sprBullet)
        PROJECTILE.image_xscale = 2
        PROJECTILE.caliber = 1
        scrCreateMuzzleFlash(26)
        create_casing(sprSniperShell)
        objEffector.amp = 50

    }

    //Bartoli TAC-12 (suppressed SPAS-12).
    if sprite_index = sprPWalkSilencedShotgun {
        sound_ps(sndSilencedShotgun)
        scrHearPlayer()
        ammo -= 1
        reload = 23
        global.shake = 14
        warp_hud()
        repeat(6) projectile(20, objBullet, 22 - random(3), 6, 0.2, 18, sprShotgunPellet)
        
        scrCreateMuzzleFlash(26)
        create_casing(sprShotgunShell)
        sound_ps(choose(snd12GA1, snd12GA2, snd12GA3))
        sprite_index = sprPAttackSilencedShotgun
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 35

    }

    //FAMAE.
    if sprite_index = sprPWalkFAMAE and global.automatic = 0 {
        if reload > 0 reload -= 1
        else {
            sprite_index = sprPAttackFAMAE
            image_speed = 1
            sound_ps(sndFAMAE)
            scrHearPlayer()
            ammo -= 1
            reload = 3
            global.shake = 12
            warp_hud()
            projectile(20, objBullet, 12 + random(4), 2, 0.8, 12, sprBullet)
            scrCreateMuzzleFlash(36)
            create_casing(sprUziShell)
            light = 20
            sound_ps(choose(snd9mm1, snd9mm2, snd9mm3))
            objEffector.amp = 40

        }
    }

    // Honey Badger.
    if sprite_index = sprPWalkSuppressedMG and global.automatic = 0 {
        sound_ps(sndSilencedMG)
        scrHearPlayer()
        ammo -= 1
        reload = 3
        global.shake = 13
        warp_hud()
        projectile(24, objBullet, 28, 3, 0.6, 18, sprBullet)
        scrCreateMuzzleFlash(36)
        create_casing(sprRifleShell)
        sound_ps(choose(snd5561, snd5562, snd5563))
        sprite_index = sprPAttackSuppressedMG
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 40
    }

    //STG 58 Elite (FAL).
    if sprite_index = sprPWalkFAL {
        sound_ps(sndFAL)
        scrHearPlayer()
        ammo -= 1
        reload = 5
        global.shake = 15
        warp_hud()
        projectile(20, objBullet, 28, 2, 0.1, 34, sprBullet)
        scrCreateMuzzleFlash(26)
        create_casing(sprRifleShell)
        sound_ps(choose(snd5561, snd5562, snd5563))
        sprite_index = sprPAttackFAL
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 40

    }

    //H&H Type 10 signal pistol (flare gun).
    if sprite_index = sprPWalkFlareGun {
        sound_ps(sndFlareGun)
        scrHearPlayer()
            //ammo -= 1
        reload = 16
        global.shake = 9
        warp_hud()
        flare = instance_create(x + lengthdir_x(26, dir - 7), y + lengthdir_y(20, dir - 7), objFlare)
        if instance_exists(flare) {
            flare.direction = dir - 5 + random(5)
            flare.speed = 8
            flare.image_angle = flare.direction
        }
        scrCreateMuzzleFlash(26)
        smoke = instance_create(x + lengthdir_x(26, dir - 7), y + lengthdir_y(26, dir - 7), objMuzzleSmoke)
        if instance_exists(smoke) {
            smoke.direction = dir
            smoke.image_angle = smoke.direction
        }

        sprite_index = sprPAttackFlareGun
        image_speed = 0.15
        image_index = 0
        objEffector.amp = 30
    }

    // Isando RGL-220 (MGL-140).
    if sprite_index = sprPWalkMGL {
        sound_ps(sndGrenadeLauncher)
        scrHearPlayer()
        ammo -= 1
        reload = 10
        global.shake = 13

        grenade = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objGrenade40mm)
        if instance_exists(grenade) {
            grenade.direction = dir - 5 + random(5)
            grenade.speed = 22
            grenade.image_angle = grenade.direction
        }
        smoke = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objMuzzleSmoke)
        if instance_exists(smoke) {
            smoke.direction = dir
            smoke.image_angle = smoke.direction
        }

        sprite_index = sprPAttackMGL
        image_speed = 1
        image_index = 0
        objEffector.amp = 30

    }

    //Isando CL-40 (M79).
    if sprite_index = sprPWalkM79 {
        sound_ps(sndM79)
        scrHearPlayer()
            //ammo -= 1
        reload = 14
        global.shake = 13

        grenade = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objGrenade40mm)
        if instance_exists(grenade) {
            grenade.direction = dir - 7 + random(14)
            grenade.speed = 18
            grenade.image_angle = grenade.direction
        }
        smoke = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objMuzzleSmoke)
        if instance_exists(smoke) {
            smoke.direction = dir
            smoke.image_angle = smoke.direction
        }

        sprite_index = sprPAttackM79
        image_speed = 0.35
        image_index = 0
        objEffector.amp = 30

    }

    //Multiplas rifle.
    if sprite_index = sprPWalkMultiplas {
        sound_ps(sndMultiplas)
        scrHearPlayer()
        ammo -= 1
        reload = 14
        global.shake = 10
        warp_hud()
        smoke = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objMuzzleSmoke)
        if instance_exists(smoke) {
            smoke.direction = dir
            smoke.image_angle = smoke.direction
        }
        repeat(12) {
            projectile(20, objBullet, 12 + random(4), 8, 0.7, 10, sprPlasmaRound)
            PROJECTILE.image_blend = c_red
        }
        create_casing(sprNailCasing)
        image_index = 0
        image_speed = 0.5
        sprite_index = sprPAttackMultiplas
    }

    // Disruptor rifle.
    if sprite_index = sprPWalkDisruptor {
        sound_ps(sndDisruptor)
        scrHearPlayer()
        ammo -= 1
        reload = 14
        global.shake = 13
        warp_hud()

        smoke = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objDisruptorSmoke)
        if instance_exists(smoke) {
            smoke.direction = dir
            smoke.image_angle = smoke.direction
        }

        flash = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBlastImpact)
        if instance_exists(flash) {
            flash.direction = dir
            flash.image_angle = flash.direction
        }

        bullet = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBeam)
        if instance_exists(bullet) {
            bullet.direction = dir
            bullet.image_angle = bullet.direction
            bullet.speed = 28
        }

        laser = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objLaser)
        if instance_exists(laser) {
            laser.direction = dir
            laser.image_angle = laser.direction
        }

        flare = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objElectricFlare)
        if instance_exists(flare) {
            flare.direction = dir
            flare.image_angle = flare.direction
        }

        repeat(4) {
            spark = instance_create(x - 5 + random(10), y - 5 + random(10), objElectricSpark)
            spark.direction = point_direction(x, y, spark.x, spark.y)
            spark.speed = 3 + random(2)
            spark.image_angle = spark.direction
        }

        sprite_index = sprPAttackDisruptor
        image_speed = 0.5
        image_index = 0
        objEffector.amp = 40
    }

    // SIMONE: Tornado-6
    if sprite_index = simoneWalk {
        sound_ps(choose(sndRevolver1, sndRevolver2, sndRevolver3))
        scrHearPlayer()
        ammo -= 1
        reload = 24
        global.shake = 16
        warp_hud()
        if ammo = 1 {
            projectile(20, objBullet, 16, 0, 0.6, 300, sprBullet)
            PROJECTILE.image_blend = make_colour_rgb(66, 209, 244)
        } else projectile(20, objBullet, 31, 0, 0.6, 66, sprBullet)
        PROJECTILE.caliber = 1
        scrCreateMuzzleFlash(36)
        if ammo = 1 stream.image_blend = make_colour_rgb(66, 209, 244)
        else stream.image_blend = c_white
        sprite_index = choose(simoneShoot1, simoneShoot2)
        image_index = 0
        image_speed = 0.5
        objEffector.amp = 40
    }

    // SIMONE: Shield
    if sprite_index = simoneWalkShield {
        sound_ps(choose(sndRevolver1, sndRevolver2, sndRevolver3))
        scrHearPlayer()
        ammo -= 1
        reload = 24
        global.shake = 16
        warp_hud()
        if ammo = 1 {
            projectile(20, objBullet, 50, 0, 0.6, 300, sprBullet)
            PROJECTILE.image_blend = make_colour_rgb(66, 209, 244)
        } else projectile(20, objBullet, 47, 0, 0.6, 66, sprBullet)
        PROJECTILE.caliber = 1
        scrCreateMuzzleFlash(36)
        if ammo = 1 stream.image_blend = make_colour_rgb(66, 209, 244)
        else stream.image_blend = c_white
        sprite_index = simoneAttackShield
        image_index = 0
        image_speed = 0.5
        objEffector.amp = 40
    }

    // PIERRETE: Shielded.
    if sprite_index = pierretteAimShield {
        sound_ps(sndFMG9)
        ammo -= 1
        reload = 1
        global.shake = 8
        projectile(24, objBullet, 21, 0, 0.8, 14, sprShockRound)
        smoke = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objMuzzleSmoke)
        smoke.direction = dir
        smoke.image_angle = smoke.direction

        sprite_index = pierretteAttackShield
        image_index = 0
        image_speed = 0.5
        objEffector.amp = 40
    }

    // PIERRETTE: Shotgun.
    if sprite_index = pierretteWalkShotgun {
        sound_ps(sndIthaca)
        scrHearPlayer()
        ammo -= 1
        reload = 15
        global.shake = 5
        if place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objWall)
        or place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objDoorV) {
            smoke = instance_create(x, y, objSmokeHit)
            smoke.image_angle = image_angle
            global.dir = dir
            with smoke move_contact_solid(global.dir, 16)
            scrDoorSwing()
        } else {
            repeat(6) projectile(16, objBullet, 12, 0, 0.8, 100, sprBreachingRound)
            smoke = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objMuzzleSmoke)
            smoke.direction = dir
            smoke.image_angle = smoke.direction
        }

        create_casing(sprShotgunShell)
        sprite_index = pierretteAttackShotgun
        image_speed = 0.4
        image_index = 0
        light = 20
    }
}
