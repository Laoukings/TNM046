#version 330 core


in vec3 interpolatedColor;
out vec4 finalcolor;

void main() {
finalcolor = vec4(interpolatedColor, 1.0);
}