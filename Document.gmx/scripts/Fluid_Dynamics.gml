#define Fluid_Dynamics
/*
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

    The marketplace might have imported the shader resources wrongly.
    Read the "before you start" section in the script called fd_GUIDE.
    
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
*/




#define fd_GUIDE
/*
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

    Thank you for purchasing Fluid Dynamics. Here's some information on how to use the asset.
    
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    Before you start:
    
    When you import the shaders that come with the asset, GameMaker has a bug where it sets the shader language to GLSL ES for all shaders.
    The asset uses both GLSL ES and HLSL 9. In the resource tree in the shaders section, go to the folder called Fluid Dynamics. In the "Internal" folder
    go to the folder called HLSL 9. Here's all the HLSL 9 shaders used in the asset. Open them all up and click the down arrow in the upper right
    corner and choose HLSL 9 from the dropdown menu for each shader. If they happen to already be set to HLSL 9 you don't have to do anything.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

    The resources:
    
    If you've imported all the resources from the asset into your project you'll see that they're all organized into folders called "Fluid Dynamics".
    Inside these folders you can find occurrences of three types of folders: "API", "Example", and "Internal". "API" and "Internal" contain the essential
    resources needed to use the Fluid Dynamics asset. "Example" contains resources used in the example that shows up when you run the game. Resources in the
    "Example" folders show you how you can use most aspects of the Fluid Dynamics asset in a game.
    
    To use Fluid Dynamics all you have to do is to call scripts from the "API" folder. All of the scripts are commented with a general
    description of what the script does as well as descriptions specific to each parameter. It's recommended that you read through these whenever
    you want to use them. When they are referred to later in this guide, open them and read them if you're unsure what they do.
    
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

    Implementing Fluid Dynamics into your game - the essential steps:
    
    First off you'll have to create a fluid dynamics rectangle with fd_rectangle_create. This script returns an instance id that you will use with the
    other scripts in the asset later. A fluid dynamics rectangle represents an area that the fluid can move around in. All simulation and visualization
    is done via a fluid dynamics rectangle.
    
    After you have created a fluid dynamics rectangle, you should find a step event that you can call fd_rectangle_update in. This will make
    the fluid dynamics rectangle regularly get updated so it moves the fluid around.
    
    Then you should find a draw event to call fd_rectangle_draw in. This will draw your fluid dynamics rectangle to the screen.
    
    After these three steps, you have a working fluid dynamics rectangle implemented, but it won't show you anything special because it doesn't have any
    fluid in it yet. To add fluid, you can call fd_rectangle_replace_material or fd_rectangle_add_material. Material is the term used for the visual content
    of a fluid dynamics rectangle. In a left mouse button event, you can for example do
    fd_rectangle_replace_material("your fluid dynamics rectangle", "the sprite to add", "image index of sprite", "relative x", "relative y", 1, 1, c_white, 1)
    which will continuously add fluid where you click with your mouse. "relative x" and "relative y" is the mouse coordinate relative to the fluid dynamics
    rectangle. If you draw the fluid dynamics rectangle with 1 in scale, you can use mouse_x and mouse_y directly, but if you're scaling the fluid dynamics
    rectangle (which is recommended, as it's much faster), you have to scale the mouse as well. If you're unsure on how to do this, see the example code
    for how it is done.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

    How can I improve the performance of the simulation?
    
    One way to improve performance is by reducing the fluid dynamics rectangle size. This can be done by using a smaller size when calling
    fd_rectangle_create. This will set all internal textures to the size entered. Alternatively, you can change the sizes of individual elements of the fluid
    dynamics rectangle after creation. This can be done with the scripts fd_rectangle_set_pressure_size, fd_rectangle_set_material_size, and
    fd_rectangle_set_velocity_size.
    
    Another way to improve performance is by reducing the quality of the simulation by lowering the number of pressure iterations. The largest bottleneck of the
    simulation is to solve for pressure. You can reduce the number of pressure iterations with fd_rectangle_set_pressure_iteration_type.
    
    If you are using multiple fluid dynamics rectangles at the same time over the same region in the world, you might want to look into
    fd_rectangle_inherit_velocity. The slowest part of the simulation is to update the velocity field, and with multiple fluid dynamics rectangles you will by
    default have multiple velocity fields being solved individually. If it's okay that the fluids inside these rectangles follow the same directions, you
    can use fd_rectangle_inherit_velocity to reuse a velocity field, thereby removing a velocity field update and greatly improving performance.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

    Can I use this asset for a large or even infinite game world?
    
    Yes, you can for example shift the content of the fluid dynamics rectangle as the view moves around with fd_rectangle_shift_content, and draw it at
    the view's position. This will only make fluid near the view get simulated, allowing for highly detailed fluids even in large or infinite worlds. You
    can make the fluid dynamics rectangle slightly bigger than the view size so that fluid outside the view disappears in an elegant way. The folder in the
    API folder named "SimenGames' View Extension" contains some very useful scripts that can do all of this for you.
    
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

    If you want to know more, there are several comments with explanations in the example code and the scripts themselves. If you need more help, you can
    visit the forum thread at "https://forum.yoyogames.com/index.php?threads/fluid-dynamics.23643/" or contact me by sending a mail to
    asbjorn.lystrup@gmail.com or messaging Dragon47 on the GameMaker Community.
    
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
*/




#define fd_rectangle_create
/// fd_rectangle_create(sf width, sf height, shader language)
// Creates a fluid dynamics rectangle and returns its instance id. This instance id should be stored and be used together with the other scripts of this asset.
// sf width, sf height: The width and height of the fluid dynamics rectangle. This does not need to be the same as the amount of pixels it will cover. It's usually a good idea to make
//     it about a third the size of what it will actually cover on screen.
// shader language: Enum type. Set this to either FD_SHADER_LANGUAGE.HLSL_9 or FD_SHADER_LANGUAGE.GLSL_ES depending on what shader language you want the shaders used to be from.

var instance = instance_create(0, 0, obj_fd_rectangle);

with (instance) {
    sf_pressure = -1; sf_pressure_temporary = -1;
    sf_velocity = -1; sf_velocity_temporary = -1;
    sf_material_0 = -1; sf_material_0_temporary = -1;
    sf_material_1 = -1; sf_material_1_temporary = -1;
    sf_world = -1;
    
    material_surface_was_created = false;
    
    collision_mask_type = 2;
    
    fd_rectangle_inherit_velocity(id, -1, false);
    fd_rectangle_set_visualization_shader(id, FD_VISUALIZATION_SHADER.NO_SHADER);
    fd_rectangle_set_acceleration(id, 0, 0);
    fd_rectangle_set_shader_language(id, argument2);
    fd_rectangle_set_material_type(id, FD_MATERIAL_TYPE.RGBA_16);
    fd_rectangle_set_velocity_time_step(id, 1.4);
    fd_rectangle_set_material_time_step(id, 1.4);
    fd_rectangle_set_material_dissipation_type(id, 0);
    fd_rectangle_set_material_dissipation_value(id, 1);
    fd_rectangle_set_velocity_dissipation_type(id, 1);
    fd_rectangle_set_velocity_dissipation_value(id, 0);
    fd_rectangle_set_velocity_maccormack_weight(id, 0.5);
    fd_rectangle_set_material_maccormack_weight(id, 0);
    fd_rectangle_set_pressure_iteration_type(id, -3);
    fd_rectangle_set_pressure_size(id, argument0, argument1);
    fd_rectangle_set_velocity_size(id, argument0, argument1);
    fd_rectangle_set_material_size(id, argument0, argument1);
    fd_rectangle_set_initial_value_pressure(id, 0.5);
    fd_rectangle_set_repeat(id, false);
}

return instance;




#define fd_rectangle_inherit_velocity
/// fd_rectangle_inherit_velocity(child instance id, parent instance id, inherit)
// In some cases you want two (or more) different types of fluids in the same area and hence have to create several fluid dynamics rectangles over the same regions. Each fluid dynamics rectangle
// will by default create and update its own velocity texture, but if you call this script you can set it to use the velocity field of another fluid dynamics rectangle. If it's okay that
// the different types of fluids follow the same direction, this is greatly recommended as it can speed things up significantly. The velocity update is the slowest step in the simulation, so
// inheriting a velocity field can make your game run much faster. Remember to call the update script for the parent fluid dynamics rectangle before the child fluid dynamics rectangle.
// child instance id: The instance id of the fluid dynamics rectangle that will inherit the velocity.
// parent instance id: The instance id of the fluid dynamics rectangle in control of the velocity update. The child instance inherits the velocity of this instance. If you're disabling inheritance
//     you can set this to whatever you want.
// inherit: Whether to inherit velocity (true) or not (false). This lets your disable or enable velocity inheritance.

with (argument0) {
    inherit_velocity_parent = argument1;
    inherit_velocity = argument2;
}




#define fd_rectangle_destroy
/// fd_rectangle_destroy(instance id);
// Destroys a fluid dynamics rectangle.
// instance id: The fluid dynamics rectangle to destroy.

with (argument0) {
    surface_free(sf_pressure); surface_free(sf_pressure_temporary);
    surface_free(sf_velocity); surface_free(sf_velocity_temporary);
    surface_free(sf_material_0); surface_free(sf_material_0_temporary);
    surface_free(sf_material_1); surface_free(sf_material_1_temporary);
    surface_free(sf_world);
    instance_destroy();
}




#define fd_rectangle_update
/// fd_rectangle_update(instance id)
// Updates the fluid dynamics rectangle, proceeding the simulation one step further.
// instance id: The instance id of the fluid dynamics rectangle to update.

fd_rectangle_update_velocity(argument0);
fd_rectangle_update_material(argument0);




#define fd_rectangle_update_velocity
/// fd_rectangle_update_velocity(instance id)
// Updates the velocity texture of the fluid dynamics rectangle, proceeding the simulation of the velocity texture one step further.
// Usually you want to call fd_rectangle_update to update the fluid dynamics rectangle as a whole. fd_rectangle_update performs fd_rectangle_update_velocity followed by fd_rectangle_update_material.
// However, if you want more control you can call these scripts yourself.
// instance id: The instance id of the fluid dynamics rectangle.

with (argument0) {
    if (!inherit_velocity) {
    
        var temporary;
    
        texture_set_repeat(texture_repeat);
        texture_set_interpolation(true);
        
        draw_enable_alphablend(false);
        
            fd_rectangle_assure_surfaces_exist(id);
            
            // Advects velocity.
            surface_set_target(sf_velocity_temporary);
                switch (acceleration_type) {
                    case 0:
                        shader_set(sh_fd_advect_velocity_0);
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_velocity_0, "texture_world"), surface_get_texture(sf_world));
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_velocity_0, "precalculated"), velocity_time_step * sf_velocity_texel_width, velocity_time_step * sf_velocity_texel_height, sf_velocity_texel_width, sf_velocity_texel_height);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_velocity_0, "precalculated_1"), velocity_dissipation_type, velocity_dissipation_value, velocity_maccormack_weight * 0.5);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_velocity_0, "acceleration"), acceleration_x, acceleration_y);
                        break;
                
                    case 1:
                        shader_set(sh_fd_advect_velocity_1);
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_velocity_1, "texture_world"), surface_get_texture(sf_world));
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_velocity_1, "texture_material"), surface_get_texture(sf_material_0));
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_velocity_1, "precalculated"), velocity_time_step * sf_velocity_texel_width, velocity_time_step * sf_velocity_texel_height, sf_velocity_texel_width, sf_velocity_texel_height);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_velocity_1, "precalculated_1"), velocity_dissipation_type, velocity_dissipation_value, velocity_maccormack_weight * 0.5);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_velocity_1, "acceleration"), acceleration_x, acceleration_y, acceleration_a, acceleration_b);
                        break;
                }
                draw_surface(sf_velocity, 0, 0);
                shader_reset();
            surface_reset_target();
            temporary = sf_velocity; sf_velocity = sf_velocity_temporary; sf_velocity_temporary = temporary;
            
            // Calculates divergence of velocity.
            surface_set_target(sf_pressure);
                shader_set(sh_fd_calculate_velocity_divergence);
                    shader_set_uniform_f(shader_get_uniform(sh_fd_calculate_velocity_divergence, "initial_value_pressure"), initial_value_pressure);
                    shader_set_uniform_f(shader_get_uniform(sh_fd_calculate_velocity_divergence, "texel_size"), sf_velocity_texel_width, sf_velocity_texel_height);
                    draw_surface_stretched(sf_velocity, 0, 0, sf_pressure_width, sf_pressure_height);
                shader_reset();
            surface_reset_target();
            
            if (pressure_iteration_type >= 0) {
                shader_set(sh_fd_calculate_pressure_jacobi);
                    shader_set_uniform_f(shader_get_uniform(sh_fd_calculate_pressure_jacobi, "texel_size"), sf_pressure_texel_width, sf_pressure_texel_height);
                    repeat (pressure_iteration_type) {
                        surface_set_target(sf_pressure_temporary);
                            draw_surface(sf_pressure, 0, 0);
                        surface_reset_target();
                        temporary = sf_pressure; sf_pressure = sf_pressure_temporary; sf_pressure_temporary = temporary;
                    }
                shader_reset();
            } else {
                shader_set(sh_fd_calculate_pressure_srj);
                    shader_set_uniform_f(shader_get_uniform(sh_fd_calculate_pressure_srj, "texel_size"), sf_pressure_texel_width, sf_pressure_texel_height);
                    var length = array_length_1d(pressure_relaxation_parameter);
                    for (var i = 0; i < length; ++i) {
                        if (pressure_relaxation_parameter[i] != -1) shader_set_uniform_f(shader_get_uniform(sh_fd_calculate_pressure_srj, "precalculated"), 1 - pressure_relaxation_parameter[i], 0.25 * pressure_relaxation_parameter[i]);
                        surface_set_target(sf_pressure_temporary);
                            draw_surface(sf_pressure, 0, 0);
                        surface_reset_target();
                        temporary = sf_pressure; sf_pressure = sf_pressure_temporary; sf_pressure_temporary = temporary;
                    }
                shader_reset();
            }
            
            // Calculates the gradient of pressure and subtracts it from the velocity.
            surface_set_target(sf_velocity_temporary);
                shader_set(sh_fd_subtract_pressure_gradient);
                    texture_set_stage(shader_get_sampler_index(sh_fd_subtract_pressure_gradient, "texture_pressure"), surface_get_texture(sf_pressure));
                    shader_set_uniform_f(shader_get_uniform(sh_fd_subtract_pressure_gradient, "texel_size"), sf_pressure_texel_width, sf_pressure_texel_height);
                    draw_surface(sf_velocity, 0, 0);
                shader_reset();
            surface_reset_target();
            temporary = sf_velocity; sf_velocity = sf_velocity_temporary; sf_velocity_temporary = temporary;
        
        draw_enable_alphablend(true);
        
    }
}




#define fd_rectangle_update_material
/// fd_rectangle_update_material(instance id)
// Updates the material textures of the fluid dynamics rectangle, proceeding the simulation of the material textures one step further.
// Usually you want to call fd_rectangle_update to update the fluid dynamics rectangle as a whole. fd_rectangle_update performs fd_rectangle_update_velocity followed by fd_rectangle_update_material.
// However, if you want more control you can call these scripts yourself.
// instance id: The instance id of the fluid dynamics rectangle.

with (argument0) {
    var temporary, velocity_texture;

    texture_set_repeat(texture_repeat);
    texture_set_interpolation(true);
    
    draw_enable_alphablend(false);
    
        fd_rectangle_assure_surfaces_exist(id);
        
        if (inherit_velocity) velocity_texture = surface_get_texture(inherit_velocity_parent.sf_velocity); else velocity_texture = surface_get_texture(sf_velocity);
        
        // Advects material.
        switch (material_type) {
            case FD_MATERIAL_TYPE.A_8:
                surface_set_target(sf_material_0_temporary);
                    shader_set(sh_fd_advect_material_a_8);
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_a_8, "texture_velocity"), velocity_texture);
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_a_8, "texture_world"), surface_get_texture(sf_world));
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_a_8, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_a_8, "precalculated"), material_time_step * sf_material_texel_width, material_time_step * sf_material_texel_height);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_a_8, "precalculated_1"), sf_material_texel_width * 0.5, sf_material_texel_height * 0.5,
                                    sf_material_texel_width * -0.5, sf_material_texel_height * -0.5);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_a_8, "precalculated_2"), material_dissipation_type, material_dissipation_value, material_maccormack_weight * 0.5);
                        draw_surface(sf_material_0, 0, 0);
                    shader_reset();
                surface_reset_target();
                temporary = sf_material_0; sf_material_0 = sf_material_0_temporary; sf_material_0_temporary = temporary;
                break;
                
            case FD_MATERIAL_TYPE.RGBA_8:
                surface_set_target(sf_material_0_temporary);
                    shader_set(sh_fd_advect_material_rgba_8);
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_rgba_8, "texture_velocity"), velocity_texture);
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_rgba_8, "texture_world"), surface_get_texture(sf_world));
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_8, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_8, "dissipation_type"), material_dissipation_type);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_8, "dissipation_value"), material_dissipation_value);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_8, "maccormack_weight_half"), material_maccormack_weight * 0.5);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_8, "precalculated"), material_time_step * sf_material_texel_width, material_time_step * sf_material_texel_height);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_8, "precalculated_1"), sf_material_texel_width * 0.5, sf_material_texel_height * 0.5,
                                    sf_material_texel_width * -0.5, sf_material_texel_height * -0.5);
                        draw_surface(sf_material_0, 0, 0);
                    shader_reset();
                surface_reset_target();
                temporary = sf_material_0; sf_material_0 = sf_material_0_temporary; sf_material_0_temporary = temporary;
                break;
        
            case FD_MATERIAL_TYPE.A_16:
                surface_set_target(sf_material_0_temporary);
                    shader_set(sh_fd_advect_material_a_16);
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_a_16, "texture_velocity"), velocity_texture);
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_a_16, "texture_world"), surface_get_texture(sf_world));
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_a_16, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_a_16, "precalculated"), material_time_step * sf_material_texel_width, material_time_step * sf_material_texel_height);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_a_16, "precalculated_1"), sf_material_texel_width * 0.5, sf_material_texel_height * 0.5,
                                    sf_material_texel_width * -0.5, sf_material_texel_height * -0.5);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_a_16, "precalculated_2"), material_dissipation_type, material_dissipation_value, material_maccormack_weight * 0.5);
                        draw_surface(sf_material_0, 0, 0);
                    shader_reset();
                surface_reset_target();
                temporary = sf_material_0; sf_material_0 = sf_material_0_temporary; sf_material_0_temporary = temporary;
                break;
            
            case FD_MATERIAL_TYPE.RGBA_16:
                if (shader_language == 0) {
                    surface_set_target_ext(0, sf_material_0_temporary);
                    surface_set_target_ext(1, sf_material_1_temporary);
                        shader_set(sh_fd_advect_material_rgba_16_hlsl);
                            texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_rgba_16_hlsl, "texture_material_1"), surface_get_texture(sf_material_1));
                            texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_rgba_16_hlsl, "texture_velocity"), velocity_texture);
                            texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_rgba_16_hlsl, "texture_world"), surface_get_texture(sf_world));
                            shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_hlsl, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                            shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_hlsl, "dissipation_type"), material_dissipation_type);
                            shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_hlsl, "dissipation_value"), material_dissipation_value);
                            shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_hlsl, "maccormack_weight_half"), material_maccormack_weight * 0.5);
                            shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_hlsl, "precalculated"), material_time_step * sf_material_texel_width, material_time_step * sf_material_texel_height);
                            shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_hlsl, "precalculated_1"), sf_material_texel_width * 0.5, sf_material_texel_height * 0.5,
                                        sf_material_texel_width * -0.5, sf_material_texel_height * -0.5);
                            draw_surface(sf_material_0, 0, 0);
                        shader_reset();        
                    surface_reset_target();
                    temporary = sf_material_0; sf_material_0 = sf_material_0_temporary; sf_material_0_temporary = temporary;
                    temporary = sf_material_1; sf_material_1 = sf_material_1_temporary; sf_material_1_temporary = temporary;
                } else {
                    shader_set(sh_fd_advect_material_rgba_16_glsl);
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_rgba_16_glsl, "texture_material_1"), surface_get_texture(sf_material_1));
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_rgba_16_glsl, "texture_velocity"), velocity_texture);
                        texture_set_stage(shader_get_sampler_index(sh_fd_advect_material_rgba_16_glsl, "texture_world"), surface_get_texture(sf_world));
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_glsl, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_glsl, "dissipation_type"), material_dissipation_type);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_glsl, "dissipation_value"), material_dissipation_value);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_glsl, "maccormack_weight_half"), material_maccormack_weight * 0.5);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_glsl, "precalculated"), material_time_step * sf_material_texel_width, material_time_step * sf_material_texel_height);
                        shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_glsl, "precalculated_1"), sf_material_texel_width * 0.5, sf_material_texel_height * 0.5,
                                    sf_material_texel_width * -0.5, sf_material_texel_height * -0.5);
                    
                        surface_set_target(sf_material_0_temporary);
                            shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_glsl, "target"), 0);
                            draw_surface(sf_material_0, 0, 0);    
                        surface_reset_target();
                        
                        surface_set_target(sf_material_1_temporary);
                            shader_set_uniform_f(shader_get_uniform(sh_fd_advect_material_rgba_16_glsl, "target"), 1);
                            draw_surface(sf_material_0, 0, 0);
                        surface_reset_target();
                        
                        temporary = sf_material_0; sf_material_0 = sf_material_0_temporary; sf_material_0_temporary = temporary;
                        temporary = sf_material_1; sf_material_1 = sf_material_1_temporary; sf_material_1_temporary = temporary;
                    shader_reset();
                }
                break;
        }
    
    draw_enable_alphablend(true);
}




#define fd_rectangle_draw_part
/// fd_rectangle_draw_part(instance id, left, top, width, height, x, y, xscale, yscale, color, alpha, use interpolation)
// Draws a part of the fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// left, top, width, height: See the manual on draw_surface_part for an explanation.
// x, y: The pixel position to draw at.
// xscale, yscale: The scale to draw at.
// color: The image blending color, the same as color in draw_surface_ext.
// alpha: The alpha to draw at, the same as alpha in draw_surface_ext.
// use interpolation: Set this to true if you want linear interpolation to be enabled, and false if you want nearest neighbor to be used instead.

with (argument0) {
    texture_set_interpolation(argument11);
    
    fd_rectangle_assure_surfaces_exist(id);
    
    switch (visualization_shader) {
        case FD_VISUALIZATION_SHADER.NO_SHADER:
            draw_surface_part_ext(sf_material_0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            break;
    
        case FD_VISUALIZATION_SHADER.DEBUG_VELOCITY:
            shader_set(sh_fd_visualize_velocity);
                shader_set_uniform_f(shader_get_uniform(sh_fd_visualize_velocity, "texel_size"), 1 / (argument3 * argument7), 1 / (argument4 * argument8));
                draw_surface_part_ext(sf_velocity, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
            
        case FD_VISUALIZATION_SHADER.DEBUG_VELOCITY_DIVERGENCE:
            shader_set(sh_fd_visualize_divergence);
                draw_surface_part_ext(sf_pressure, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
        
        case FD_VISUALIZATION_SHADER.DEBUG_PRESSURE:
            shader_set(sh_fd_visualize_pressure);
                draw_surface_part_ext(sf_pressure, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
            
        case FD_VISUALIZATION_SHADER.PIXEL_ART_FIRE:
            shader_set(sh_fd_visualize_pixel_art_fire);
                shader_set_uniform_f(shader_get_uniform(sh_fd_visualize_pixel_art_fire, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                draw_surface_part_ext(sf_material_0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
            
        case FD_VISUALIZATION_SHADER.COLORIZE:
            shader_set(sh_fd_visualize_colorize);
                draw_surface_part_ext(sf_material_0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
            
        case FD_VISUALIZATION_SHADER.PIXEL_ART_FIERY_SMOKE:
            shader_set(sh_fd_visualize_pixel_art_fiery_smoke);
                shader_set_uniform_f(shader_get_uniform(sh_fd_visualize_pixel_art_fiery_smoke, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                draw_surface_part_ext(sf_material_0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
            
        case FD_VISUALIZATION_SHADER.THICK_SMOKE:
            shader_set(sh_fd_visualize_thick_smoke);
                shader_set_uniform_f(shader_get_uniform(sh_fd_visualize_thick_smoke, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                draw_surface_part_ext(sf_material_0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
    }
}




#define fd_rectangle_draw
/// fd_rectangle_draw(instance id, x, y, xscale, yscale, color, alpha, use interpolation)
// Draws the fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// x, y: The pixel position to draw at.
// xscale, yscale: The scale to draw at.
// color: The image blending color, the same as color in draw_surface_ext.
// alpha: The alpha to draw at, the same as alpha in draw_surface_ext.
// use interpolation: Set this to true if you want linear interpolation to be enabled, and false if you want nearest neighbor to be used instead.

fd_rectangle_draw_part(argument0, 0, 0, argument0.sf_material_width, argument0.sf_material_height, argument1, argument2, argument3, argument4, argument5, argument6, argument7);




#define fd_rectangle_draw_stretched
/// fd_rectangle_draw_stretched(instance id, x, y, width, height, color, alpha, use interpolation)
// Draws the fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// x, y: The pixel position to draw at.
// width, height: The width and height to draw the fluid dynamics rectangle at.
// color: The image blending color, the same as color in draw_surface_ext.
// alpha: The alpha to draw at, the same as alpha in draw_surface_ext.
// use interpolation: Set this to true if you want linear interpolation to be enabled, and false if you want nearest neighbor to be used instead.

with (argument0) {
    fd_rectangle_draw_part(id, 0, 0, sf_material_width, sf_material_height, argument1, argument2, argument3 / sf_material_width, argument4 / sf_material_height, argument5, argument6, argument7);
}




#define fd_rectangle_clear
/// fd_rectangle_clear(instance id);
// Clears the fluid dynamics rectangle, removing all its content.
// instance id: The instance id of the fluid dynamics rectangle.

with (argument0) {
    surface_free(sf_pressure);
    surface_free(sf_velocity);
    surface_free(sf_material_0); surface_free(sf_material_1);
    surface_free(sf_world);
}




#define fd_rectangle_material_surface_was_created
/// fd_rectangle_material_surface_was_created(instance id);
// This is a script that returns true whenever the material surface was created. This can be useful in case it spontaneously disappears from memory and you want to recreate it.
// Surfaces are volatile, so this should be accounted for if the content is important to store.
// instance id: The instance id of the fluid dynamics rectangle.

with (argument0) {
    if (material_surface_was_created) {
        material_surface_was_created = false;
        return true;
    }
    return false;
}




#define fd_rectangle_set_target
/// fd_rectangle_set_target(instance id, target type)
// Sets a surface of the fluid dynamics rectangle as a target to draw to. Use fd_rectangle_reset_target when done.
// instance id: The instance id of the fluid dynamics rectangle.
// target type: Enum type. From the enum FD_TARGET_TYPE. See an explanation of its enum elements below:
//     FD_TARGET_TYPE.REPLACE_MATERIAL: Draws to the material surface of the fluid dynamics rectangle, but replaces content that's already there.
//     FD_TARGET_TYPE.REPLACE_MATERIAL_ADVANCED: Like REPLACE_MATERIAL, but it takes care of issues with transparency related to surfaces. It can be a bit slower though.
//     FD_TARGET_TYPE.ADD_MATERIAL: Draws to the material surface of the fluid dynamics rectangle by adding to the content that's already there.
//     FD_TARGET_TYPE.REPLACE_VELOCITY: Draws to the velocity surface of the fluid dynamics rectangle and replaces the content that's already there. See fd_rectangle_get_velocity_surface for an explanation of the format.
//     FD_TARGET_TYPE.ADD_VELOCITY: Draws to the velocity surface of the fluid dynamics rectangle by adding to the content that's already there. See fd_rectangle_get_velocity_surface for an explanation of the format.

with (argument0) {
    target_type = argument1;
    
    fd_rectangle_assure_surfaces_exist(id);
    
    switch (argument1) {
        case FD_TARGET_TYPE.REPLACE_MATERIAL:
            surface_set_target(sf_material_0);
            break;
            
        case FD_TARGET_TYPE.REPLACE_MATERIAL_ADVANCED:
            surface_set_target(sf_material_0_temporary);
            draw_enable_alphablend(false);
            draw_surface(sf_material_0, 0, 0);
            shader_set(sh_fd_replace_material_advanced);
            texture_set_stage(shader_get_sampler_index(sh_fd_replace_material_advanced, "texture_material_0"), surface_get_texture(sf_material_0));
            break;
            
        case FD_TARGET_TYPE.ADD_MATERIAL:
            surface_set_target(sf_material_0);
            draw_set_blend_mode_ext(bm_one, bm_one);
            break;
        
        case FD_TARGET_TYPE.REPLACE_VELOCITY:
            surface_set_target(sf_velocity_temporary);
            break;
            
        case FD_TARGET_TYPE.ADD_VELOCITY:
            surface_set_target(sf_velocity_temporary);
            draw_enable_alphablend(false);
            draw_surface(sf_velocity, 0, 0);
            shader_set(sh_fd_add_velocity);
            shader_set_uniform_f(shader_get_uniform(sh_fd_add_velocity, "addend"), 0.5 + 0.5 * sf_velocity_texel_width, 0.5 + 0.5 * sf_velocity_texel_height);
            texture_set_stage(shader_get_sampler_index(sh_fd_add_velocity, "texture_velocity"), surface_get_texture(sf_velocity));
            break;
    }
}




#define fd_rectangle_reset_target
/// fd_rectangle_reset_target(instance id)
// Resets the target of the fluid dynamics rectangle. Should be used after fd_rectangle_set_target.
// instance id: The instance id of the fluid dynamics rectangle.

with (argument0) {
    surface_reset_target();    

    switch (target_type) {
        case FD_TARGET_TYPE.ADD_MATERIAL:
            draw_set_blend_mode(bm_normal);
            break;
            
        case FD_TARGET_TYPE.REPLACE_MATERIAL_ADVANCED:
            shader_reset();
            draw_enable_alphablend(true);
            var temporary = sf_material_0_temporary; sf_material_0_temporary = sf_material_0; sf_material_0 = temporary;
            break;
        
        case FD_TARGET_TYPE.REPLACE_VELOCITY:
            break;
            
        case FD_TARGET_TYPE.ADD_VELOCITY:
            shader_reset();
            draw_enable_alphablend(true);
            var temporary = sf_velocity_temporary; sf_velocity_temporary = sf_velocity; sf_velocity = temporary;
            break;
    }
}




#define fd_rectangle_replace_material
/// fd_rectangle_replace_material(instance id, sprite index, image index, x, y, xscale, yscale, color, alpha)
// A script for drawing a sprite to the material of a fluid dynamics rectangle, replacing content that's already there.
// instance id: The instance id of the fluid dynamics rectangle.
// sprite index: The sprite to draw.
// image index: The image index of the sprite to draw.
// x, y: The position inside the fluid dynamics rectangle to draw the sprite at.
// xscale, yscale: The scale to draw at.
// color: The color blend to draw with.
// alpha: The alpha to draw with.

with (argument0) {
    fd_rectangle_set_target(id, FD_TARGET_TYPE.REPLACE_MATERIAL);
        draw_sprite_ext(argument1, argument2, argument3, argument4, argument5, argument6, 0, argument7, argument8);
    fd_rectangle_reset_target(id);
}




#define fd_rectangle_replace_material_advanced
/// fd_rectangle_replace_material_advanced(instance id, sprite index, image index, x, y, xscale, yscale, color, alpha)
// Like fd_rectangle_replace_material, but accounts for transparency issues with surfaces. It's a bit slower though.
// instance id: The instance id of the fluid dynamics rectangle.
// sprite index: The sprite to draw.
// image index: The image index of the sprite to draw.
// x, y: The position inside the fluid dynamics rectangle to draw the sprite at.
// xscale, yscale: The scale to draw at.
// color: The color blend to draw with.
// alpha: The alpha to draw with.

with (argument0) {
    fd_rectangle_set_target(id, FD_TARGET_TYPE.REPLACE_MATERIAL_ADVANCED);
        draw_sprite_ext(argument1, argument2, argument3, argument4, argument5, argument6, 0, argument7, argument8);
    fd_rectangle_reset_target(id);
}




#define fd_rectangle_add_material
/// fd_rectangle_add_material(instance id, sprite index, image index, x, y, xscale, yscale, color, alpha)
// A script for drawing a sprite to the material of a fluid dynamics rectangle, adding to the content that's already there.
// instance id: The instance id of the fluid dynamics rectangle.
// sprite index: The sprite to draw.
// image index: The image index of the sprite to draw.
// x, y: The position inside the fluid dynamics rectangle to draw the sprite at.
// xscale, yscale: The scale to draw at.
// color: The color blend to draw with.
// alpha: The alpha to draw with.

with (argument0) {
    fd_rectangle_set_target(id, FD_TARGET_TYPE.ADD_MATERIAL);
        draw_sprite_ext(argument1, argument2, argument3, argument4, argument5, argument6, 0, argument7, argument8);
    fd_rectangle_reset_target(id);
}




#define fd_rectangle_replace_velocity
/// fd_rectangle_replace_velocity(instance id, sprite index, image index, x, y, xscale, yscale, x velocity, y velocity)
// A script for drawing a sprite to the velocity surface of a fluid dynamics rectangle, replacing content that's already there.
// instance id: The instance id of the fluid dynamics rectangle.
// sprite index: The sprite to draw.
// image index: The image index of the sprite to draw.
// x, y: The position inside the fluid dynamics rectangle to draw the sprite at.
// xscale, yscale: The scale to draw at.
// color: The color blend to draw with.
// x velocity, y velocity: The velocity that will be set where the sprite is drawn. If the alpha is 0 in the sprite, the
//     velocity will be 0 at that point. If it's 1, it will be equal to x velocity, y velocity at that point. Anywhere in between will
//     blend linearly. The parameter values should be kept between -1 and 1.

with (argument0) {
    fd_rectangle_set_target(id, FD_TARGET_TYPE.REPLACE_VELOCITY);
        var color = make_color_rgb(ceil((clamp(argument7, -1, 1) * 0.125 + 0.5) * 255), ceil((clamp(argument8, -1, 1) * 0.125 + 0.5) * 255), 0);
        draw_sprite_ext(argument1, argument2, argument3, argument4, argument5, argument6, 0, color, 1);
    fd_rectangle_reset_target(id);
}




#define fd_rectangle_add_velocity
/// fd_rectangle_add_velocity(instance id, sprite index, image index, x, y, xscale, yscale, x velocity, y velocity)
// A script for drawing a sprite to the velocity surface of a fluid dynamics rectangle, adding to the content that's already there.
// instance id: The instance id of the fluid dynamics rectangle.
// sprite index: The sprite to draw.
// image index: The image index of the sprite to draw.
// x, y: The position inside the fluid dynamics rectangle to draw the sprite at.
// xscale, yscale: The scale to draw at.
// color: The color blend to draw with.
// x velocity, y velocity: The velocity that will be added where the sprite is drawn. If the alpha is 0 in the sprite, the
//     velocity will be 0 at that point. If it's 1, it will be equal to x velocity, y velocity at that point. Anywhere in between will
//     blend linearly. The parameter values should be kept between -2 and 2.

with (argument0) {
    fd_rectangle_set_target(id, FD_TARGET_TYPE.ADD_VELOCITY);
        var color = make_color_rgb(ceil((clamp(argument7, -1, 1) * 0.125 + 0.5) * 255), ceil((clamp(argument8, -1, 1) * 0.125 + 0.5) * 255), 0);
        draw_sprite_ext(argument1, argument2, argument3, argument4, argument5, argument6, 0, color, 1);
    fd_rectangle_reset_target(id);
}




#define fd_rectangle_shift_content
/// fd_rectangle_shift_content(instance id, x amount, y amount)
// Shifts the position of the content of a fluid dynamics rectangle.
// Useful if you want to e.g. make a fluid dynamics rectangle that follows the view.
// instance id: The instance id of the fluid dynamics rectangle.
// x amount, y amount: The amount of pixels to shift the content of the fluid dynamics rectangle with.

draw_enable_alphablend(false);

    with (argument0) {
        surface_set_target(sf_velocity_temporary);
            draw_clear_alpha($7F7F7F, 0.5);
            draw_surface(sf_velocity, argument1, argument2);
        surface_reset_target();
        var t = sf_velocity; sf_velocity = sf_velocity_temporary; sf_velocity_temporary = t;
        
        surface_set_target(sf_material_0_temporary);
            draw_clear_alpha(c_black, 0);
            draw_surface(sf_material_0, argument1, argument2);
        surface_reset_target();
        var t = sf_material_0; sf_material_0 = sf_material_0_temporary; sf_material_0_temporary = t;
        
        if (material_type == FD_MATERIAL_TYPE.RGBA_16) {
            surface_set_target(sf_material_1_temporary);
                draw_clear_alpha(c_black, 0);
                draw_surface(sf_material_1, argument1, argument2);
            surface_reset_target();
            var t = sf_material_1; sf_material_1 = sf_material_1_temporary; sf_material_1_temporary = t;
        }
    }
    
draw_enable_alphablend(true);




#define fd_rectangle_set_visualization_shader
/// fd_rectangle_set_visualization_shader(instance id, shader)
// Sets the visualization shader for the fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// shader: You can enter your own custom shader (see the internal shaders for how visualization shaders work), or you can enter
//     one of the elements of this enum, FD_VISUALIZATION_SHADER:
//     FD_VISUALIZATION_SHADER.NO_SHADER: No shader will be used, and the fluid dynamics will be drawn like it is behind the scenes.
//     FD_VISUALIZATION_SHADER.DEBUG_VELOCITY: Shows the velocity.
//     FD_VISUALIZATION_SHADER.DEBUG_VELOCITY_DIVERGENCE: Shows the velocity divergence.
//     FD_VISUALIZATION_SHADER.DEBUG_PRESSURE: Shows the pressure.
//     FD_VISUALIZATION_SHADER.PIXEL_ART_FIRE: Pixelates the fluid and adds thresholds to determine different fire colors.
//     FD_VISUALIZATION_SHADER.COLORIZE: Draws the fluid with one color everywhere. To change the color, go to the internal shader called sh_fd_visualize_colorize_hlsl/sh_fd_visualize_colorize_glsl.
//     FD_VISUALIZATION_SHADER.PIXEL_ART_FIERY_SMOKE: A lot like PIXEL_ART_FIRE, but a layer of gray is added as well.
//     FD_VISUALIZATION_SHADER.THICK_SMOKE: Draws the fluid with lighting and a threshold making it look thicker.

argument0.visualization_shader = argument1;




#define fd_rectangle_set_collision_mask_sprite
/// fd_rectangle_set_collision_mask_sprite(instance id, sprite index, image index)
// Sets the collision mask of the fluid dynamics to a sprite.
// instance id: The instance id of the fluid dynamics rectangle.
// sprite index: The sprite index of the new collision mask.
// image index: The image index of the new collision mask.

with (argument0) {
    if (collision_mask_type == 0) {
        if (collision_mask_sprite_index != argument1) {
            sf_world_update = true;
        } else if (collision_mask_image_index != argument2) {
            sf_world_update = true;
        }
    } else if (collision_mask_type == 2) {
        surface_free(sf_world);
    }
    
    collision_mask_type = 0;
    collision_mask_sprite_index = argument1;
    collision_mask_image_index = argument2;
}




#define fd_rectangle_set_collision_mask_surface
/// fd_rectangle_set_collision_mask_surface(instance id, surface id)
// Sets the collision mask to a surface.
// instance id: The instance id of the fluid dynamics rectangle.
// surface id: The id of the surface to use as the new collision mask.

with (argument0) {
    if (sf_world != argument1) {
        surface_free(sf_world);
        sf_world = argument1;
    }
    
    collision_mask_type = 1;
    collision_mask_sprite_index = -1;
    collision_mask_image_index = -1;
}




#define fd_rectangle_set_shader_language
/// fd_rectangle_set_shader_language(instance id, shader language)
// Sets the shader language being used for the fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// shader language: Enum type. Set this to either FD_SHADER_LANGUAGE.HLSL_9 or FD_SHADER_LANGUAGE.GLSL_ES depending on what shader language you want the shaders used to be from.

with (argument0) {
    shader_language = argument1;
       
    switch (shader_language) {
        case FD_SHADER_LANGUAGE.HLSL_9:
            sh_fd_advect_material_a_16 = sh_fd_advect_material_a_16_hlsl;
            sh_fd_advect_material_rgba_8 = sh_fd_advect_material_rgba_8_hlsl;
            sh_fd_advect_material_a_8 = sh_fd_advect_material_a_8_hlsl;
            sh_fd_calculate_velocity_divergence = sh_fd_calculate_velocity_divergence_hlsl;
            sh_fd_advect_velocity_0 = sh_fd_advect_velocity_0_hlsl;
            sh_fd_advect_velocity_1 = sh_fd_advect_velocity_1_hlsl;
            sh_fd_calculate_pressure_jacobi = sh_fd_calculate_pressure_jacobi_hlsl;
            sh_fd_calculate_pressure_srj = sh_fd_calculate_pressure_srj_hlsl;
            sh_fd_subtract_pressure_gradient = sh_fd_subtract_pressure_gradient_hlsl; 
            sh_fd_visualize_velocity = sh_fd_visualize_velocity_hlsl;
            sh_fd_visualize_divergence = sh_fd_visualize_velocity_divergence_hlsl;
            sh_fd_visualize_pressure = sh_fd_visualize_pressure_hlsl;
            sh_fd_add_velocity = sh_fd_add_velocity_hlsl;
            sh_fd_replace_material_advanced = sh_fd_replace_material_advanced_hlsl;
            sh_fd_visualize_pixel_art_fire = sh_fd_visualize_pixel_art_fire_hlsl;
            sh_fd_visualize_colorize = sh_fd_visualize_colorize_hlsl;
            sh_fd_visualize_pixel_art_fiery_smoke = sh_fd_visualize_pixel_art_fiery_smoke_hlsl;
            sh_fd_visualize_thick_smoke = sh_fd_visualize_thick_smoke_hlsl;
            break;
            
        case FD_SHADER_LANGUAGE.GLSL_ES:
            sh_fd_advect_material_a_16 = sh_fd_advect_material_a_16_glsl;
            sh_fd_advect_material_rgba_8 = sh_fd_advect_material_rgba_8_glsl;
            sh_fd_advect_material_a_8 = sh_fd_advect_material_a_8_glsl;
            sh_fd_calculate_velocity_divergence = sh_fd_calculate_velocity_divergence_glsl;
            sh_fd_advect_velocity_0 = sh_fd_advect_velocity_0_glsl;
            sh_fd_advect_velocity_1 = sh_fd_advect_velocity_1_glsl;
            sh_fd_calculate_pressure_jacobi = sh_fd_calculate_pressure_jacobi_glsl;
            sh_fd_calculate_pressure_srj = sh_fd_calculate_pressure_srj_glsl;
            sh_fd_subtract_pressure_gradient = sh_fd_subtract_pressure_gradient_glsl;
            sh_fd_visualize_velocity = sh_fd_visualize_velocity_glsl;
            sh_fd_visualize_divergence = sh_fd_visualize_velocity_divergence_glsl;
            sh_fd_visualize_pressure = sh_fd_visualize_pressure_glsl;
            sh_fd_add_velocity = sh_fd_add_velocity_glsl;
            sh_fd_replace_material_advanced = sh_fd_replace_material_advanced_glsl;
            sh_fd_visualize_pixel_art_fire = sh_fd_visualize_pixel_art_fire_glsl;
            sh_fd_visualize_colorize = sh_fd_visualize_colorize_glsl;
            sh_fd_visualize_pixel_art_fiery_smoke = sh_fd_visualize_pixel_art_fiery_smoke_glsl;
            sh_fd_visualize_thick_smoke = sh_fd_visualize_thick_smoke_glsl;
            break;
    }
}




#define fd_rectangle_set_material_type
/// fd_rectangle_set_material_type(instance id, type)
// Sets the material type for the fluid dynamics rectangle. The material type has to do with what kind of data and how much data you want to use for the fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// type: Enum type. Select one of these:
//     FD_MATERIAL_TYPE.RGBA_16: The fluid dynamics material will be able to hold red, green, blue and alpha, each with 16 bits of precision.
//     FD_MATERIAL_TYPE.RGBA_8: Same as RGBA_16, but with 8 bits instead of 16.
//     FD_MATERIAL_TYPE.A_16: The fluid dynamics material will hold one value, with 16 bits of precision.
//     FD_MATERIAL_TYPE.A_8: The fluid dynamics material will hold one value, with 8 bits of precision.

argument0.material_type = argument1;




#define fd_rectangle_set_velocity_maccormack_weight
/// fd_rectangle_set_velocity_maccormack_weight(instance id, MacCormack weight)
// Sets the MacCormack weight for the velocity advection of the fluid dynamics simulation.
// This is a value between 0 and 1 where 0 represents the result of a Semi-Lagrangian advection scheme,
// and 1 the result of a MacCormack advection scheme. Any value in between will blend the result of the
// two schemes. The result of a high MacCormack weight is that the material will have significantly
// higher detail.
// instance id: The instance id of the fluid dynamics rectangle.
// MacCormack weight: A value between 0 and 1 for how much of the effect to be used.

argument0.velocity_maccormack_weight = argument1;




#define fd_rectangle_set_material_maccormack_weight
/// fd_rectangle_set_material_maccormack_weight(instance id, MacCormack weight)
// Sets the MacCormack weight for the material advection of the fluid dynamics simulation.
// This is a value between 0 and 1 where 0 represents the result of a Semi-Lagrangian advection scheme,
// and 1 the result of a MacCormack advection scheme. Any value in between will blend the result of the
// two schemes. The result of a high MacCormack weight is that the material will have significantly
// higher detail. In the case of material advection (as opposed to velocity advection) this is usually undesirable
// and should be set to 0 or a low value.
// instance id: The instance id of the fluid dynamics rectangle.
// MacCormack weight: A value between 0 and 1 for how much of the effect to be used.

argument0.material_maccormack_weight = argument1;




#define fd_rectangle_set_velocity_time_step
/// fd_rectangle_set_velocity_time_step(instance id, time step)
// Sets the velocity time step of the fluid dynamics rectangle. This is a value that affects how
// quickly the velocity of the fluid moves itself around (advection). Usually you want this to be the same as the material time step.
// instance id: The instance id of the fluid dynamics rectangle.
// time step: 1 is the default value. Lower values will make the fluid move slower. High values make it faster,
//     but will also be less precise.

argument0.velocity_time_step = argument1;




#define fd_rectangle_set_material_time_step
/// fd_rectangle_set_material_time_step(instance id, time step)
// Sets the material time step of the fluid dynamics rectangle. This is a value that affects how
// quickly the fluid moves around. Usually you want this to be the same as the velocity time step.
// instance id: The instance id of the fluid dynamics rectangle.
// time step: 1 is the default value. Lower values will make the fluid move slower. High values make it faster,
//     but will also be less precise.

argument0.material_time_step = argument1;




#define fd_rectangle_set_velocity_dissipation_value
/// fd_rectangle_set_velocity_dissipation_value(instance id, dissipation value)
// Sets the amount of dissipation of the velocity of fluid, as in how much it slows down over time.
// instance id: The instance id of the fluid dynamics rectangle.
// dissipation value: The value affecting the dissipation of velocity. See fd_rectangle_set_velocity_dissipation_type for an explanation on
//     what this value should be.

argument0.velocity_dissipation_value = argument1;




#define fd_rectangle_set_velocity_dissipation_type
/// fd_rectangle_set_velocity_dissipation_type(instance id, dissipation type)
// Sets the type of dissipation for the velocity of a fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// dissipation type: The type of dissipation to use, either 0 or 1:
//     0: The dissipation value is multiplied with the velocity, meaning that a dissipation value of 1 will maintain
//     the velocity without changing it, and 0 will instantly stop it. A value of 0.999 will slowly slow the fluid down.
//     A value of 0.99 will slow it down slightly quicker. A value of 0.95 will slow it down pretty fast. Etc.
//     1: The dissipation value is subtracted toward 0 for the velocity, meaning that a dissipation value of 0 will subtract nothing from the velocity,
//     making it unchanged. A value of e.g. 0.001 will subtract 0.001 from the x and y velocity until it stops.

argument0.velocity_dissipation_type = argument1;




#define fd_rectangle_set_material_dissipation_value
/// fd_rectangle_set_material_dissipation_value(instance id, dissipation value)
// Sets the amount of dissipation of the material of fluid, as in how quickly it fades out.
// instance id: The instance id of the fluid dynamics rectangle.
// dissipation value: The value affecting the dissipation of the material. See fd_rectangle_set_material_dissipation_type for an explanation on
//     what this value should be.

argument0.material_dissipation_value = argument1;




#define fd_rectangle_set_material_dissipation_type
/// fd_rectangle_set_material_dissipation_type(instance id, dissipation type)
// Sets the type of dissipation for the material of a fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// dissipation type: The type of dissipation to use, either 0 or 1:
//     0: The dissipation value is multiplied with the material alpha, meaning that a dissipation value of 1 will maintain
//     the alpha without changing it, and 0 will instantly make it invisible. A value of 0.999 will slowly fade out the material.
//     1: The dissipation value is subtracted from the alpha, meaning that a dissipation value of 0 will subtract nothing from the alpha,
//     making it unchanged. A value of e.g. 0.001 will subtract 0.001 from the alpha until it has disappeared completely.

argument0.material_dissipation_type = argument1;




#define fd_rectangle_set_pressure_iteration_type
/// fd_rectangle_set_pressure_iteration_type(instance id, iteration type)
// Sets the type of iteration to use for solving the pressure in the fluid dynamics simulation. This is the most intensive part of the fluid dynamics
// simulation and should therefore be the first thing to address whenever you want to optimize or enhance detail.
// instance id: The instance id of the fluid dynamics rectangle.
// iteration type: The recommended type of iteration is SRJ iteration. This can selected by setting the iteration type to a negative value.
//     There are 4 types of SRJ iteration. The higher the iteration count, the higher the detail, but it's much more intensive:
//     -1 for 16 iterations. -2 for 31 iterations. -3 for 64 iterations. -4 for 131 iterations.
//     If you instead of a negative value use a positive one, traditional jacobi iteration will be used, where the number you input equals the number
//     of jacboi iterations that will be performed. So a value of 100 will use 100 jacobi iterations, while a value of 50 will use 50 jacobi iterations.
//     SRJ iteration is recommended as it's much more efficient, but in case you want to use traditional jacobi iteration, you usually want a value above 30.

with (argument0) {
    pressure_iteration_type = argument1;
    if (argument1 < 0) {
        pressure_relaxation_parameter = 0;
        var i = 0, j;
        switch (argument1) {
            case -1:
                for (j = 0; j < 1; ++j) {if (j == 0) pressure_relaxation_parameter[i] = 32.6; else pressure_relaxation_parameter[i] = -1; ++i;}
                for (j = 0; j < 15; ++j) {if (j == 0) pressure_relaxation_parameter[i] = 0.8630; else pressure_relaxation_parameter[i] = -1; ++i;}
                break;
                
            case -2:
                for (j = 0; j < 1; ++j) {if (j == 0) pressure_relaxation_parameter[i] = 81.22; else pressure_relaxation_parameter[i] = -1; ++i;}
                for (j = 0; j < 30; ++j) {if (j == 0) pressure_relaxation_parameter[i] = 0.9178; else pressure_relaxation_parameter[i] = -1; ++i;}
                break;
                
            case -3:
                for (j = 0; j < 1; ++j) {if (j == 0) pressure_relaxation_parameter[i] = 190.2; else pressure_relaxation_parameter[i] = -1; ++i;}
                for (j = 0; j < 63; ++j) {if (j == 0) pressure_relaxation_parameter[i] = 0.9532; else pressure_relaxation_parameter[i] = -1; ++i;}
                break;
                
            case -4:
                for (j = 0; j < 1; ++j) {if (j == 0) pressure_relaxation_parameter[i] = 425.8; else pressure_relaxation_parameter[i] = -1; ++i;}
                for (j = 0; j < 130; ++j) {if (j == 0) pressure_relaxation_parameter[i] = 0.9742; else pressure_relaxation_parameter[i] = -1; ++i;}
                break;
        }
    }
}




#define fd_rectangle_set_initial_value_pressure
/// fd_rectangle_set_initial_value_pressure(instance id, initial value)
// This sets the initial value that all pixels are cleared to before performing pressure iteration.
// instance id: The instance id of the fluid dynamics rectangle.
// initial value: A value between 0 and 1. Usually you want to use 0.5, but you might want to experiment with different values
//     to see if you get a result that looks better for your implementation.

argument0.initial_value_pressure = argument1;




#define fd_rectangle_set_pressure_size
/// fd_rectangle_set_pressure_size(instance id, width, height);
// Sets the size of the pressure texture used for the fluid dynamics simulation. Usually you want to keep this the same size as the other textures.
// instance id: The instance id of the fluid dynamics rectangle.
// width, height: The width and height of the texture.

with (argument0) {
    surface_free(sf_pressure); surface_free(sf_pressure_temporary);
    sf_pressure_width = argument1;
    sf_pressure_height = argument2;
    sf_pressure_texel_width = 1 / sf_pressure_width;
    sf_pressure_texel_height = 1 / sf_pressure_height;
}




#define fd_rectangle_set_material_size
/// fd_rectangle_set_material_size(instance id, width, height);
// Sets the size of the material textures used for the fluid dynamics simulation. Usually you want to keep this the same size as the other textures.
// instance id: The instance id of the fluid dynamics rectangle.
// width, height: The width and height of the texture.

with (argument0) {
    surface_free(sf_material_0); surface_free(sf_material_0_temporary);
    surface_free(sf_material_1); surface_free(sf_material_1_temporary);
    sf_material_width = argument1;
    sf_material_height = argument2;
    sf_material_texel_width = 1 / sf_material_width;
    sf_material_texel_height = 1 / sf_material_height;
}




#define fd_rectangle_set_velocity_size
/// fd_rectangle_set_velocity_size(instance id, width, height);
// Sets the size of the velocity texture used for the fluid dynamics simulation. Usually you want to keep this the same size as the other textures.
// instance id: The instance id of the fluid dynamics rectangle.
// width, height: The width and height of the texture.

with (argument0) {
    surface_free(sf_velocity); surface_free(sf_velocity_temporary);
    sf_velocity_width = argument1;
    sf_velocity_height = argument2;
    sf_velocity_texel_width = 1 / sf_velocity_width;
    sf_velocity_texel_height = 1 / sf_velocity_height;
}




#define fd_rectangle_set_repeat
/// fd_rectangle_set_repeat(instance id, repeat)
// Set this to true if you want the fluid to wrap around the texture, as in when it goes to the right end of fluid dynamics rectangle
// it will wrap around to the left end.
// instance id: The instance id of the fluid dynamics rectangle.
// repeat: True to enable repeat, false to disable it.

argument0.texture_repeat = argument1;




#define fd_rectangle_set_acceleration
/// fd_rectangle_set_acceleration(instance id, x acceleration, y acceleration, [a], [b])
// Sets the acceleration of the fluid within the fluid dynamics rectangle.
// Every pixel in the fluid dynamics rectangle will have its acceleration set using one of these two equations:
// 1. Simplest, no material sampler needed for the shader: acceleration = (x acceleration, y acceleration).
// 2. Customizable, material sampler needed for the shader: acceleration = (a * m^2 + b * m) * (x acceleration, y acceleration)
// In the equations above, m represents the mass of the fluid at that pixel, as in how much alpha it has, how visible it is, and will be from 0 to 1.
// a and b represent the arguments for a and b entered for this script, the same goes for x acceleration and y acceleration. You want to keep
// the acceleration resulting from the equation somewhere between -1 and 1.
// instance id: The instance id of the fluid dynamics rectangle.
// x acceleration: The horizontal acceleration.
// y acceleration: The vertical acceleration.
// [a]: Will be used as "a" in the equation for calculating acceleration explained above. You can set this to undefined or omit it if you don't need it.
// [b]: Will be used as "b" in the equation for calculating acceleration explained above. You can set this to undefined or omit it if you don't need it.

with (argument[0]) {
    acceleration_x = argument[1];
    acceleration_y = argument[2];
    
    if (argument_count > 3 && !is_undefined(argument[3])) acceleration_a = argument[3]; else acceleration_a = 0;
    if (argument_count > 4 && !is_undefined(argument[4])) acceleration_b = argument[4]; else acceleration_b = 0;
    
    if ((acceleration_x == 0 && acceleration_y == 0) || (acceleration_a == 0 && acceleration_b == 0)) {
        acceleration_type = 0;
    } else {
        acceleration_type = 1;
    }
}




#define fd_rectangle_get_visualization_shader
/// fd_rectangle_get_visualization_shader(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.visualization_shader;




#define fd_rectangle_get_collision_mask_sprite
/// fd_rectangle_get_collision_mask_sprite(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.collision_mask_sprite_index;




#define fd_rectangle_get_collision_mask_sprite_image
/// fd_rectangle_get_collision_mask_sprite_image(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.collision_mask_image_index;




#define fd_rectangle_get_collision_mask_surface
/// fd_rectangle_get_collision_mask_surface(instance id)
// Returns the collision mask surface of the fluid dynamics rectangle.
// Even if you have the collision mask set to a sprite, it will still need a surface to function, so
// this will always give the active collision mask.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.sf_world;




#define fd_rectangle_get_material_surface
/// fd_rectangle_get_material_surface(instance id)
// Returns the material surface of a fluid dynamics rectangle.
// Formats:
// FD_MATERIAL_TYPE.RGBA_16: You will receive the surface containing the most significant bits of the red, green, blue and alpha in the normal order.
// FD_MATERIAL_TYPE.RGBA_8: You will receive the surface containing the red, green, blue and alpha in the normal order.
// FD_MATERIAL_TYPE.A_16: You will receive a surface containing the most significant 8 bits of alpha in the alpha channel, and the least significant 8 bits in the blue channel.
// FD_MATERIAL_TYPE.A_8: You will receive a surface containing the alpha, and it will be in the alpha channel.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.sf_material_0;




#define fd_rectangle_get_velocity_surface
/// fd_rectangle_get_velocity_surface(instance id)
// Returns the velocity surface of a fluid dynamics rectangle.
// Format:
// There are 4 channels, so 8*4 bits in total. The x velocity gets 16 bits and the y velocity gets 16 bits.
// This means the x and y velocity covers two channels each. The x velocity will cover the red and blue channel, and
// the y velocity will cover the green and alpha channel. The most significant bits will be in the first channel (red for
// x, and green for y). Since the color channels are unsigned values from 0 to 255, and signed values are essential for
// velocities, the range is shifted to make everything below 128 negative, and anything above 128 positive, meaning that a value
// of 128 corresponds to no velocity.
// See the example code's obj_fd_example_leaf for an example implementation on how to extract velocity from this format.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.sf_velocity;




#define fd_rectangle_get_shader_language
/// fd_rectangle_get_shader_language(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.shader_language;




#define fd_rectangle_get_material_type
/// fd_rectangle_get_material_type(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.material_type;




#define fd_rectangle_get_velocity_maccormack_weight
/// fd_rectangle_get_velocity_maccormack_weight(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.velocity_maccormack_weight;




#define fd_rectangle_get_material_maccormack_weight
/// fd_rectangle_get_material_maccormack_weight(instance id, MC weight)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.material_maccormack_weight;




#define fd_rectangle_get_velocity_time_step
/// fd_rectangle_get_velocity_time_step(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.velocity_time_step;




#define fd_rectangle_get_material_time_step
/// fd_rectangle_get_material_time_step(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.material_time_step;




#define fd_rectangle_get_velocity_dissipation_value
/// fd_rectangle_get_velocity_dissipation_value(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.velocity_dissipation_value;




#define fd_rectangle_get_velocity_dissipation_type
/// fd_rectangle_get_velocity_dissipation_type(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.velocity_dissipation_type;




#define fd_rectangle_get_material_dissipation_value
/// fd_rectangle_get_material_dissipation_value(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.material_dissipation_value;




#define fd_rectangle_get_material_dissipation_type
/// fd_rectangle_get_material_dissipation_type(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.material_dissipation_type;




#define fd_rectangle_get_pressure_iteration_type
/// fd_rectangle_get_pressure_iteration_type(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.pressure_iteration_type;




#define fd_rectangle_get_initial_value_pressure
/// fd_rectangle_get_initial_value_pressure(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.initial_value_pressure;




#define fd_rectangle_get_pressure_width
/// fd_rectangle_get_pressure_width(instance id);
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.sf_pressure_width;




#define fd_rectangle_get_pressure_height
/// fd_rectangle_get_pressure_height(instance id);
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.sf_pressure_height;




#define fd_rectangle_get_material_width
/// fd_rectangle_get_material_width(instance id);
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.sf_material_width;




#define fd_rectangle_get_material_height
/// fd_rectangle_get_material_height(instance id);
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.sf_material_height;




#define fd_rectangle_get_velocity_width
/// fd_rectangle_get_velocity_width(instance id);
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.sf_velocity_width;




#define fd_rectangle_get_velocity_height
/// fd_rectangle_get_velocity_height(instance id);
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.sf_velocity_height;




#define fd_rectangle_get_repeat
/// fd_rectangle_get_repeat(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.texture_repeat;




#define fd_rectangle_get_acceleration_x
/// fd_rectangle_get_acceleration_x(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.acceleration_x;




#define fd_rectangle_get_acceleration_y
/// fd_rectangle_get_acceleration_y(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.acceleration_y;




#define fd_rectangle_get_acceleration_a
/// fd_rectangle_get_acceleration_a(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.acceleration_a;




#define fd_rectangle_get_acceleration_b
/// fd_rectangle_get_acceleration_b(instance id)
// Returns the value corresponding to the "set" script version of this script.
// instance id: The instance id of the fluid dynamics rectangle.

return argument0.acceleration_b;




#define fd_rectangle_create_view
/// fd_rectangle_create_view(sf width, sf height, shader language, view number, edge buffer size)
// Creates a fluid dynamics rectangle attached to a view and returns its instance id. This instance id should be stored and be used together with the other scripts of this asset.
// sf width, sf height: The width and height of the fluid dynamics rectangle. This does not need to be the same as the amount of pixels it will cover. It's usually a good idea to make
//     it about a third the size of what it will actually cover on screen.
// shader language: Enum type. Set this to either FD_SHADER_LANGUAGE.HLSL_9 or FD_SHADER_LANGUAGE.GLSL_ES depending on what shader language you want the shaders used to be from.
// view number: The view to attach the fluid dynamics rectangle to.
// edge buffer size: The number of pixels of padding to add around the view for the fluid dynamics rectangle.

with (fd_rectangle_create(argument0 + (2 * argument4), argument1 + (2 * argument4), argument2)) {
    fd_edge_buffer_size = argument4;
    fd_view_number = argument3;
    fd_wratio = view_wview[fd_view_number] / argument0;
    fd_hratio = view_hview[fd_view_number] / argument1;
    view_xview_previous = view_xview[fd_view_number];
    view_yview_previous = view_yview[fd_view_number];
    return id;
}





#define fd_rectangle_update_view
/// fd_rectangle_update_view(instance_id)
// Updates a fluid dynamics rectangle attached to a view, proceeding the simulation one step further.
// instance id: The instance id of the fluid dynamics rectangle to update.

with (argument0) {  

    if (!surface_exists(sf_world)) {
        sf_world = surface_create(
                (view_wview[fd_view_number] / fd_wratio) + (2 * fd_edge_buffer_size), 
                (view_hview[fd_view_number] / fd_hratio) + (2 * fd_edge_buffer_size));
        sf_world_update = false;
    }
    
    fd_rectangle_update(argument0);

    surface_set_target(sf_world);
        draw_clear_alpha(0, c_black);
    surface_reset_target();
}






#define fd_rectangle_draw_view
///fd_rectangle_draw_view(instance id, color, alpha, use interpolation)
// Draws a fluid dynamics rectangle that has been attached to a view.
// instance id: The instance id of the fluid dynamics rectangle.
// color: The image blending color, the same as color in draw_surface_ext.
// alpha: The alpha to draw at, the same as alpha in draw_surface_ext.
// use interpolation: Set this to true if you want linear interpolation to be enabled, and false if you want nearest neighbor to be used instead.

with (argument0) {

    fd_rectangle_shift_content(argument0,
            (view_xview_previous-view_xview[fd_view_number]) / fd_wratio,
            (view_yview_previous-view_yview[fd_view_number]) / fd_hratio);
    
    fd_rectangle_draw_part(id, fd_edge_buffer_size, fd_edge_buffer_size, 
            view_wview[fd_view_number] / fd_wratio, view_hview[fd_view_number] / fd_hratio, 
            view_xview[fd_view_number], view_yview[fd_view_number], 
            fd_wratio, fd_hratio, argument1, argument2, argument3);

    view_xview_previous = view_xview[fd_view_number];
    view_yview_previous = view_yview[fd_view_number];
}





#define fd_draw_self_to_collision_mask_surface
///fd_draw_self_to_collision_mask_surface(instance id);
// Draws a sprite to a fluid dynamics rectangle's collision mask surface. If a fluid dynamics rectangle is attached to a view (as obtained from fd_rectangle_create_view),
// this script should be called every step for the collision instances that block the fluid. This will draw the sprite at the correct position in the collision mask according
// to the new view position. Call it before fd_rectangle_update_view. If you e.g. call fd_rectangle_update_view in the step event, call this in the begin step event.
// instance id: The instance id of the fluid dynamics rectangle.

surface_set_target(fd_rectangle_get_collision_mask_surface(argument0));
    draw_sprite_ext(sprite_index, image_index, fd_x(argument0, x), fd_y(argument0, y), image_xscale / argument0.fd_wratio, image_yscale / argument0.fd_hratio, image_angle, image_blend, image_alpha);
surface_reset_target();






#define fd_draw_sprite_to_collision_mask_surface
/// fd_draw_sprite_to_collision_mask_surface(instance id, sprite, subimg, x, y, xscale, yscale, rot, color, alpha);
// Draws a sprite to a fluid dynamics rectangle's collision mask surface. If a fluid dynamics rectangle is attached to a view (as obtained from fd_rectangle_create_view),
// this script should be called every step for the collision instances that block the fluid. This will draw the sprite at the correct position in the collision mask according
// to the new view position. Call it before fd_rectangle_update_view. If you e.g. call fd_rectangle_update_view in the step event, call this in the begin step event.
// instance id: The instance id of the fluid dynamics rectangle.
// sprite, subimg, x, y, xscale, yscale, rot, color, alpha: See draw_sprite_ext in the GameMaker manual.

surface_set_target(fd_rectangle_get_collision_mask_surface(argument0));
    draw_sprite_ext(argument1, argument2, fd_x(argument0, argument3), fd_y(argument0, argument4), argument5 / argument0.fd_wratio, argument6 / argument0.fd_hratio, argument7, argument8, argument9);
surface_reset_target();






#define fd_draw_surface_to_collision_mask_surface
///fd_draw_surface_to_collision_mask_surface(fd instance id, surface id, x, y, xscale, yscale, rot, color, alpha);
// Draws a surface to a fluid dynamics rectangle's collision mask surface. If a fluid dynamics rectangle is attached to a view (as obtained from fd_rectangle_create_view),
// this script should be called every step to draw the surface blocking the fluid. This will draw the surface at the correct position in the collision mask according to the
// new view position. Call it before fd_rectangle_update_view. If you e.g. call fd_rectangle_update_view in the step event, call this in the begin step event.
// instance id: The instance id of the fluid dynamics rectangle.
// surface id, x, y, xscale, yscale, rot, color, alpha: See draw_surface_ext in the GameMaker manual.

surface_set_target(fd_rectangle_get_collision_mask_surface(argument0));
    draw_surface_ext(argument1, fd_x(argument0, argument2), fd_y(argument0, argument3), argument4 / argument0.fd_wratio, argument5 / argument0.fd_hratio, argument6, argument7, argument8);
surface_reset_target();






#define fd_rectangle_assure_surfaces_exist
/// fd_rectangle_assure_surfaces_exist(instance id)

with (argument0) {
    if (!surface_exists(sf_pressure)) {sf_pressure = surface_create(sf_pressure_width, sf_pressure_height); surface_set_target(sf_pressure); draw_clear_alpha($000000, 0); surface_reset_target();}
    if (!surface_exists(sf_pressure_temporary)) {sf_pressure_temporary = surface_create(sf_pressure_width, sf_pressure_height);}
    
    if (!inherit_velocity) {
        if (!surface_exists(sf_velocity)) {sf_velocity = surface_create(sf_velocity_width, sf_velocity_height); surface_set_target(sf_velocity); draw_clear_alpha($008080, 0); surface_reset_target();}
        if (!surface_exists(sf_velocity_temporary)) {sf_velocity_temporary = surface_create(sf_velocity_width, sf_velocity_height);}
    }
    
    if (!surface_exists(sf_material_0)) {
        sf_material_0 = surface_create(sf_material_width, sf_material_height); surface_set_target(sf_material_0); draw_clear_alpha($000000, 0); surface_reset_target();
        material_surface_was_created = true;
    }
    if (!surface_exists(sf_material_0_temporary)) {sf_material_0_temporary = surface_create(sf_material_width, sf_material_height);}
    if (!surface_exists(sf_material_1)) {sf_material_1 = surface_create(sf_material_width, sf_material_height); surface_set_target(sf_material_1); draw_clear_alpha($000000, 0); surface_reset_target();}
    if (!surface_exists(sf_material_1_temporary)) {sf_material_1_temporary = surface_create(sf_material_width, sf_material_height);}
    
    if (!surface_exists(sf_world)) sf_world_update = true;
    if (sf_world_update) {
        if (collision_mask_type == 0) {
            sf_world = surface_create(sprite_get_width(collision_mask_sprite_index), sprite_get_height(collision_mask_sprite_index));
            surface_set_target(sf_world);
                draw_clear_alpha($00FFFF, 0);
                draw_sprite(collision_mask_sprite_index, collision_mask_image_index, 0, 0);
            surface_reset_target();
        } else if (collision_mask_type == 1) {
            var error_string = "Fluid Dynamics error. An invalid collision mask surface was provided for a fluid dynamics rectangle." + chr(13) + chr(10) + "It could be that the surface spontaneously ceased to exist (because " +
                        "of surfaces' volatile behavior)" + chr(13) + chr(10) + "thereby making it invalid. When setting your own collision masks with fd_rectangle_set_collision_mask_surface," + chr(13) + chr(10) +
                        "make sure to manually assure their existence each time before calling fd_rectangle_update." + chr(13) + chr(10);
            show_debug_message(error_string);
            show_error(error_string, false);
        } else if (collision_mask_type == 2) {
            sf_world = surface_create(4, 4);
            surface_set_target(sf_world);
                draw_clear_alpha($00FFFF, 0);
            surface_reset_target();
        }
        sf_world_update = false;
    }
}




#define fd_rectangle_enums
// This script is not meant to be called.

enum FD_TARGET_TYPE {
    REPLACE_MATERIAL,
    REPLACE_MATERIAL_ADVANCED,
    ADD_MATERIAL,
    REPLACE_VELOCITY,
    ADD_VELOCITY
}

enum FD_MATERIAL_TYPE {
    RGBA_16,
    RGBA_8,
    A_16,
    A_8
}

enum FD_VISUALIZATION_SHADER {
    NO_SHADER = -1,
    DEBUG_VELOCITY = -2,
    DEBUG_VELOCITY_DIVERGENCE = -3,
    DEBUG_PRESSURE = -4,
    PIXEL_ART_FIRE = -5,
    COLORIZE = -6,
    PIXEL_ART_FIERY_SMOKE = -7,
    THICK_SMOKE = -8
}

enum FD_SHADER_LANGUAGE {
    HLSL_9,
    GLSL_ES
}




#define fd_x
/// fd_x(instance id, x)
// Returns the x coordinate on the fluid dynamics surface.

return ((argument1 - view_xview[argument0.fd_view_number]) / fd_rectangle.fd_wratio) + argument0.fd_edge_buffer_size;




#define fd_y
/// fd_y(instance id, y)
// Returns the y coordinate on the fluid dynamics surface.

return ((argument1 - view_yview[argument0.fd_view_number]) / fd_rectangle.fd_hratio) + argument0.fd_edge_buffer_size;