currentsprite = scrCurrentWeaponExt(sprite_index)

if scrCanTurn(sprite_index) {
    if scrIsTurning(sprite_index) {
        image_speed = 0
        if turnwait > 0 turnwait -= 1
        else {
            if image_index > 2 image_index -= 0.25
            else {
                if image_index < 1.9 image_index += 0.1
                else {
                    image_index = 0 sprite_index = scrGetTurnEnd(currentsprite)
                }
            }
        }
    }

    if scrAngleDifference(dir, lastdir) < -40 {
        image_index = 11.75
        turnwait = 1
        left = 1
        sprite_index = scrGetTurn(currentsprite)
    }

    if scrAngleDifference(dir, lastdir) > 40 {
        image_index = 11.75
        turnwait = 1
        left = -1
        sprite_index = scrGetTurn(currentsprite)
    }

    lastdir = dir
}

