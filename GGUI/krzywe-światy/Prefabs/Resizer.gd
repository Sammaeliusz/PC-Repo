extends Node3D

# Called when the node enters the scene tree for the first time.
var B_scale : float
var B_height: int
var B_color: Color
func _ready() -> void:
	get_parent_node_3d().get_child(0).connect("tunneled_signal", _distort_speed)
	
	B_scale = get_meta("Scale")
	B_height = get_meta("Height")
	B_color = get_meta("Color")
	
	
	scale = Vector3(B_scale, B_scale*B_height, B_scale)
	print(B_color)
	var U_material : StandardMaterial3D = preload("res://Prefabs/Building/Base_Building_Material.tres").duplicate(true)
	U_material.albedo_color = B_color
	get_child(0).set_surface_override_material(0,U_material)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _distort_speed(id: int, value: float) -> void:
	if id == 0:
		scale = Vector3(B_scale, B_scale * B_height * sqrt(1 - value*value), B_scale)
		print(scale)
func _process(_delta: float) -> void:
	pass
