//Godray Vertex Shader

attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 fragCoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    fragCoord = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//Godray Fragment Shader

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 fragCoord;

uniform vec2  iResolution; // viewport resolution (in pixels)
uniform float iGlobalTime; // shader playback time (in seconds)

//Source: shadertoy.com - "Light rays" by user "ElusivePete"

float rayStrength(vec2 raySource, vec2 rayRefDirection, vec2 coord, float seedA, float seedB, float speed)
{
  vec2 sourceToCoord = coord - raySource;
  float cosAngle = dot(normalize(sourceToCoord), rayRefDirection);

  return clamp(
  (0.45 + 0.15 * sin(cosAngle * seedA + iGlobalTime * speed)) +
  (0.3 + 0.2 * cos(-cosAngle * seedB + iGlobalTime * speed)),
   0.0, 1.0) *
   clamp((iResolution.x - length(sourceToCoord)) / iResolution.x, 0.5, 1.0);
}

void main()
{
  vec2 coord = vec2(fragCoord.x, fragCoord.y);
  
  // Set the parameters of the sun rays
  vec2 rayPos1 = vec2(iResolution.x * 0.7, iResolution.y * -0.4);
  vec2 rayRefDir1 = normalize(vec2(1.0, -0.116));
  float raySeedA1 = 36.2214;
  float raySeedB1 = 21.11349;
  float raySpeed1 = 1.5;
  
  vec2 rayPos2 = vec2(iResolution.x * 0.8, iResolution.y * -0.6);
  vec2 rayRefDir2 = normalize(vec2(1.0, 0.241));
  const float raySeedA2 = 22.39910;
  const float raySeedB2 = 18.0234;
  const float raySpeed2 = 1.1;
  
  // Calculate the colour of the sun rays on the current fragment
  vec4 rays1 =
  vec4(1.0, 1.0, 1.0, 1.0) *
  rayStrength(rayPos1, rayRefDir1, coord, raySeedA1, raySeedB1, raySpeed1);
   
  vec4 rays2 =
  vec4(1.0, 1.0, 1.0, 1.0) *
  rayStrength(rayPos2, rayRefDir2, coord, raySeedA2, raySeedB2, raySpeed2);
  
  gl_FragColor = rays1 * 0.5 + rays2 * 0.4;
  
  // Attenuate brightness towards the bottom, simulating light-loss due to depth.
  // Give the whole thing a blue-green tinge as well.
  float brightness = 1.0 - (coord.y / iResolution.y);
  gl_FragColor.x *= 0.1 + (brightness * 0.8);
  gl_FragColor.y *= 0.3 + (brightness * 0.6);
  gl_FragColor.z *= 0.5 + (brightness * 0.5);
}

