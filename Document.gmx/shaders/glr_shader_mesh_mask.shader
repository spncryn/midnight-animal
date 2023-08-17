attribute vec2 in_Position;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, 0, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
void main()
{
    gl_FragColor = vec4(0,0,0,1);
}

