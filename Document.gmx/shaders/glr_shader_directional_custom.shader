attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec2 v_vTexcoord_screen;
void main()
{  
    vec4 vertex_space_pos = vec4(in_Position.x, in_Position.y, 0, 1.0); 
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vertex_space_pos;
    
    v_vTexcoord = in_TextureCoord;
    
    v_vTexcoord_screen = (gl_Position.xy / 2.0) + 0.4999;  //coords from -1/1 a 0/1
    v_vTexcoord_screen.y = -v_vTexcoord_screen.y;             //invert y axis  
    
}    
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec2 v_vTexcoord_screen;
uniform float uShadowDepth;
uniform sampler2D uSamplerDepth;

float RGBToFloat( vec3 col )
{
    return dot( col, vec3(1.0/65025.0, 1.0/255.0, 1.0) );
}

void main()
{
    vec3 pixelDepth = texture2D(uSamplerDepth, v_vTexcoord_screen).rgb;
    vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = vec4(col.r, col.g, col.b, step(RGBToFloat(pixelDepth), uShadowDepth)*col.a); 
}
