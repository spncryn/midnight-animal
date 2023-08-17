/// console_toggle(console)
var c=argument0;

/* Clear keyboard string */
keyboard_string = "";

/* Enable */
if !c[? "active"] {
    
    var sfc_w = surface_get_width(application_surface);
    var sfc_h = surface_get_height(application_surface);
    var sfc = surface_create(sfc_w,sfc_h);
    
    surface_set_target(sfc);
        draw_set_colour_write_enable(false,false,false,true);
        draw_clear(c_black);
        draw_rectangle_colour(0,0,sfc_w,sfc_h,c_black,c_black,c_black,c_black,false);
        draw_set_colour_write_enable(true,true,true,false);
        draw_surface(application_surface,0,0);
        var bg = background_create_from_surface(sfc,0,0,sfc_w,sfc_h,false,false);
    surface_reset_target();
    draw_set_colour_write_enable(true,true,true,true);
    surface_free(sfc);
    c[? "bg"] = bg;
    
    instance_deactivate_all(true);
    
    keyboard_string = "";
    c[? "active"] = true;

} else {
    
    instance_activate_all();
    
    /* Disable */
    c[? "active"] = false;
    c[? "select"] = 0;
    c[? "string"] = "";
    c[? "string_pos"] = 1;

}



