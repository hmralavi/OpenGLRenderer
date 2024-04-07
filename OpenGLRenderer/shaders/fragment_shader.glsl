#version 330 core

in vec2 tex_coord;
in vec3 frag_normal;

out vec4 FragColor;

uniform sampler2D tex;
uniform vec3 color;
uniform float opacity;
uniform float tex_blend_fac;
uniform bool simple_shading;

void main()
{
    vec4 color_float = vec4(color.x/255.0f, color.y/255.0f, color.z/255.0f, 1.0f);
    if (simple_shading){
        FragColor = color_float;
    }else {
        vec3 ambientLightIntensity = vec3(0.4f, 0.4f, 0.4f);
        vec3 sunLightIntensity = vec3(0.4f, 0.4f, 0.4f);
        vec3 sunLightDirection = normalize(vec3(0.0f, 0.0f, 1.0f));
        vec3 lightIntensity = ambientLightIntensity + sunLightIntensity * max(dot(frag_normal, sunLightDirection), 0.0f);
        FragColor = (tex_blend_fac*texture(tex, tex_coord) + (1.0f-tex_blend_fac)*color_float * vec4(lightIntensity, 1.0f)) * vec4(1.0f, 1.0f, 1.0f, opacity);
    }
}