//Screen shake.
if global.shake > 0 {
    if global.shake + 1 > 0 global.shake -= 0.5 else global.shake = 0
    //if global.xbox = 1 setrumble(0, 0, global.shake * (1 / 10) * 65535)
    view_xview[0] += -global.shake * 0.16 + random(global.shake * 0.6)
    view_yview[0] += -global.shake * 0.16 + random(global.shake * 0.6)
    view_angle[0] = (random(global.shake) - global.shake / 2) * 0.15
} 

// Warping UI.
if global.deathshake > 0 global.deathshake -= 0.5
if global.screeneffect > 0 global.screeneffect -= 0.5
if global.blur > 0 global.blur -= 1 else global.blur = 0
if hudflash > 0 hudflash -= 0.5




