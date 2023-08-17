attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 uv12;
varying vec4 uv34;
varying vec4 uv56;
varying vec4 uv78;

uniform int TYPE;
uniform vec4 RESPOS;
uniform float RADIUS;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vColour = in_Colour;

    vec2 Position = RESPOS.zw/RESPOS.xy;
    float PixelSize = RADIUS/RESPOS.y;
    float size;

    vec2 texcoord[9];

    if(TYPE == 0){
        for (int i=0; i<=8; i+=1){
            size = PixelSize * float(i);
            texcoord[i] = in_TextureCoord * (1.0 + size) - size * Position;
        }
    }

    if(TYPE == 1){
        for (int i=-8; i<=0; i+=1){
            size = PixelSize * float(i);
            texcoord[i+8] = in_TextureCoord * (1.0 + size) - size * Position;
        }
    }

    if(TYPE == 2){
        for (int i=-4; i<=4; i+=1){
            size = PixelSize * float(i);
            texcoord[i+4] = in_TextureCoord * (1.0 + size) - size * Position;
        }
    }

    uv12.xy = texcoord[0];
    uv12.zw = texcoord[1];
    uv34.xy = texcoord[2];
    uv34.zw = texcoord[3];
    v_vTexcoord = texcoord[4];
    uv56.xy = texcoord[5];
    uv56.zw = texcoord[6];
    uv78.xy = texcoord[7];
    uv78.zw = texcoord[8];
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 uv12;
varying vec4 uv34;
varying vec4 uv56;
varying vec4 uv78;

void main()
{
    vec4 Blur = vec4(0.0);
    Blur += texture2D( gm_BaseTexture, uv12.xy );
    Blur += texture2D( gm_BaseTexture, uv12.zw );
    Blur += texture2D( gm_BaseTexture, uv34.xy );
    Blur += texture2D( gm_BaseTexture, uv34.zw );
    Blur += texture2D( gm_BaseTexture, v_vTexcoord);
    Blur += texture2D( gm_BaseTexture, uv56.xy );
    Blur += texture2D( gm_BaseTexture, uv56.zw );
    Blur += texture2D( gm_BaseTexture, uv78.xy );
    Blur += texture2D( gm_BaseTexture, uv78.zw );

    Blur.rgb/=9.0;
    Blur.a = 1.0;

    gl_FragColor = v_vColour * Blur;
}
