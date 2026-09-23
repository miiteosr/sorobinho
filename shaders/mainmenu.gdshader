shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
uniform float blur : hint_range(0.0, 5.0) = 5;

void fragment()
{
	vec3 result = textureLod(screen_texture, SCREEN_UV, blur).rgb;
	COLOR.rgb = result;
}