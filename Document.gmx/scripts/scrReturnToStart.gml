if path_index >= 0 path_end()
image_xscale = 2
image_yscale = 2
while !scrPlaceFree(startx, starty) {
    startx += -2 + random(4) starty += -2 + random(4)
}
if !mp_grid_path(global.grid, argument0, x, y, startx, starty, 1) alert = 0
else {
    path_start(argument0, 1, 0, 1)
}
image_xscale = 1
image_yscale = 1

