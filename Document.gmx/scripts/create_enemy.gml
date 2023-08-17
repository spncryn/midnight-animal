/// create_enemy(enemy type, sprite, alert?, ammo)
enemy = instance_create(x, y, argument0)
enemy.sprite_index = argument1
enemy.direction = direction
enemy.image_angle = image_angle
enemy.alert = argument2
enemy.ammo = argument3
enemy.hp = (hp / max_hp) * enemy.max_hp

// If the player is locked onto the previous enemy 
// during a shift in the enemy's state, retain the 
// lock-on across state shifts.
if global.enemy = id global.enemy = enemy

// Destroys current enemy.
instance_destroy()
