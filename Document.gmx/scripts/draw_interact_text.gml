// JOHN
if global.character = 0 {
    if instance_exists(_WEAPON) {
        weapon = instance_nearest(objPlayer.x, objPlayer.y, _WEAPON)
        if point_distance(objPlayer.x, objPlayer.y, weapon.x, weapon.y) < 32 {
            text_interact = "[MMB] " + scrGetWeaponName(weapon.image_index)
        } else exit
    }
    
    if instance_exists(objKnockedOut) {
        ko = instance_nearest(objPlayer.x, objPlayer.y, objKnockedOut)
        if point_distance(objPlayer.x, objPlayer.y, ko.x, ko.y) < 32 {
            text_interact = "[SPACE] Execute"
        } else exit
    }
    
    if instance_exists(objVendingMachine) {
        vend = instance_nearest(objPlayer.x, objPlayer.y, objVendingMachine)
        if point_distance(objPlayer.x, objPlayer.y, vend.x, vend.y) < 32 text_interact = "[E] Thirsty?"
    } else exit
    
    if instance_exists(objDoorV) {
        door = instance_nearest(objPlayer.x, objPlayer.y, objDoorV)
        if point_distance(objPlayer.x, objPlayer.y, door.x, door.y) < 32 text_interact = "[E] Open door"
    }
}

// PIERRETTE
if global.character = 2 {
    if objPlayer.sprite_index = pierretteWalkUnarmed and global.done = 0 {
        text_interact = "'LMB': Ready up"
    }
    
    if pierretteHasShield(objPlayer.sprite_index) {
        text_interact = "'F': Plant shield#'G': Throw flashbang"
    }
    
    if pierretteIsUnshielded(objPlayer.sprite_index) {
        text_interact = "'F': Retract shield#'G': Throw flashbang#'RMB': Concussive blast"
    }
    
    if instance_exists(objPierretteShield) {
        shield = instance_nearest(objPlayer.x, objPlayer.y, objPierretteShield)
        if point_distance(objPlayer.x, objPlayer.y, shield.x, shield.y) < 32 text_interact = "'E': Pick up shield" 
    }
    
    if instance_exists(objDoorV) {
        door = instance_nearest(objPlayer.x, objPlayer.y, objDoorV)
        if point_distance(objPlayer.x, objPlayer.y, door.x, door.y) < 32 text_interact = "'E': Open door" 
    }
}

// SIMONE
if global.character = 3 {
    if instance_exists(objEnemyGiveUp) {
        submit = instance_nearest(objPlayer.x, objPlayer.y, objEnemyGiveUp)
        if point_distance(objPlayer.x, objPlayer.y, submit.x, submit.y) < 32 {
            text_interact = "[SPACE] Take human shield"
        } else text_interact = ""
    }

    if objPlayer.sprite_index = simoneWalkShield
    or objPlayer.sprite_index = simoneAttackShield
    text_interact = "[MMB] Execute"
    else text_interact = ""
    
    if instance_exists(objDoorV) {
        door = instance_nearest(objPlayer.x, objPlayer.y, objDoorV)
        if point_distance(objPlayer.x, objPlayer.y, door.x, door.y) < 32 text_interact = "[E] Open door" 
    }
}

/*if room = rmTutorialFloor1 {
    if instance_exists(objVictim3) {
        if point_distance(objPlayer.x, objPlayer.y, objVictim3.x, objVictim3.y) > 72 text_interact = "WALK WITH [WASD]"
        else text_interact = "USE THE DOOR TO KNOCK HIM OUT"
    }
    if instance_exists(objVictim3KnockedOut) or instance_exists(objPigKillStomp) or instance_exists(objPigKillBlunt) {
        text_interact = "PRESS [SPACE] TO EXECUTE KNOCKED OUT ENEMIES"
    }
    if instance_number(objVictim3) + instance_number(objVictim3KnockedOut) = 0 and instance_exists(objPigButcher) {
        text_interact = "HOLD [SHIFT] TO LOOK AROUND"
        if instance_exists(objHammer) {
            if point_distance(objPlayer.x, objPlayer.y, objHammer.x, objHammer.y) < 48 text_interact = "USE [RMB] TO PICK UP HAMMER"
        }
        tutorialtime = 240
    }
    if !instance_exists(objHammer) {
        if tutorialtime > 120 text_interact = "SWING WEAPON WITH [LMB]"
        else text_interact = "THROW WEAPON WITH [RMB]"
    }
    if instance_number(objDeadBody) > 1 {
        text_interact = "KILL EVERYONE AND PROCEED TO THE NEXT FLOOR"
    }
    if instance_number(objEnemy) + instance_number(objKnockedOut) = 0 text_interact = "PROCEED TO THE NEXT FLOOR"
}
if room = rmTutorialFloor2 {
    if instance_exists(objShotgunWall) {
        text_interact = "PICK UP THE SHOTGUN"
        tutorialtime = 240
    }
    if instance_exists(objPigButcher) {
        if objPigButcher.sprite_index = sprPigWalkDoubleBarrel or sprite_index = sprPigAttackDoubleBarrel1 or sprite_index = sprPigAttackDoubleBarrel2 {
            if (!instance_exists(global.enemy)) and(instance_exists(objVictim6)) {
                if tutorialtime > 120 text_interact = "HOLD MOUSE OVER ENEMY"
                else text_interact = "PRESS [SCROLL WHEEL] TO LOCK ON"
            } else text_interact = "PRESS [LMB] TO SHOOT"
        }
    }
    if instance_number(objEnemy) = 0 and instance_exists(objEnemyCrawl) text_interact = "FINISH HER"
    if instance_exists(objPKillRape) text_interact = ""
}
if instance_exists(objPlayerZebra) {
    text_interact = "HOLD [SPACE] TO ROLL"
}
if instance_exists(objPlayerBear) {
    if objPlayerBear.sprite_index = sprBearWalkSpecial {
        tutorialtime += 0.5
        if tutorialtime > 120 text_interact = "HOLD [RMB] TO AIM LEFT AND RIGHT"
        if tutorialtime <= 120 text_interact = "HOLD [RMB]+[SHIFT] TO AIM FORWARD AND BACK"
    }
}
if instance_exists(objPlayerSwanChainsaw) {
    tutorialtime += 0.5
    if tutorialtime > 160 text_interact = "PRESS [RMB] TO SHOOT GUN"
    if tutorialtime >= 80 and tutorialtime <= 160 text_interact = "PRESS [LMB] TO SWING CHAINSAW"
    if tutorialtime < 80 text_interact = "2ND SWAN PICKS UP GUNS WHEN OUT OF AMMO"
}*/

if string_length(text_interact) > 0 {

    if global.character = 0 {
        draw_set_font(fntHUD)
        draw_set_halign(fa_center)
    
        draw_set_alpha(0.8)
        draw_set_color(global.nigredo)
        draw_rectangle(view_wview[0] / 2 - string_width(text_interact) * 0.1,
            222 - 8, //view_hview[0] * 0.9 - 6, 
            view_wview[0] / 2 + string_width(text_interact) * 0.1,
            222 + 8, //view_hview[0] * 0.9 + 6, 
            0)
        draw_set_alpha(1)
    
        draw_set_color(global.albedo)
        draw_text_transformed(view_wview[0] / 2, 222, text_interact, 0.125, 0.125, 0)
    }
    
    if global.character = 2 {
        draw_set_font(fntDamage)
        draw_set_halign(fa_left)
    
        draw_set_color(global.albedo)
        draw_text_transformed(24 + gunx, 172, text_interact, 0.125, 0.125, 0)
    }
}
