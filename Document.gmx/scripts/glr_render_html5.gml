///glr_render()
 
/*
    <=============== DESCRIPTION ===============>
        Updates all lights and shadows
        Use this function in Draw Begin 
    <===========================================>
*/

var l_id, l_x, l_y, l_active,l_rotation,l_xscale,l_yscale,l_bcircle, l_tolerance, l_shadow_strength;
var l_color, l_alpha, l_intensity,l_sprite,l_spr_index,l_surf,l_shadowsprite_surf;
var l_layer,l_static, l_is_clear;
var mesh, px, py, buf, rot,  xscale, yscale, zdepth, shadow_strength,depth_offset;
var spr, tex, sub;
var test_x, test_y, render;
var sz;

texture_set_repeat(true);
if(view_enabled){
    var v_x0 = view_xview,
    v_y0 = view_yview,
    v_x1 = v_x0+view_wview,
    v_y1 = v_y0+view_hview;
}else{
    var v_x0 = 0,
    v_y0 = 0,
    v_x1 = room_width,
    v_y1 = room_height;
}

if(!surface_exists(global.GLR_MAIN_SURFACE)){
    global.GLR_MAIN_SURFACE = surface_create(global.GLR_MAIN_SURFACE_WIDTH, global.GLR_MAIN_SURFACE_HEIGHT);
    if(!surface_exists(global.GLR_MAIN_SURFACE)){
        return 0;
    }
}

//calculate the surface
d3d_set_projection_ortho(0,0,global.GLR_WIDTH /global.GLR_ZOOM,global.GLR_HEIGHT/global.GLR_ZOOM,0);
main_viewproj_mat = matrix_multiply(
    matrix_build(-v_x0+1, -v_y0+1,0,0,0,0,1,1,1),  
    matrix_multiply(matrix_get(matrix_view), matrix_get(matrix_projection))
) 

var render = true;
d3d_set_culling(true);

matrix_set(matrix_world, global.GLR_MATRIX_WORLD_IDENTITY);

var light_list_size = ds_list_size(global.GLR_LIGHT_LIST);
for(var i = 0; i < light_list_size ; i++)
{
    l_id = global.GLR_LIGHT_LIST[| i];
    
    if(!l_id[| GLR_LIGHT.active]) continue;
    
    //transform
    l_x =  l_id[| GLR_LIGHT.px];
    l_y =  l_id[| GLR_LIGHT.py];
    l_rotation = l_id[| GLR_LIGHT.rotation];
    l_xscale = l_id[| GLR_LIGHT.xscale];
    if(l_xscale == 0)
        continue;
    l_yscale = l_id[| GLR_LIGHT.yscale];
    if(l_yscale == 0)
        continue;
    
    l_bcircle = l_id[| GLR_LIGHT.bcircle];
    
    //out of view
    test_x = l_x - clamp(l_x, v_x0,v_x1);
    test_y = l_y - clamp(l_y, v_y0, v_y1); 
    
    var outofview = (test_x * test_x + test_y * test_y > l_bcircle * l_bcircle);
    l_id[| GLR_LIGHT.outofview] = outofview;
    if (outofview) {continue;}
    
    //info
    l_color = l_id[| GLR_LIGHT.color];;
    l_intensity = l_id[| GLR_LIGHT.intensity];
    l_sprite = l_id[| GLR_LIGHT.sprite];
    l_spr_index = l_id[| GLR_LIGHT.subimage];
     
    l_layer = l_id[| GLR_LIGHT.layer];   
    l_static = l_id[| GLR_LIGHT.static];
     
    var l_spr_xo = sprite_get_xoffset(l_sprite);
    var l_spr_yo = sprite_get_yoffset(l_sprite);
    var l_spr_w = sprite_get_width(l_sprite); 
    if(l_spr_w == 0)
        continue;
    var l_spr_h = sprite_get_height(l_sprite);
    if(l_spr_h == 0)
        continue;
    
     
    var l_xo = l_spr_xo * l_xscale;
    var l_yo = l_spr_yo * l_yscale;
    var l_w = l_spr_w * l_xscale;
    var l_h = l_spr_h * l_yscale;
    var l_surf_xo = l_spr_xo;
    var l_surf_yo = l_spr_yo;
    
    
    var l_depth = l_id[| GLR_LIGHT.zdepth];
    
    if (l_rotation == 0)
    {
        if(l_x - l_xo > v_x1) continue;
        if(l_y - l_yo > v_y1) continue;
        if(l_x - l_xo + l_w < v_x0) continue;
        if(l_y - l_yo + l_h < v_y0) continue;
    }
 
    var tra_matrix = matrix_build(l_xo/l_w * 2 - 1, 1- l_yo/l_h * 2 , 0, 0, 0, 0,  1/l_xscale,  1/l_yscale, 1);  
    var light_matrix_complete = matrix_multiply(l_id[| GLR_LIGHT.matrix], main_viewproj_mat) ;

    //----------------------------------------------
    //  STATIC 
    //----------------------------------------------
    if(l_static)
    { 
        var l_shadowmap = l_id[| GLR_LIGHT.surf_shadowmap];
        
        if ((l_shadowmap == -1 || (l_shadowmap != -1 && !surface_exists(l_shadowmap)) ) )
        { 
            l_id[| GLR_LIGHT.is_clear] = false; // not clear
            l_shadowmap = surface_create(l_spr_w, l_spr_h);
            if(!surface_exists(l_shadowmap))
                return 0;
            
            
            l_shadow_strength = l_id[| GLR_LIGHT.shadow_strength];
            l_tolerance = l_id[| GLR_LIGHT.tolerance];
            
            l_id[| GLR_LIGHT.surf_shadowmap] = l_shadowmap; 
            is_clear = true;
            if(global.GLR_SHADOWSPRITE_ENABLED){

                if(!surface_exists(l_id[| GLR_LIGHT.surf_shadowsprite1])){
                    l_id[| GLR_LIGHT.surf_shadowsprite1] = surface_create(l_spr_w, l_spr_h);
                    if(!surface_exists(l_id[| GLR_LIGHT.surf_shadowsprite1]))
                        return 0;
                }
                l_shadowsprite_surf = l_id[| GLR_LIGHT.surf_shadowsprite1];
         
                surface_set_target(l_shadowsprite_surf);
                draw_clear_alpha(c_black,0);
                  
                var proj_matrix = matrix_get(matrix_projection); 
                d3d_set_culling(false);
                
                d3d_set_projection_ortho(l_x - l_w/2 , l_y - l_h/2 , l_w, l_h, - l_rotation);
                matrix_set(matrix_projection, matrix_multiply(proj_matrix, tra_matrix))
                
                      
                sz = ds_list_size(global.GLR_SPR_STC_LIST);
                for(j = 0; j < sz; j++)
                {
                    spr = global.GLR_SPR_STC_LIST[| j];
                    //check layer
                    if(spr[| GLR_SHADOWSPRITE.active] && l_layer >= spr[| GLR_SHADOWSPRITE.layer])
                    {
                        tex = spr[| GLR_SHADOWSPRITE.sprite];
                        sub = spr[| GLR_SHADOWSPRITE.subimage];
                        px = spr[| GLR_SHADOWSPRITE.px];
                        py = spr[| GLR_SHADOWSPRITE.py]; 
                        xscale = spr[| GLR_SHADOWSPRITE.xscale];
                        yscale = spr[| GLR_SHADOWSPRITE.yscale];
                        rot = spr[| GLR_SHADOWSPRITE.rotation];
                        // bounding circle
                        if(point_distance(px, py, l_x, l_y) > spr[| GLR_SHADOWSPRITE.bcircle] * max(abs(xscale),abs(yscale)) + l_bcircle - l_tolerance){
                            continue;
                        }
                        is_clear = false;
                        d3d_transform_set_identity(); 
                        d3d_transform_add_scaling(xscale, yscale, 1);
                        d3d_transform_add_rotation_z(rot);
                        d3d_transform_add_translation(px, py, 0);
                  
                        draw_sprite(tex, sub, 0, 0);  
                    }
                }
                d3d_transform_set_identity();
                surface_reset_target();
                
                d3d_set_culling(true); 
                //shadowsprites rendering static
                if(!surface_exists(l_id[|  GLR_LIGHT.surf_shadowsprite2]))
                {
                    l_id[| GLR_LIGHT.surf_shadowsprite2] = surface_create(l_spr_w, l_spr_h);
                    if(!surface_exists(l_id[| GLR_LIGHT.surf_shadowsprite2]))
                        return 0;
                }
                l_shadowsprite_surf2 = l_id[| GLR_LIGHT.surf_shadowsprite2]; 
                    
                if(!is_clear)
                {
                    
                    var scal = 0.0007; 
                    var pow = 0.160;
                    surface_set_target(l_shadowsprite_surf2);
                    draw_clear_alpha(0, 0);
                    shader_set(glr_shader_shadow_sprite);
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_OFFSET_SPR, l_xo/l_w , l_yo/l_h );
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_SCALE_SPR, scal );
                    draw_surface(l_shadowsprite_surf,0,0);
                    shader_reset();
                    
                    surface_reset_target();
                    
                    repeat(2)
                    {
                        pow *= 1.358;
                        scal = power(0.0007, pow);
                        surface_set_target(l_shadowsprite_surf);
                        shader_set(glr_shader_shadow_sprite);
                        shader_set_uniform_f(global.GLR_UNIF_LIGHT_OFFSET_SPR, l_xo/l_w , l_yo/l_h );
                        shader_set_uniform_f(global.GLR_UNIF_LIGHT_SCALE_SPR, scal );
                        draw_surface(l_shadowsprite_surf2,0,0);
                        shader_reset();
                        surface_reset_target();
                    
                        
                        pow *= 1.358;
                        scal = power(0.0007, pow);
                        surface_set_target(l_shadowsprite_surf2);
                        shader_set(glr_shader_shadow_sprite);
                        shader_set_uniform_f(global.GLR_UNIF_LIGHT_OFFSET_SPR, l_xo/l_w , l_yo/l_h );
                        shader_set_uniform_f(global.GLR_UNIF_LIGHT_SCALE_SPR, scal );
                        draw_surface(l_shadowsprite_surf,0,0);
                        shader_reset();
                        surface_reset_target();
                        
                    } 
                    
                }
            }
        
            surface_set_target(l_shadowmap);
            
            //draw mask
            draw_sprite_ext(l_sprite, l_spr_index, l_spr_xo, l_spr_yo,1,1,0,l_color,1);
            
            //shadowsprite surface
            if(!is_clear && global.GLR_SHADOWSPRITE_ENABLED)
                draw_surface_ext(l_shadowsprite_surf2, 0, 0, 1, 1, 0, -1, l_shadow_strength);

             
            // rendering
            d3d_set_projection_ortho(l_x -l_w/2, l_y -l_h/2 , l_w, l_h, -l_rotation);
                   
            
            var sz = ds_list_size(global.GLR_MESH_STC_LIST);
            for(j = 0; j < sz j++)
            { 
                mesh = global.GLR_MESH_STC_LIST[| j];
                //check layer
                if(mesh[| GLR_MESH.active] && l_layer >= mesh[| GLR_MESH.layer])
                {
                    px = mesh[| GLR_MESH.px];
                    py = mesh[| GLR_MESH.py];
                    // bounding circle
                    
                    if(point_distance(px, py, l_x, l_y) >  mesh[| GLR_MESH.bcircle] + l_bcircle-l_tolerance)
                        continue;
                    
                    buf = mesh[| GLR_MESH.shadow_vertex_buffer];
                    zdepth = mesh[| GLR_MESH.zdepth];
                    
                    //a mesh was rendered
                    is_clear = false;
                    
                    shadow_strength  = mesh[| GLR_MESH.shadow_strength];
                       
                    matrix_set(matrix_world, mesh[| GLR_MESH.matrix ]);
                    
                    if(l_depth < zdepth) 
                        depth_offset = 0.1;
                    else
                        depth_offset = 0;
                    
                    shader_set(glr_shader_mesh_nodepth_html5);
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_NODEPTH_OFFSET, l_xo/l_w * 2 -1 , 1 - l_yo/l_h * 2 ); 
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_NODEPTH_STRENGTH, max(l_shadow_strength,shadow_strength));  
                    vertex_submit(buf, pr_trianglelist, -1 );
                    shader_reset();
                    
                } 
            }
            //reset world matrix
            d3d_transform_set_identity(); 
             
            surface_reset_target();
        }
    }
    
    //===============================================
    //  DYNAMIC
    //===============================================
    if (render )
    {
         
        is_clear = true;
        
        l_shadow_strength = l_id[| GLR_LIGHT.shadow_strength];
        l_tolerance = l_id[| GLR_LIGHT.tolerance];
        
        //----------------------------------------------
        //  Render Shadow Sprites
        //----------------------------------------------
        
        var sz_static = ds_list_size(global.GLR_SPR_STC_LIST);
        var sz_dynamic = ds_list_size(global.GLR_SPR_DYN_LIST);
        if(global.GLR_SHADOWSPRITE_ENABLED && sz_static > 0 || sz_dynamic > 0)
        { 
            if(!surface_exists(l_id[| GLR_LIGHT.surf_shadowsprite1])){
                l_id[| GLR_LIGHT.surf_shadowsprite1] = surface_create(l_spr_w, l_spr_h);
                if(!surface_exists(l_id[| GLR_LIGHT.surf_shadowsprite1]))
                    return 0;
            }
            l_shadowsprite_surf = l_id[| GLR_LIGHT.surf_shadowsprite1];
    
            
            surface_set_target(l_shadowsprite_surf);
            draw_clear_alpha(c_black,0);
            
            var proj_matrix = matrix_get(matrix_projection);
            d3d_set_projection_ortho(l_x -l_w/2 , l_y -l_h/2 , l_w, l_h, -l_rotation);
            matrix_set(matrix_projection, matrix_multiply(proj_matrix, tra_matrix))
                        
            d3d_set_culling(false);
            if(!l_static)
            {  
                for(j = 0; j < sz_static; j++)
                {
                    spr = global.GLR_SPR_STC_LIST[| j];
                    //check layer
                    
                    if(spr[| GLR_SHADOWSPRITE.active] && l_layer >= spr[| GLR_SHADOWSPRITE.layer])
                    {
                        tex = spr[| GLR_SHADOWSPRITE.sprite];
                        sub = spr[| GLR_SHADOWSPRITE.subimage];
                        px = spr[| GLR_SHADOWSPRITE.px];
                        py = spr[| GLR_SHADOWSPRITE.py]; 
                        xscale = spr[| GLR_SHADOWSPRITE.xscale];
                        yscale = spr[| GLR_SHADOWSPRITE.yscale];
                        rot = spr[| GLR_SHADOWSPRITE.rotation];
                         // bounding circle
                        if(point_distance(px, py, l_x, l_y) > spr[| GLR_SHADOWSPRITE.bcircle] * max(abs(xscale),abs(yscale)) + l_bcircle-l_tolerance){
                            continue;
                        }
                        is_clear = false;
                        d3d_transform_set_identity(); 
                        
                        d3d_transform_add_scaling(xscale, yscale, 1);
                        d3d_transform_add_rotation_z(rot);
                        d3d_transform_add_translation(px ,py,0); 
                  
                        draw_sprite(tex, sub, 0, 0 );  
                    }
                    
                }
                d3d_transform_set_identity();
            }
             
            for(j = 0; j < sz_dynamic; j++)
            {
                spr = global.GLR_SPR_DYN_LIST[| j];
                //check layer
                if(spr[| GLR_SHADOWSPRITE.active] && l_layer >= spr[| GLR_SHADOWSPRITE.layer])
                {
                    tex = spr[| GLR_SHADOWSPRITE.sprite];
                    sub = spr[| GLR_SHADOWSPRITE.subimage];
                    px = spr[| GLR_SHADOWSPRITE.px];
                    py = spr[| GLR_SHADOWSPRITE.py]; 
                    xscale = spr[| GLR_SHADOWSPRITE.xscale];
                    yscale = spr[| GLR_SHADOWSPRITE.yscale];
                    rot = spr[| GLR_SHADOWSPRITE.rotation];
                     // bounding circle
                    if(point_distance(px, py, l_x, l_y) > spr[| GLR_SHADOWSPRITE.bcircle] * max(abs(xscale),abs(yscale)) + l_bcircle-l_tolerance){
                        continue;
                    }
                    is_clear = false;
                    d3d_transform_set_identity(); 
                    d3d_transform_add_scaling(xscale, yscale, 1);
                    d3d_transform_add_rotation_z(rot);
                    d3d_transform_add_translation(px ,py,0);
              
                    draw_sprite(tex, sub, 0, 0 );
                } 
            }
            d3d_set_culling(true);  
            d3d_transform_set_identity();
            
            
            surface_reset_target();
             
            
            //shadowsprites rendering
            if(!is_clear)
            {
                if(!surface_exists(l_id[| GLR_LIGHT.surf_shadowsprite2])){
                    l_id[| GLR_LIGHT.surf_shadowsprite2] = surface_create(l_spr_w, l_spr_h);
                    if(!surface_exists(l_id[| GLR_LIGHT.surf_shadowsprite2]))
                        return 0;
                }
                l_shadowsprite_surf2 = l_id[| GLR_LIGHT.surf_shadowsprite2];
                var scal = 0.0007; 
                var pow = 0.160;
                surface_set_target(l_shadowsprite_surf2);
                draw_clear_alpha(0, 0);
                shader_set(glr_shader_shadow_sprite);
                shader_set_uniform_f(global.GLR_UNIF_LIGHT_OFFSET_SPR, l_xo/l_w , l_yo/l_h );
                shader_set_uniform_f(global.GLR_UNIF_LIGHT_SCALE_SPR, scal );
                draw_surface(l_shadowsprite_surf,0,0);
                shader_reset();
                
                 
                surface_reset_target(); 
                repeat(2){
                    pow *= 1.358;
                    scal = power(0.0007, pow);
                    surface_set_target(l_shadowsprite_surf);
                    shader_set(glr_shader_shadow_sprite); 
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_OFFSET_SPR, l_xo/l_w , l_yo/l_h );
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_SCALE_SPR, scal );
                    draw_surface(l_shadowsprite_surf2,0,0);
                    shader_reset();
                    surface_reset_target();
                    
                    pow *= 1.358;
                    scal = power(0.0007, pow);
                    surface_set_target(l_shadowsprite_surf2);
                    shader_set(glr_shader_shadow_sprite);
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_OFFSET_SPR, l_xo/l_w, l_yo/l_h ); 
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_SCALE_SPR, scal );
                    draw_surface(l_shadowsprite_surf, 0, 0);
                    shader_reset();
                    surface_reset_target();
                     
                }
            }
        } 
        l_is_clear = l_id[| GLR_LIGHT.is_clear];
         
        
        if(!surface_exists(l_id[| GLR_LIGHT.surf_light])){
            l_id[| GLR_LIGHT.surf_light] = surface_create(l_spr_w, l_spr_h);
            if(!surface_exists(l_id[| GLR_LIGHT.surf_light])) return 0;
        }
        l_surf = l_id[| GLR_LIGHT.surf_light];
        
        
        surface_set_target(l_surf);
        
        //if the light mask was used in previous frames
        if(!l_is_clear )
        {
            if(l_static){
                draw_surface_stretched(l_shadowmap,0,0,l_spr_w, l_spr_h);
            }
            else{
                draw_sprite_ext(l_sprite, l_spr_index, l_surf_xo, l_surf_yo, 1, 1, 0, l_color, 1);
            } 
        }
         
        
         if(!is_clear && global.GLR_SHADOWSPRITE_ENABLED){
            draw_surface_ext(l_shadowsprite_surf2,0,0,1,1,0,-1,l_shadow_strength);
         }
                
         
        //--------------------------------------------------
        //  Render Shadow Depth
        //--------------------------------------------------
        
        sz = ds_list_size(global.GLR_DEP_DYN_LIST); 
        if(sz > 0)
        {
            var proj_matrix = matrix_get(matrix_projection);
            d3d_set_projection_ortho(l_x -l_w/2 , l_y -l_h/2 , l_w, l_h, -l_rotation);
            matrix_set(matrix_projection, matrix_multiply(proj_matrix, tra_matrix));
                      
            d3d_set_culling(false);
            for(j = 0; j < sz; j++)
            { 
                dp = global.GLR_DEP_DYN_LIST[| j];
                //check layer
                if(dp[| GLR_SHADOWDEPTH.active] && dp[| GLR_SHADOWDEPTH.zdepth] > l_depth){
                    tex = dp[| GLR_SHADOWDEPTH.sprite];
                    sub = dp[| GLR_SHADOWDEPTH.subimage];
                    px = dp[| GLR_SHADOWDEPTH.px];
                    py = dp[| GLR_SHADOWDEPTH.py]; 
                    xscale = dp[| GLR_SHADOWDEPTH.xscale];
                    yscale = dp[| GLR_SHADOWDEPTH.yscale];
                    rot = dp[| GLR_SHADOWDEPTH.rotation]; 
                     // bounding circle
                    if(point_distance(px, py, l_x, l_y) > dp[| GLR_SHADOWDEPTH.bounding_circle] * max(abs(xscale),abs(yscale)) + l_bcircle-l_tolerance){
                        continue;
                    }
                    is_clear = false; 
                    
                    
                    matrix_set(matrix_world, global.GLR_MATRIX_WORLD_IDENTITY);
                    //d3d_transform_set_identity(); 
                    d3d_transform_add_scaling(xscale, yscale, 1);
                    d3d_transform_add_rotation_z(rot);
                    d3d_transform_add_translation(px ,py,0); 
               
                    draw_sprite_ext(tex,sub,0,0, 1, 1, 0, 0, 1); 
                     
                } 
            }
            d3d_set_culling(true);
            d3d_transform_set_identity();
        }
        
        //--------------------------------------------------
        //  Render Mesh Shadows
        //--------------------------------------------------
         
        //shadow casting
        sz = ds_list_size(global.GLR_MESH_DYN_LIST);
        d3d_set_projection_ortho(l_x -l_w/2, l_y -l_h/2 , l_w, l_h, -l_rotation);
            
        for(j = 0; j < sz j++)
        { 
            mesh = global.GLR_MESH_DYN_LIST[| j];
            //check layer
            if(mesh[| GLR_MESH.active] && l_layer >= mesh[| GLR_MESH.layer])
            {
                px = mesh[| GLR_MESH.px];
                py = mesh[| GLR_MESH.py];
                // bounding circle
                
                if(point_distance(px, py, l_x, l_y) >  mesh[| GLR_MESH.bcircle] + l_bcircle-l_tolerance)
                    continue;
                
                buf = mesh[| GLR_MESH.shadow_vertex_buffer];
                zdepth = mesh[| GLR_MESH.zdepth];
                
                //a mesh was rendered
                is_clear = false;
                
                shadow_strength  = mesh[| GLR_MESH.shadow_strength];
                   
                matrix_set(matrix_world, mesh[| GLR_MESH.matrix ]);
                 
               
                shader_set(glr_shader_mesh_nodepth_html5);
                 shader_set_uniform_f(global.GLR_UNIF_LIGHT_NODEPTH_OFFSET, l_xo/l_w * 2 -1 , 1 - l_yo/l_h * 2 ); 
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_NODEPTH_STRENGTH, max(l_shadow_strength,shadow_strength));  
                   
                vertex_submit(buf, pr_trianglelist, -1 );
                shader_reset(); 
                 
            }
        }
        
        //static meshes
        if(!l_static)
        {
            var sz = ds_list_size(global.GLR_MESH_STC_LIST);
            for(j = 0; j < sz j++)
            { 
                mesh = global.GLR_MESH_STC_LIST[| j];
                //check layer
                if(mesh[| GLR_MESH.active] && l_layer >= mesh[| GLR_MESH.layer])
                {
                    px = mesh[| GLR_MESH.px];
                    py = mesh[| GLR_MESH.py];
                    // bounding circle
                    
                    if(point_distance(px, py, l_x, l_y) >  mesh[| GLR_MESH.bcircle] + l_bcircle-l_tolerance)
                        continue;
                    
                    buf = mesh[| GLR_MESH.shadow_vertex_buffer];
                    zdepth = mesh[| GLR_MESH.zdepth];
                    
                    //a mesh was rendered
                    is_clear = false;
                    
                    shadow_strength  = mesh[| GLR_MESH.shadow_strength];
                       
                    matrix_set(matrix_world, mesh[| GLR_MESH.matrix ]);
                    shader_set(glr_shader_mesh_nodepth_html5);
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_NODEPTH_OFFSET, l_xo/l_w * 2 -1 , 1 - l_yo/l_h * 2 ); 
                    shader_set_uniform_f(global.GLR_UNIF_LIGHT_NODEPTH_STRENGTH, max(l_shadow_strength,shadow_strength));  
                    vertex_submit(buf, pr_trianglelist, -1 );
                    shader_reset(); 
                    
                }
            }
        }
        
        

        //reset world matrix
        d3d_transform_set_identity(); 
            
        l_id[| GLR_LIGHT.is_clear] = is_clear;
        surface_reset_target();
    } 
}


d3d_set_culling(false);
 
//===============================================
//  Directional light rendering
//===============================================


if(global.GLR_DIRECTIONAL_ENABLED  && global.GLR_DIRECTIONAL_STRENGTH > 0 )
{
     
    if(!surface_exists(global.GLR_DIRECTIONAL_SURFACE)){
        global.GLR_DIRECTIONAL_SURFACE = surface_create(global.GLR_DIRECTIONAL_WIDTH , global.GLR_DIRECTIONAL_HEIGHT);
        if(!surface_exists(global.GLR_DIRECTIONAL_SURFACE)){
            return 0;
        }
    }
    
    //rendering
    surface_set_target(global.GLR_DIRECTIONAL_SURFACE);
    d3d_set_projection_ortho(v_x0, v_y0, global.GLR_WIDTH /global.GLR_ZOOM,global.GLR_HEIGHT /global.GLR_ZOOM,0);
    draw_clear_alpha(c_black,0); //clear with alpha 0  
     
    
    global.GLR_DIRECTIONAL_CLEAR = true;
    
    //static meshes
    sz = ds_list_size(global.GLR_MESH_STC_LIST);
    for(j = 0; j < sz j++)
    { 
        mesh = global.GLR_MESH_STC_LIST[| j];
        if(mesh[| GLR_MESH.active])
        {
            global.GLR_DIRECTIONAL_CLEAR = false;
            
            buf = mesh[| GLR_MESH.shadow_vertex_buffer];
            zdepth = mesh[| GLR_MESH.zdepth];
                
            matrix_set(matrix_world, mesh[| GLR_MESH.matrix]);   
            shader_set(global.GLR_OS_DIRECTIONAL_SHADER);
            var len = mesh[| GLR_MESH.shadow_length_directional];
            shader_set_uniform_f(global.GLR_UNIF_DIRECTIONAL_DEPTH, zdepth/global.GLR_MAX_DEPTH);       
            shader_set_uniform_f(global.GLR_UNIF_DIRECTIONAL,lengthdir_x(global.GLR_DIRECTIONAL_LENGTH * len, global.GLR_DIRECTIONAL_ANGLE), lengthdir_y(global.GLR_DIRECTIONAL_LENGTH * len, global.GLR_DIRECTIONAL_ANGLE));
            vertex_submit(buf, pr_trianglelist, -1);
            shader_reset();
        }
    }
        
    
    //dynamic meshes
    sz = ds_list_size(global.GLR_MESH_DYN_LIST);
    for(j = 0; j < sz j++)
    { 
        mesh = global.GLR_MESH_DYN_LIST[| j];
        if(mesh[| GLR_MESH.active])
        {
            global.GLR_DIRECTIONAL_CLEAR = false;
            
            buf = mesh[| GLR_MESH.shadow_vertex_buffer];
            zdepth = mesh[| GLR_MESH.zdepth];
                
            matrix_set(matrix_world, mesh[| GLR_MESH.matrix]);   
            shader_set(global.GLR_OS_DIRECTIONAL_SHADER);
            var len = mesh[| GLR_MESH.shadow_length_directional];
            shader_set_uniform_f(global.GLR_UNIF_DIRECTIONAL_DEPTH, zdepth/global.GLR_MAX_DEPTH);       
            shader_set_uniform_f(global.GLR_UNIF_DIRECTIONAL,lengthdir_x(global.GLR_DIRECTIONAL_LENGTH * len, global.GLR_DIRECTIONAL_ANGLE), lengthdir_y(global.GLR_DIRECTIONAL_LENGTH * len, global.GLR_DIRECTIONAL_ANGLE));
            vertex_submit(buf, pr_trianglelist, -1);
            shader_reset();
        }
    }
    
    d3d_transform_set_identity();
    surface_reset_target(); 
}

return 1;
  
