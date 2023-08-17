
attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;
  
varying vec4 v_vColour;
varying vec2 v_vViewcoord;
varying vec2 v_vTexcoord;
  
void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);

    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vColour = in_Colour; 
    v_vTexcoord = in_TextureCoord;
    
    v_vViewcoord = vec2(0.5, 0.5) + gl_Position.xy * 0.5;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec2 v_vViewcoord;
uniform vec2 frameBufSize;

uniform sampler2D uAppSampler;

const float FXAA_SPAN_MAX = 8.0;
const float FXAA_REDUCE_MUL = 1.0/8.0;
const float FXAA_REDUCE_MIN = 1.0/128.0;
 
void main( void ) {
    vec3 rgbNW=texture2D(gm_BaseTexture,v_vTexcoord+(vec2(-1.0,-1.0)/frameBufSize)).xyz;
    vec3 rgbNE=texture2D(gm_BaseTexture,v_vTexcoord+(vec2(1.0,-1.0)/frameBufSize)).xyz;
    vec3 rgbSW=texture2D(gm_BaseTexture,v_vTexcoord+(vec2(-1.0,1.0)/frameBufSize)).xyz;
    vec3 rgbSE=texture2D(gm_BaseTexture,v_vTexcoord+(vec2(1.0,1.0)/frameBufSize)).xyz;
    vec4 rgbaM=texture2D(gm_BaseTexture,v_vTexcoord);
 
    vec3 luma=vec3(0.299, 0.587, 0.114);
    float lumaNW = dot(rgbNW, luma);
    float lumaNE = dot(rgbNE, luma);
    float lumaSW = dot(rgbSW, luma);
    float lumaSE = dot(rgbSE, luma);
    float lumaM  = dot(rgbaM.xyz,  luma);
 
    float lumaMin = min(lumaM, min(min(lumaNW, lumaNE), min(lumaSW, lumaSE)));
    float lumaMax = max(lumaM, max(max(lumaNW, lumaNE), max(lumaSW, lumaSE)));
 
    vec2 dir;
    dir.x = -((lumaNW + lumaNE) - (lumaSW + lumaSE));
    dir.y =  ((lumaNW + lumaSW) - (lumaNE + lumaSE));
 
    float dirReduce = max(
        (lumaNW + lumaNE + lumaSW + lumaSE) * (0.25 * FXAA_REDUCE_MUL),
        FXAA_REDUCE_MIN);
 
    float rcpDirMin = 1.0/(min(abs(dir.x), abs(dir.y)) + dirReduce);
 
    dir = clamp(dir * rcpDirMin,
                vec2(-FXAA_SPAN_MAX),
                vec2(FXAA_SPAN_MAX)) / frameBufSize;
 
    vec3 rgbA = (1.0/2.0) * (
        texture2D(gm_BaseTexture, v_vTexcoord.xy + dir * (1.0/3.0 - 0.5)).xyz +
        texture2D(gm_BaseTexture, v_vTexcoord.xy + dir * (2.0/3.0 - 0.5)).xyz);
    vec3 rgbB = rgbA / -2.0 + (1.0/4.0) * (
        texture2D(gm_BaseTexture, v_vTexcoord.xy + dir * (0.0/3.0 - 0.5)).xyz +
        texture2D(gm_BaseTexture, v_vTexcoord.xy + dir * (3.0/3.0 - 0.5)).xyz);
    float lumaB = dot(rgbB + rgbA, luma);

    vec3 col = texture2D(uAppSampler, v_vViewcoord).rgb;
    vec4 light = vec4(rgbA + step(lumaMin, lumaB) * step(lumaB, lumaMax) * rgbB,rgbaM.w);
    gl_FragColor.rgb = (col * light.rgb ) * (1.0+light.a*4.0); 
    gl_FragColor.a = 1.0;
     

}
