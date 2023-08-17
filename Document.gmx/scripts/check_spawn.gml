var spawn = floor(random(argument0))

if spawn = 0 {
    var side = floor(random(4))
    switch side {
    
        // Left.
        case 0:
        enemy = instance_create(0, random(room_height), choose(objEnemyMeleeRandom, objEnemyMeleeRandom))
        enemy.direction = random(360)
        break;
        
        // Top.
        case 1:
        enemy = instance_create(random(room_width), 0, choose(objEnemyMeleeRandom, objEnemyMeleeRandom))
        enemy.direction = random(360)
        break;
        
        // Right.
        case 2:
        enemy = instance_create(random(room_width), random(room_height), choose(objEnemyMeleeRandom, objEnemyMeleeRandom))
        enemy.direction = random(360)
        break;
        
        // Bottom.
        case 3:
        enemy = instance_create(random(room_width), room_height, choose(objEnemyMeleeRandom, objEnemyMeleeRandom))
        enemy.direction = random(360)
        break;

    }
}
