extends RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

const ang_speed : int = 2
const lin_speed : int = 10
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var velocity = Input.get_vector( "move_right", "move_left", "move_backward", "move_forward")
	angular_velocity = Vector3(0,ang_speed*velocity.x,0)
	linear_velocity = Vector3(velocity.y*lin_speed*-cos(rotation.y), linear_velocity.y,velocity.y*lin_speed*sin(rotation.y))
	pass
