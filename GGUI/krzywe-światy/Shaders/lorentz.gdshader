shader_type spatial;

uniform vec3 velocity = vec3(0.0, 0.0, 0.0);
uniform float speed_of_light_scale = 1.0; // Współczynnik skalujący c na potrzeby symulacji

void vertex() {
    // Obliczamy beta (znormalizowana prędkość)
    float beta_sq = dot(velocity, velocity) / (speed_of_light_scale * speed_of_light_scale);
    
    // Zabezpieczenie przed przekroczeniem prędkości światła (beta < 1.0)
    if (beta_sq > 0.0 && beta_sq < 1.0) {
        float gamma = 1.0 / sqrt(1.0 - beta_sq);
        vec3 v_dir = normalize(velocity);
        
        // Rozkładamy pozycję wierzchołka na składową równoległą i prostopadłą do kierunku ruchu
        float parallel_coord = dot(VERTEX, v_dir);
        vec3 perpendicular_part = VERTEX - parallel_coord * v_dir;
        
        // Zastosowanie skrócenia Lorentza w kierunku ruchu
        // Obiekt kurczy się wzdłuż osi ruchu
        float contracted_parallel = parallel_coord / gamma;
        
        // Składamy z powrotem przekształconą pozycję wierzchołka
        VERTEX = perpendicular_part + contracted_parallel * v_dir;
    }
}

void fragment() {
    // Podstawowy kolor obiektu
    ALBEDO = vec3(0.2, 0.6, 1.0);
}
