attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;
 
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
 
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 uAmbient;

void main()
{
    float sAlpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
    float step_value = step(0.05, sAlpha);
    gl_FragColor.a = 0.0;//mix(uAmbient.a, 0.0, step_value);
    gl_FragColor.rgb = mix(uAmbient.rgb, v_vColour.rgb, step_value);
}

