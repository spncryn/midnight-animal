/*

If you have time for me, review Glare Engine on the marketplace,
  thanks!
=========================================
> CONTACTS
=========================================
Feature suggestions or bugs reports at 
    
    RevolabStaff@gmail.com

=========================================
> LINKS
========================================= 
Tutorials and examples

    http://tizsoft.altervista.org/glare/doc2/

=========================================
> CREDITS
=========================================
    - Top-Down character sprite by Chessmasterriley
    http://gmc.yoyogames.com/index.php?showtopic=657581#entry4765613

=========================================
> CHANGELOG
=========================================

V2.4.1
    - Fixed a major bug with static lights rendering
    - Improved examples

V2.3
    - Fixed file names (now they cannot go in conflict with yours)
    - Added directional custom shadows (useful for trees fake foliage shadows)
    - Fixed many minor bugs
    
V2.2
    - NEW FEATURE "shadows receiver": now you can have a sky background without shadows and
      use sprites to receive the shadows: use glr_enable_background(false)
    - Improved directional light performance and removed "fake directional shadows"
    - Added checks in debug_mode. Now, if you hit the red play button,
      the engine shows more detailed error messages
    - Added glr_draw_debug() to show some interactive stats and enable/disable effects
    - HTML5 module is now available with limited features (No depth rendering, due to webgl limits)
      you can use glr_render_html5()
    - resized lights to power of 2, to avoid warning on some platforms
    - Fixed bugs and improved the code
    - Fixed Typos in script documentation

V2.0.5
    - Fixed: Simplelights color does not change in new rendering system
    - Fixed: black screen when enable fxaa in new rendering system in new projects
    - Improved isometric demo
    
v2.0
    
< NEW FEATURES >
- Depth ordered shadow rendering
- Now you can merge meshes to reduce draw calls(submesh)
- Added Soft shadows with glr_enable_blur(true)
- Faster Access to variables through Enums
- Added glr_light_set_transform and glr_mesh_set_transform
    to set x,y,xscale,yscale,rot in a single call  (prefer this function instead
    of glr_set_position + glare_set_rotation etc. to improve performances)
- Improved depth sorting for directional lights
- Improved matrix calculations and bounding-circle culling
- Added submeshes to group meshes
- Added ShadowDepth functions
- Faster ambient occlusion (3x)
- Added glr_set_ambient_occlusion_intensity
- General Code refactoring
- Added getter functions
- Added 8 new light mask sprites

< FIXED >
- Fixed Light offset
- Fixed Light y scaling

< DOCUMENTATION >
- Now the documentation is included in each script!
- Improved auto completion code

< CHANGES >
- Changed glr_free behaviour: now destroys all data structures and resources
- Changed: glr_mesh_vertex_get_count ->  glr_mesh_get_vertex_count
- Changed glr_shader_base --> glr_shader_mesh

< REMOVED >
- Removed: glr_mesh_vertex_* functions
- Removed: glr_shadowdepth_update
- Removed: glr_mesh_invert_culling 
- Removed: glr_mesh_create_from_tiles 
- Removed: glr_enable_intensity


v1.6.3
    - improved ambient occlusion speed
    - improved roof example


v1.6.1
    - added Shadow Areas
    - new function: glr_shadowarea_create
    - new function: glr_shadowarea_set_illumination
    - new function: glr_shadowarea_destroy, glr_shadowarea_destroy_all
    - improved Demo
    - new roof example


v1.5.0
    - added glr_mesh_set_directional_shadow_length(mesh id, length)
    - workaround to avoid matrix memory leak
    - fixed simple lights


v1.4.0

    - Added a function to create a mesh from a tile layer glr_mesh_create_from_tiles(static, layer)
    - Tile shadows also supports directional lights and ambient occlusion
    - Improved light sprites quality
    - Added New HD point light mask

v1.3.5

    - Replaced d3d_transform functions with new matrix_functions
    - Fixed light scaling issues
    - Fixed glr_lightsimple_set_scaling
    - Fixed flickering shadows using shadowsprites

v1.3.1

    - Improved project comments and function descriptions
    - changed ds_* functions to ds accessors
    - added missing glr_light_set_sprite(light, sprite, subimg)

v1.3.0

    - Improved performances of glr_get_illumination(x, y)
    - Added glr_get_illumination_update()
    - Tidied up Project, splitting demo resources from essentials resources
    - Scripts now show up all arguments in code completion
    - Added more comments
    - Finished online documentation
    

v1.2.9

    - Added glr_mesh_vertex_add_json(mesh id, closed, json string)
    - Mesh editor online ->  https://tizzio.github.io/meshgen
    - improved mobile example [added buttons to switch options]
    


v1.2.8

    - fixed invisible shadows when scaling is < 0 
    - fixed surface issue


v1.2.5

    - fixed "Surface does not exists" when switch fullscreen
    - removed texture_set_interpolation(true) from glr_render
    

v1.2.2

    - Bugfixes


v1.2.0

    - ADDED glr_light_refresh(light)  to refresh static lightmaps
    - ADDED static spriteshadows
    - ADDED glr_shadowsprite_set_static(id, static)
    - ADDED extra argument (static) to glr_shadowsprite_create(...)
    - ADDED extra argument (static) to glr_shadowsprite_create_from_instance(...)
    - reorganized glr_light_create()
    - improved glr_render() performances

=========================================
> Thanks for your support!
=========================================
If you want, send me info/screenshot of your project so
i can it in glare projects list!


****************************************/
