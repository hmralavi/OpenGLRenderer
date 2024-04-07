#version 330 core
layout (location = 0) in vec3 pos;
layout (location = 1) in vec2 in_tex_coord;
layout (location = 2) in vec3 in_vert_normal;

uniform float scale; //scale local_pos
uniform mat4 model_M; //from local to world space
uniform mat4 view_M; //from world to camera POV
uniform mat4 projection_M; //perspective projection

out vec2 tex_coord;
out vec3 frag_normal;

void main()
{
    gl_Position = projection_M * view_M * model_M * vec4(scale*pos, 1.0f);
    tex_coord = vec2(in_tex_coord.x, in_tex_coord.y);
    frag_normal = (view_M * model_M * vec4(normalize(in_vert_normal), 0.0f)).xyz;
}