if scrEnemyIsUnarmed(sprite_index) noweapon = 1 else {
    my_id = instance_create(x, y, objWeaponThrow)
    my_id.direction = other.direction - 70 + random(40)
    my_id.speed = 2 + random(2)
    my_id.friction = 0.15
    my_id.image_index = scrCurrentWeaponExt(sprite_index)
    my_id.ammo = ammo
}
