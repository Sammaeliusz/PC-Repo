shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
// Zakres slidera
uniform float beta : hint_range(0.0, 0.999) = 0.0; 

void fragment() {
	// Przenosi współrzędne na środek
	vec2 uv = SCREEN_UV - vec2(0.5);
	// Pilnuje zachowania proporcji ekranu
	float aspect = SCREEN_PIXEL_SIZE.y / SCREEN_PIXEL_SIZE.x;
	uv.x *= aspect;
	// Oblicza 'promień' ekranu, czyli odległość od środka ekranu
	float r = length(uv);
	
	// Bardzo ekstremalne wzmocnienie zniekształceń, żeby ładnie obrazować, jak się psuje przestrzeń
	float strength = beta * 15.0; 
	// Ruch do przodu - zasysanie przestrzeni
	if(beta > 0.0){
		float factor = 1.0 + strength * pow(r, 1.5);
		uv = uv / factor;
	}
	// Ruch do tyłu - rozpychanie przestrzenie
	else if(beta < 0.0){
		float b_abs = abs(beta);
		float factor = 1.0 + (b_abs*8.0) *r;
		uv = uv * factor;
	}
	// Przywrócenie proporcji i przesunięcie z powrotem do [0, 1]
	uv.x /= aspect;
	vec2 target_uv = uv + vec2(0.5);
	
	// Zmiany kolorystyczne
	if(target_uv.x >= 0.0 && target_uv.x <= 1.0 && target_uv.y >= 0.0 && target_uv.y <= 1.0){
		vec4 color = texture(SCREEN_TEXTURE, target_uv);
		//Blue shift
		if(beta> 0.0){
			//color.r *= (1.0 - beta * 0.7);
			//color.g += beta * 0.15;
			//color.b += beta * 0.4;
		}
		// Red shift
		else if(beta < 0.0){
			//color.r += abs(beta) * 0.5;
			//color.g *= (1.0 - abs(beta) * 0.3);
			//color.b *= (1.0 - abs(beta) * 0.7);
		}
		COLOR = color;
	}
	// Ciemne tło jak było
	else{
		COLOR = vec4(0.0, 0.0, 0.0, 1.0);
	}
}