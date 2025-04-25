#version 330 core

uniform float time;
uniform mat4 T;

out vec4 finalcolor;

in vec3 interpolatedColor;


void main() {
	finalcolor = vec4(interpolatedColor, 1.0);
}