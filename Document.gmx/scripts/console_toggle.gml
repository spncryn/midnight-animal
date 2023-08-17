/// console_toggle(console)
var c=argument0;

/* Clear keyboard string */
keyboard_string = "";

/* Enable */
if !c[? "active"] {
    
    // Capture screen image.
    //screen_save_part("console.png",0,0,display_get_width(),display_get_height());
    //sprite=sprite_add("console.png",0,0,0,0,0);
    //c[? "sprite"] = sprite;
    
    // Deactivate background.
    //instance_deactivate_all(true);
    
    //instance_activate_object(objEffector)
    //instance_activate_object(objPlayerMouse)
    
    global.active = 0
    keyboard_string = "";
    c[? "active"] = true;

} else {
    
    global.active = 1
    //instance_activate_all();
    
    /* Disable */
    c[? "active"] = false;
    c[? "select"] = 0;
    c[? "string"] = "";
    c[? "string_pos"] = 1;
}



