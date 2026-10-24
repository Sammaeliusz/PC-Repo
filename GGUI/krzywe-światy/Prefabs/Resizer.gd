extends Node3D

# Called when the node enters the scene tree for the first time.
var B_scale : float
var B_height: int
func _ready() -> void:
	B_scale = get_meta("Scale")
	B_height = get_meta("Height")
	scale = Vector3(B_scale, B_scale*B_height, B_scale)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
