if file_exists("tempsave.sav") {
    scrResetGore() 
    //with(objDoorV){image_angle=0; glr_mesh_set_rotation(mesh, image_angle); glr_mesh_update(mesh);}
    game_load("tempsave.sav")
}
