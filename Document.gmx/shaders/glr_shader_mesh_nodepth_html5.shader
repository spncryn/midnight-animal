attribute vec3 in_Position;
uniform vec2 LightOffset; 

void main()
{
    float scale_factor = 1.0 + 50.0 * in_Position.z; 
    vec4 vertex_space_pos = vec4(in_Position.x, in_Position.y, 0, 1.0);
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vertex_space_pos;
    
    gl_Position.xy *= scale_factor;
    gl_Position.xy += LightOffset; 
}    
//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float strength;

void main()
{
    gl_FragColor = vec4(0, 0, 0, strength); 
}
