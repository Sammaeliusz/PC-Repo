shader_type spatial;
// Podstawowy kod generujący teksturę szachownicy
// Czemu w jednym egytorze jest kilka języków programowania?!?!?!
uniform vec3 color1 : source_color = vec3(1.0, 0.0, 0.0);
uniform vec3 color2 : source_color = vec3(0.8, 0.8, 0.8);
uniform float scale : hint_range(1.0, 150.0) = 70.0;

void fragment(){
	vec2 c = floor(UV * scale);
	float pattern = mod(c.x + c.y, 2.0);
	ALBEDO = mix(color1, color2, pattern);
}