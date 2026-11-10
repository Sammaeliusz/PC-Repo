extends Node3D

var gamma : float = 1.0
var time_countdown : float = 1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_countdown -= delta*gamma
	if(time_countdown<0):
		time_countdown = 1
		$Wskazowka.rotate_z(-0.1)
	pass

func _time_dilatation(beta:float) -> void:
	gamma = 1/sqrt(1-beta*beta)
