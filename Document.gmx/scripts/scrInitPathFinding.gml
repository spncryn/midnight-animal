global.grid = mp_grid_create(0, 0, room_width / 16, room_height / 16, 16, 16)

mp_grid_add_instances(global.grid,objWall,1)
mp_grid_add_instances(global.grid, objWindow, 1)
mp_grid_add_instances(global.grid, objBreakableParent, 1)
mp_grid_add_instances(global.grid, objFurniture, 1)
mp_grid_add_instances(global.grid, objSolid, 1)
mp_grid_add_instances(global.grid, objInvisibleBoundary, 1)
mp_grid_add_instances(global.grid, objWindowH, 1)
mp_grid_add_instances(global.grid, objWindowV, 1) 
mp_grid_add_instances(global.grid, objGlassPanelH, 1)
mp_grid_add_instances(global.grid, objGlassPanelV, 1)

with objSlidingDoorV {
    if solid = 1 mp_grid_add_instances(global.grid, id, 1)
}
with objSlidingDoorH {
    if solid = 1 mp_grid_add_instances(global.grid, id, 1)
}
with objDoorV {
    if solid = 1 mp_grid_add_instances(global.grid, id, 1)
}
with objDoorH {
    if solid = 1 mp_grid_add_instances(global.grid, id, 1)
}

