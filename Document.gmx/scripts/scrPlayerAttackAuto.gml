if objPlayer.sprite_index = sprPWalkBossgun 
//or objPlayer.sprite_index = sprPActivatePersona
or instance_exists(mnCharacterSelect) nothing = 1
else {
    if reload <= 0 {
        if ammo > 0 and !scrIsReloading(sprite_index) scrPlayerShootAuto()
        image_angle = 0
    }
}
