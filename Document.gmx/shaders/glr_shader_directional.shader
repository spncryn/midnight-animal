attribute vec3 in_Position;
uniform vec2 direction; 
varying vec2 v_vTexcoord;
void main()
{  
    vec4 vertex_space_pos = vec4(in_Position.x, in_Position.y, 0, 1.0); 
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vertex_space_pos;
    gl_Position.x += in_Position.z * direction.x;
    gl_Position.y -= in_Position.z * direction.y;
    v_vTexcoord = (gl_Position.xy / 2.0) + 0.4999;  //coords from -1/1 a 0/1
    v_vTexcoord.y = -v_vTexcoord.y;             //invert y axis  
    
}    
//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float strength;
varying vec2 v_vTexcoord;
uniform float uShadowDepth;

float RGBToFloat( vec3 col )
{
    return dot( col, vec3(1.0/65025.0, 1.0/255.0, 1.0) );
}

void main()
{
    vec3 col = texture2D(gm_BaseTexture, v_vTexcoord).rgb;
    gl_FragColor = vec4(0, 0, 0, step(RGBToFloat(col), uShadowDepth)*1.0/*REPLACE 1 WITH STRENGTH*/); 
}
