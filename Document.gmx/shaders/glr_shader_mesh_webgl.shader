attribute vec3 in_Position;
varying vec2 v_vTexcoord;
uniform vec2 LightOffset;
uniform mat4 uMatDepth; 

void main()
{
    float scale_factor = 1.0 + 50.0 * in_Position.z; 
    vec4 vertex_space_pos = vec4(in_Position.x, in_Position.y, 0, 1.0);
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vertex_space_pos;
    
    gl_Position.xy *= scale_factor;
    gl_Position.xy += LightOffset;
    
    
    v_vTexcoord = (gl_Position.xy / 2.0) + 0.5;    //coord from -1/1 to 0/1+
    
    v_vTexcoord = (uMatDepth * vec4(v_vTexcoord, 0, 1)).xy; //trasform coordinates 
    
    v_vTexcoord = (v_vTexcoord / 2.0);  //fix coords
  
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
    gl_FragColor = vec4(0, 0, 0, step(RGBToFloat(col), uShadowDepth)*strength); 
}
