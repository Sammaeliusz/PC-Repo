extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

const rot_point = Vector3(0,5,0);
const velo = 5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var force_vector = rot_point-position
	apply_central_force(force_vector);
	linear_velocity = Vector3(-force_vector.z, force_vector.y, force_vector.x)
