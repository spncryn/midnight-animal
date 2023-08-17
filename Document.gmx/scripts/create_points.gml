/// create_points(text)
if global.hud = 1 {
    points = instance_create(x, y - 24, objPoints)
    points.text = argument0
    points. direction = random(180)
}
