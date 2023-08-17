// John.
if global.character = 0 {
    hp = 200
    max_hp = 200
    hp_norm = (hp / max_hp) * 100
    hp_alpha = 1
    max_shield = 150
    hp_shield = 150
    health_boost = 0.33 // Amount of total health restored with health packs.
    throw_reload = 240
}

// Thomas.
if global.character = 1 {
    hp = 150
    max_hp = 150
    hp_norm = (hp / max_hp) * 100
    hp_alpha = 1
    max_shield = 150
    hp_shield = 150
    health_boost = 0.25 // Amount of total health restored with health packs.
    throw_reload = 60
}

// Pierrette.
if global.character = 2 {
    hp = 300
    max_hp = 300
    hp_norm = (hp / max_hp) * 100
    hp_alpha = 1
    max_shield = 600
    hp_shield = 600
    health_boost = 0.2 // Amount of total health restored with health packs.
    throw_reload = 240
}

// Simone.
if global.character = 2 {
    hp = 200
    max_hp = 200
    hp_norm = (hp / max_hp) * 100
    hp_alpha = 1
    max_shield = 150
    hp_shield = 150
    health_boost = 0.33 // Amount of total health restored with health packs.
    throw_reload = 480
}
