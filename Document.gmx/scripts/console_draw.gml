/// console_draw(console,height,bg_color1,bg_color2,text_color1,text_color2,alpha)
var c,h,b1,b2,t1,t2,a;

c = argument0;
h = argument1;
b1 = argument2;
b2 = argument3;
t1 = argument4;
t2 = argument5;
a = argument6;

/* If enabled */
if c[? "active"] {

    //draw_sprite_stretched(sprite,0,0,0,view_wview * 4,view_hview * 4);
    /* Get view width */
    var w;
    w = 640
    
    /* Get line height */
    var l,p;
    l = 24 //string_height("W");
    p = 42; // Padding
    
    /* Console alpha */
    draw_set_alpha(a);
    
    /* Command history window */
    draw_set_color(b1);
    draw_rectangle(32,32,w,(h+(p*2)),false);
    
    /* Command history */
    var ch,list = c[? "history"];
    draw_set_color(t1);
    draw_set_halign(fa_left);
    for (ch=0;ch<round(h/l);ch++) {
    
        var cmd = list[| ch];
        if !is_undefined(cmd) draw_text(p + 32,h-(p*2)-(ch*l),cmd);
    }
    
    /* Suggestions */
    if ds_exists(c[? "suggestions"],ds_type_list)
    && ds_list_size(c[? "suggestions"]) > 0 {
        var s,sugs = c[? "suggestions"];
        draw_set_color(b1);
        draw_rectangle(32,(h+(p*4))+l,w,(h+(p*4))+l+(l*ds_list_size(sugs))+(p*2),false);
        draw_set_color(t1);
        for(s=0;s<ds_list_size(sugs);s++) {
            if !is_undefined(sugs[| s]) {
                draw_text(p + 32,((h+(p*5))+l)+(l*s),sugs[| s]);
            }
        }
    }
    
    /* Submit window */
    draw_set_color(b2);
    draw_rectangle(32,(h+(p*2)),w,(h+(p*4))+l,false);
    
    /* Greater than symbol */
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(t1);
    draw_text(p,h+(p*3),"> ");
    
    /* Draw input */
    draw_set_alpha(1);
    draw_set_color(t2);
    draw_text(p+string_width("> "),h+(p*3),c[? "string"]);
    
    /* Cursor alpha */
    c[? "cursor"] += 0.1;
    if c[? "cursor"] <= 1 then draw_set_alpha(1);
    if c[? "cursor"] > 1 && c[? "cursor"] <= 2 then draw_set_alpha(0);
    if c[? "cursor"] > 2 {
        draw_set_alpha(1);
        c[? "cursor"] = 0;
    }
    
    /* Draw cursor */
    draw_text(p+string_width("> ")+string_width(string_copy(c[? "string"],1,c[? "string_pos"]-1)),h+(p*3),"|");

    /* Reset alpha */
    draw_set_alpha(1);
    draw_set_valign(fa_center);
    
}


