attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;  
varying vec2 v_vViewcoord;  

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
     
    v_vTexcoord = in_TextureCoord; 
    v_vViewcoord = vec2(0.5, 0.5) + gl_Position.xy * 0.5; 
    v_vViewcoord.y = - v_vViewcoord.y;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord; 

varying vec2 v_vViewcoord; 
uniform sampler2D uAppSampler;
void main()
{
    vec3 col = texture2D(uAppSampler, v_vViewcoord).rgb;
    vec4 light = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor.rgb = (col * light.rgb ) * (1.0+light.a*4.0); 
    gl_FragColor.a = 1.0;
     
}

 
