// Define ammostring.
if global.ammo > 0 and scrPlayerHasGun() ammostring = string(global.ammo)
else ammostring = ""

// Append a zero before the ammostring if it's a single digit:
// (ie, '09' instead of '9' rounds left.
if string_length(ammostring) = 1 ammostring = '0' + string(global.ammo)

if global.combotime > 240 global.combotime = 240

// Clear ammo string if there's no ammo, or the level has been cleared.
if global.ammo < 0 ammostring = ""

// Logistics of tallying.
if global.drawscore < global.myscore - 1000 global.drawscore += 500
else {
    if global.drawscore < global.myscore - 200 global.drawscore += 100
    else {
        if global.drawscore < global.myscore - 20 global.drawscore += 20
        else {
            if global.drawscore < global.myscore global.drawscore += 1
        }
    }
}

// Calculate combo time.
if global.combotime > 0 global.combotime -= 1
else {
    if global.combotime = 0 {

        // Reset combo time and counter.
        global.combotime = 0
        global.combo = 0
    }
}
