///draw_text_outline(x, y, string, scale, rotation, string color, outline color)  
var xx,yy;  
xx = argument[0];  
yy = argument[1];  
  
//Outline  
draw_set_color(argument[6]);  
draw_text_transformed(xx+1, yy+1, argument[2], argument[3], argument[3], argument[4]);  
draw_text_transformed(xx-1, yy-1, argument[2], argument[3], argument[3], argument[4]);
draw_text_transformed(xx,   yy+1, argument[2], argument[3], argument[3], argument[4]);
draw_text_transformed(xx+1,   yy, argument[2], argument[3], argument[3], argument[4]);
draw_text_transformed(xx,   yy-1, argument[2], argument[3], argument[3], argument[4]);
draw_text_transformed(xx-1,   yy, argument[2], argument[3], argument[3], argument[4]);
draw_text_transformed(xx-1, yy+1, argument[2], argument[3], argument[3], argument[4]);
draw_text_transformed(xx+1, yy-1, argument[2], argument[3], argument[3], argument[4]);
  
//Text  
draw_set_color(argument[5]);  
draw_text_transformed(xx, yy, argument[2], argument[3], argument[3], argument[4]);
draw_reset()
