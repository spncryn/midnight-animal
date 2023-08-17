//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~// Screen space lens flare. Used the technique from here
// http://john-chapman-graphics.blogspot.no/2013/02/pseudo-lens-flare.html

    varying vec2 v_vTexcoord;
    
    const float HALO_WIDTH =  0.5;
    const float CHROMATIC_DISTORTION =  24.0;
    
    uniform int ENABLE_CHROMATIC_DISTORTION;
    uniform int ENABLE_HALO;
    uniform vec2 TEX_DIMENSIONS;
    uniform float FXMul;
    uniform sampler2D lensDirtTex;
    uniform sampler2D haloMaskTex;
    uniform int MAX_GHOSTS;
    uniform float GHOST_DISPERSAL;

vec3 textureDistorted(in sampler2D tex,
    in vec2 texcoord,
    in vec2 direction, // direction of distortion
    in vec3 distortion) // per-channel distortion factor  
    {
        if (ENABLE_CHROMATIC_DISTORTION==1)
        {
        return vec3(
            texture2D(tex, texcoord + direction * distortion.r).r,
            texture2D(tex, texcoord + direction * distortion.g).g,
            texture2D(tex, texcoord + direction * distortion.b).b);
        }else{
            return texture2D(tex, texcoord).rgb;
        }
    }
    
void main()
{
    vec2 texcoord = vec2(1.0) - v_vTexcoord;
    
    vec2 ghostVec = (vec2(0.5) - texcoord) * GHOST_DISPERSAL;
    
    vec2 texelSize = 1.0 / vec2(TEX_DIMENSIONS);
    
    vec3 distortion = vec3(-texelSize.x * CHROMATIC_DISTORTION, 0.0, texelSize.x * CHROMATIC_DISTORTION);
    
    float lenOfHalf = length(vec2(0.5));
    
    vec2 direction = normalize(ghostVec);
    
    vec3 result = vec3(0.0);
    
    // sample ghosts:  
    for(int i = 0; i < MAX_GHOSTS; ++i) 
    { 
        vec2 offset = fract(texcoord + ghostVec * float(i));
        
        offset.x = clamp(0.0,1.0,offset.x);
        offset.y = clamp(0.0,1.0,offset.y);
        
        float weight_ = min(1.0,length(vec2(0.5) - offset) / ( lenOfHalf * 2.0 ));
        weight_ = pow(1.0 - weight_, 10.0);
        
        result += textureDistorted(gm_BaseTexture, offset, direction, distortion) * weight_;
    }
    
    // sample halo
    if (ENABLE_HALO==1){
        vec4 lensMod = texture2D(haloMaskTex, texcoord);
        float WIDTH = HALO_WIDTH * ( 1.0 -0.02 + lensMod.r * 0.04 );
        
        vec2 haloVec = normalize(ghostVec) * WIDTH;
        float weight = min(1.0,length(vec2(0.5) - fract(texcoord + haloVec)) / ( lenOfHalf ));
        weight = pow((1.0 - weight), 5.0) * 1.25;
        result += textureDistorted(gm_BaseTexture, texcoord + haloVec , direction, distortion) * weight * ( 1.0 -0.015 + lensMod.rgb * 0.03 );
    }
    
    result.rgb += texture2D( gm_BaseTexture, v_vTexcoord ).rgb;
    
    result.rgb *= texture2D(lensDirtTex, v_vTexcoord).rgb;
    
    // Write
    gl_FragColor = vec4( result*FXMul, 1.0 );
}
