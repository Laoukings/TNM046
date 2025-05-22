#version 330 core

//uniform float time;
uniform mat4 T;

out vec4 finalcolor;

in vec3 interpolatedNormal;
uniform sampler2D tex; // A uniform variable to identify the texture
in vec2 st;

void main() {
	
	vec3 L = normalize(mat3(T) * vec3(0.0f, 0.0f, 1.0f));
	vec3 V = vec3(0.0f,0.0f,1.0f);
	vec3 N = interpolatedNormal;

	N = normalize(N);
	L = normalize(L);
	V = normalize(V);

	vec3 texture = vec3(texture(tex, st));
	vec3 scalevec = vec3(1.0f, 1.0f, 1.0f);

	vec3 ka = 0.5f * texture;
	vec3 Ia = 0.5f * scalevec;
	vec3 kd = 1.0f * texture;
	vec3 Id = 0.8f * scalevec;
	vec3 ks = 0.1f * scalevec; // Remain white
	vec3 Is = 0.9f * scalevec;

	float n = 100;
	vec3 R = 2.0 * dot(N, L) * N - L;   // Could also have used the function reflect()
	float dotNL = max(dot(N, L), 0.0);  // If negative, set to zero
	float dotRV = max(dot(R, V), 0.0);
	if (dotNL == 0.0) {
		dotRV = 0.0;  // Do not show highlight on the dark side
	}
	vec3 shadedcolor = Ia * ka + Id * kd * dotNL + Is * ks * pow(dotRV, n);
	finalcolor = vec4(shadedcolor, 1.0);
	
}