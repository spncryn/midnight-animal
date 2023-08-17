///glr_debug_draw()

if(asset_get_index("glr_font_debug") != -1)
{
    //Arial (size: 8)
    draw_set_font(glr_font_debug);
}

var l = global.GLR_DEBUG_OPTIONS;
var sz = ds_list_size(l);

var gui_width = display_get_gui_width();

var quality = glr_get_quality();
var fxaa = glr_get_enabled_fxaa();
var directional = glr_get_enabled_directional();
var occlusion = glr_get_enabled_occlusion();
var blur = glr_get_enabled_blur();

var col = draw_get_color();
var alpha = draw_get_alpha();

var str = ""; 

var sw = 100;

var fxaa_str, directional_str, occlusion_str, blur_str;
if(fxaa) fxaa_str = "ON"; else fxaa_str = "OFF";
if(directional) directional_str = "ON"; else directional_str = "OFF";
if(occlusion) occlusion_str = "ON"; else occlusion_str = "OFF";
if(blur) blur_str = "ON"; else blur_str = "OFF";

if(global.GLR_DEBUG_ACTIVE)
{
    str =  "[ GLARE ]   #" +
    string(fps)+" fps#"+
    "Quality: "+string(quality*100)+ "%#"+ 
    "ViewSize: "+string(global.GLR_WIDTH)+"x"+string(global.GLR_HEIGHT)+ "#"+
    string(ds_list_size(global.GLR_MESH_DYN_LIST))+" dynamic meshes#"+
    string(ds_list_size(global.GLR_MESH_STC_LIST))+" static meshes#"+
    string(ds_list_size(global.GLR_LIGHT_LIST))+" lights#"+
    string(ds_list_size(global.GLR_LIGHT_LIST_SIMPLE))+" simple lights#"+
    "Fxaa: "+fxaa_str+"#"+
    "Directional: "+directional_str+"#"+
    "Occlusion: "+occlusion_str+"#"+
    "Blur: "+blur_str;
    
    sh = 200; 
}
else
{
    str =  "[ GLARE ]           #" +
    string(fps)+" fps";
    
    sh = 50; 
}
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(5,5, sw+20, sh+20, 0);
draw_set_color(c_white);
draw_rectangle(5,5, sw+20, sh+20, 1);
draw_text(15, 15, str ); 

var icon;
if(global.GLR_DEBUG_ACTIVE)
    icon = "_";
else
    icon = ">";
  
//button
var px = sw - 5;
var py = 8;
var w = 18;
var h = 18;
var clicked = false;
for(var i = 0; i < 5; i++)
{
    if(device_mouse_check_button_pressed(i, mb_left))
    {
        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);
        if(mx>px && my>py && mx<px+w && my<py+h)
        {
            clicked = true;
            break;
        }
    }
}
    
if(clicked)
{
    draw_set_color(c_green);
    global.GLR_DEBUG_ACTIVE = !global.GLR_DEBUG_ACTIVE;
}
else
    draw_set_color(c_white);
draw_set_alpha(0.5);
draw_rectangle(px, py, px+w, py+h, 0);
draw_set_alpha(1);
draw_set_color(c_black);
draw_text(px+5, py+5, icon);
    

if(global.GLR_DEBUG_ACTIVE)
{ 
     
    var text;
    var padding = 5;
    var spacing = 8; 
    var h = (15+padding);
        
    
    var px_start = sw + 25
    var px = px_start;
    var py = 10;
    
    for(var j = 0; j < sz; j++)
    {
        var text = l[| j];
        
        var w = 7 * string_length(text) + padding * 2;
        
        var clicked = false;
        for(var i = 0; i < 5; i++)
        {
            if(device_mouse_check_button_pressed(i, mb_left))
            {
                var mx = device_mouse_x_to_gui(i);
                var my = device_mouse_y_to_gui(i);
                if(mx>px && my>py && mx<px+w && my<py+h)
                {
                    clicked = true;
                    break;
                }
            }
        }
    
        if(clicked)
            draw_set_color(c_green);
        else
            draw_set_color(c_white);
    
        draw_set_alpha(0.5);
        if(px + w > gui_width)
        {
            px = px_start;
            py += h + spacing;
        }
        draw_rectangle(px, py, px+w, py+h, 0);
        draw_set_alpha(1);
        draw_set_color(c_black);
        draw_text(px+padding, py+padding, text);
        
        px += w + spacing;
        
        if(clicked)
        {
            switch(text)
            {
                case "Fxaa":
                    fxaa = !fxaa;
                    glr_enable_fxaa(fxaa);
                    break;
                case "Directional Light":
                    directional = !directional;
                    glr_enable_directional(directional);
                    break;
                case "Occlusion":
                    occlusion = !occlusion;
                    glr_enable_occlusion(occlusion);
                    break;
                case "Shadow Blur":
                    blur = !blur;
                    glr_enable_blur(blur);
                    break;
                case "Quality":
                    quality += 0.25;
                    if(quality > 1)
                        quality = 0.25;
                    glr_set_quality(quality);
                    glr_set_directional_quality(quality);
                    break;
                    
            }   
        
        }
        
    } 
   
}
draw_set_color(col);
draw_set_alpha(1);
