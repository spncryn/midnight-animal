if object_get_parent(object_index)=objEnemyIdle {
    sprite_index = choose(sprEWalkDoubleBarrel, sprEWalkHandgun, sprEWalkSilencer, sprEWalkUzi)
    if sprite_index = sprEWalkDoubleBarrel ammo = 2
    if sprite_index = sprEWalkHandgun ammo = 13
    if sprite_index = sprEWalkSilencer ammo = 10
    if sprite_index = sprEWalkUzi ammo = 30
}
