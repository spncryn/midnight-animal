scrBloodShot(x, y, 2)
sound_ps(choose(sndBulletFlesh3, sndBulletFlesh2, sndBulletFlesh1))
if global.blur = 0 global.blur = 20 else global.blur += 5
hp -= other.damage
create_damage_projectile(random(3), global.c_damage, 1, x + choose(-random(24), random(24)), y - 5)
with other instance_destroy()

// Death.
if hp <= 0 {

    // Create the player's dead body.
    my_id = instance_create(x, y, objPlayerDead)
    instance_destroy()
}
