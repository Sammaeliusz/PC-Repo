extends MeshInstance3D

@export var current_velocity: Vector3 = Vector3(0.0, 0.0, 0.0)

func _process(delta):
	# Przykładowa zmiana prędkości w czasie (np. przyspieszanie w osi X)
	current_velocity.x = sin(delta * 0.001) * 0.95 # beta max 0.95 c
	
	# Przekazanie wektora prędkości do shadera materiału
	var material = get_surface_override_material(0) as ShaderMaterial
	if material:
		material.set_shader_parameter("velocity", current_velocity)
