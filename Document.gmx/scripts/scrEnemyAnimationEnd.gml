update = 0

// Guns.
if sprite_index = sprEAttackHandgun {
    sprite_index = sprEWalkHandgun update = 1
}
if sprite_index = sprEAttackShotgun {
    sprite_index = sprEWalkShotgun update = 1
}
if sprite_index = sprEAttackHK417 {
    sprite_index = sprEWalkHK417 update = 1
}
if sprite_index = sprEAttackDoubleBarrel1 or sprite_index = sprEAttackDoubleBarrel2 {
    sprite_index = sprEWalkDoubleBarrel update = 1
}
if sprite_index = sprEAttackAK {
    sprite_index = sprEWalkAK update = 1
}
if sprite_index = sprEAttackThompson {
    sprite_index = sprEWalkThompson update = 1
}
if sprite_index = sprEAttackUzi {
    sprite_index = sprEWalkUzi update = 1
}
// Melee weapons.
if sprite_index = sprEAttackClub {
    sprite_index = sprEWalkClub update = 1
}
if sprite_index = sprEAttackPipe {
    sprite_index = sprEWalkPipe update = 1
}
if sprite_index = sprEAttackBat {
    sprite_index = sprEWalkBat update = 1
}
if sprite_index = sprEAttackKnife {
    sprite_index = sprEWalkKnife update = 1
}
if sprite_index = sprEAttackChain {
    sprite_index = sprEWalkChain update = 1
}
if sprite_index = sprEAttackMachete {
    sprite_index = sprEWalkMachete update = 1
}

if update = 1 {
    image_speed = 0
    image_yscale = -image_yscale
}

if scrIsSearching(sprite_index) {
    sprite_index = scrStopSearch(sprite_index)
    image_speed = 0
}

if sprite_index = sprEStumble sprite_index = current
