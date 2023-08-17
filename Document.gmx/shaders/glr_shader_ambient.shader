
attribute vec3 in_Position;                   // (x,y,z)     unused in this shader.
attribute vec2 in_TextureCoord;              // (u,v)
varying vec2 v_vTexcoord;
void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;

uniform vec3 AmbientColor;
void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    col.rgb = AmbientColor;
    gl_FragColor =  col;
}

