/// drop_health(random?, chance, number of drops)

if argument0 = 0 {
    repeat(argument2) {
        spawn = instance_create(x, y, objHealthPickup)
    }
} else {
    if round(irandom(argument1)) = 1 {
        repeat(argument2) {
            spawn = instance_create(x, y, objHealthPickup)
        }
    }
}

