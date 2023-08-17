/// register_enemy_hit(projectile)

knockback(other.damage / 5)

// Create effects.
sound_ps(choose(sndBulletFlesh3, sndBulletFlesh2, sndBulletFlesh1))
sound_ps(sndHitMarker)
objEffector.hitalpha = 1

// Automatically alert the enemy.
alert = 1

// Hit effects.
eflash = true
hit_enemy = true
alarm[1] = 5

// Subtract damage, with visual effects.
hp -= other.damage

if other.sprite_index = sprBullet or other.sprite_index = sprBulletRicochet {
    scrBloodShot(x, y, 1)
    create_damage_projectile(random(3), global.albedo, 1, x + choose(-random(24), random(24)), y - 5)
}

if other.sprite_index = sprShockRound {
    create_damage_projectile(random(3), global.c_shock, 1, x + choose(-random(24), random(24)), y - 5)
    sound_ps(sndShockImpact)
    shock = instance_create(x, y, objElectricity)
    shock.image_xscale = 0.25 + random(0.25)
    shock.image_yscale = shock.image_xscale
    if round(random(10)) = 2 {
        affected = 1 
        shocked = 1
    }
}

// Add to current combo.
global.combotime = 240
global.combo += 1

// Destroy the bullet.
with other instance_destroy()

// Kill the enemy if their HP falls under 0.
if hp <= 0 {
    if other.sprite_index = sprBullet or other.sprite_index = sprBulletRicochet or other.sprite_index = sprShotgunPellet scrEnemyDieShot(argument0)
    if other.sprite_index = sprShockRound scrEnemyDieStunned(argument0)
}

