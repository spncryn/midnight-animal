///draw_healthbar_circular(center x, center y, radius, start angle, percent health, sprite)
var cx,cy,rad,sang,hp,tex,steps,thick,oc;
cx=argument0
cy=argument1
rad=argument2
sang=argument3
hp=argument4
tex=sprite_get_texture(argument5,0)
steps=200
thick=sprite_get_height(argument5)

if ceil(steps*(hp/100)) >= 1 {
    
    oc=draw_get_color()
draw_set_color(c_white)

    var step,ang,side,hps,hpd;
    step=0
    ang=sang
    side=0
    draw_primitive_begin_texture(pr_trianglestrip,tex)
    draw_vertex_texture(cx+lengthdir_x(rad-thick/2+thick*side,ang),cy+lengthdir_y(rad-thick/2+thick*side,ang),side,side)
    side=!side
    draw_vertex_texture(cx+lengthdir_x(rad-thick/2+thick*side,ang),cy+lengthdir_y(rad-thick/2+thick*side,ang),side,side)
    side=!side
    draw_vertex_texture(cx+lengthdir_x(rad-thick/2+thick*side,ang+360/steps),cy+lengthdir_y(rad-thick/2+thick*side,ang+360/steps),side,side)
    side=!side
    hps=hp/(ceil(steps*(hp/100))+1)
    hpd=0
    repeat ceil(steps*(hp/100)+1) {
        step+=1
        
        if step=ceil(steps*(hp/100)+1) { //final step
            ang+=(360/steps)*(hp - hpd)/2
            if ang>sang+360 ang=sang+360
            draw_vertex_texture(cx+lengthdir_x(rad-thick/2+thick*side,ang),cy+lengthdir_y(rad-thick/2+thick*side,ang),side,side)
            side=!side
            draw_vertex_texture(cx+lengthdir_x(rad-thick/2+thick*side,ang),cy+lengthdir_y(rad-thick/2+thick*side,ang),side,side)
        }
        else {
            ang+=360/steps
            draw_vertex_texture(cx+lengthdir_x(rad-thick/2+thick*side,ang),cy+lengthdir_y(rad-thick/2+thick*side,ang),side,side)
            side=!side
        }
        hpd+=hps
    }
    draw_primitive_end()
    
    draw_set_color(oc)
}