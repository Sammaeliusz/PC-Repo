extends RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

const ang_speed : int = 2
const lin_speed : int = 10
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _unhandled_input(event)->void:
	if event is InputEventKey:
		if event.pressed:
			print(rotation)
			if event.keycode == KEY_RIGHT:
				angular_velocity = Vector3(0,-1*ang_speed,0)
			elif(event.keycode == KEY_LEFT):
				angular_velocity = Vector3(0,ang_speed,0)
			elif(event.keycode == KEY_UP):
				linear_velocity = Vector3(lin_speed*-cos(rotation.y), 0,lin_speed*sin(rotation.y))
			elif(event.keycode == KEY_DOWN):
				linear_velocity = Vector3(lin_speed*cos(rotation.y), 0,lin_speed*-sin(rotation.y))
		else:
			angular_velocity = Vector3(0,0,0)
