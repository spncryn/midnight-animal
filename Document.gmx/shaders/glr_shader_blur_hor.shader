attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_blurTexCoords[6]; 

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vTexcoord = in_TextureCoord;
       
    v_blurTexCoords[0].xy = v_vTexcoord + vec2(-0.0100, 0.0); 
    v_blurTexCoords[1].xy = v_vTexcoord + vec2(-0.0080, 0.0);
    v_blurTexCoords[2].xy = v_vTexcoord + vec2(-0.0055, 0.0);
    v_blurTexCoords[3].xy = v_vTexcoord + vec2(-0.0035, 0.0);
    v_blurTexCoords[4].xy = v_vTexcoord + vec2(-0.0020, 0.0);
    v_blurTexCoords[5].xy = v_vTexcoord + vec2(-0.0010, 0.0);
    v_blurTexCoords[0].zw = v_vTexcoord + vec2( 0.0010, 0.0);
    v_blurTexCoords[1].zw = v_vTexcoord + vec2( 0.0020, 0.0);
    v_blurTexCoords[2].zw = v_vTexcoord + vec2( 0.0035, 0.0);
    v_blurTexCoords[3].zw = v_vTexcoord + vec2( 0.0055, 0.0);
    v_blurTexCoords[4].zw = v_vTexcoord + vec2( 0.0080, 0.0);
    v_blurTexCoords[5].zw = v_vTexcoord + vec2( 0.0100, 0.0); 
     

}
//######################_==_YOYO_SHADER_MARKER_==_######################@~  
varying vec2 v_vTexcoord;
varying vec4 v_blurTexCoords[6];
 
void main()
{
    vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 result_color = vec4(0.0, 0.0, 0.0, col.a);
     
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[0].xy).rgb*0.00895781211794;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[1].xy).rgb*0.0215963866053;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[2].xy).rgb*0.0443683338718;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[3].xy).rgb*0.0776744219933;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[4].xy).rgb*0.115876621105;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[5].xy).rgb*0.147308056121;
    result_color.rgb += col.rgb*0.159576912161;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[0].zw).rgb*0.147308056121;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[1].zw).rgb*0.115876621105;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[2].zw).rgb*0.0776744219933;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[3].zw).rgb*0.0443683338718;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[4].zw).rgb*0.0215963866053;
    result_color.rgb += texture2D(gm_BaseTexture, v_blurTexCoords[5].zw).rgb*0.00895781211794; 
      
    gl_FragColor =  result_color;
}

 
