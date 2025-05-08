#version 330 core

uniform float time;
uniform mat4 T;

layout(location=0) in vec3 Position;
layout(location=1) in vec3 Normal;
layout(location=2) in vec2 TexCoord;


out vec3 interpolatedNormal;
out vec2 st;
out vec3 lightDirection ;

void main() {
	vec3 transformedNormal = Normal;
	interpolatedNormal = normalize(transformedNormal);
	lightDirection  = normalize(mat3(T) * vec3(1.0f, 1.0f, 1.0f));

	gl_Position = vec4(Position, 1.0); // Special, required output
	st = TexCoord; // Will also be interpolated across the triangle
}