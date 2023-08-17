scrMoveSolidOn()
if !scrPlaceFree(x + lengthdir_x(8, direction), y + lengthdir_y(8, direction)) {
    direction += diradd * 10
} else {
    if alert = 0 {
        direction = round(direction * 0.1) * 10 speed = 1
    }
    if abs(frac(direction * (1 / 90))) > 0 direction += diradd * 10
}
scrMoveSolidOff()
