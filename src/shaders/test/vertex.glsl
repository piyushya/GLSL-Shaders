uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

precision mediump float;

uniform float uHeight;
uniform float uTime;
uniform float uSpeed;

attribute vec3 position;
attribute float aRandom;

varying float vRandom;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    float zPos = sin(uTime * (aRandom * uSpeed));
    
    modelPosition.z = zPos * uHeight;
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;
    gl_Position = projectionPosition;
    vRandom = zPos;
}