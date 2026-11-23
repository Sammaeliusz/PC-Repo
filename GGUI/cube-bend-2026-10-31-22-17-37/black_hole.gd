extends Node3D


# Called when the node enters the scene tree for the first time.
const  G = 132712440211;
const c = 300000;
var Mass = 1.0;
func _ready() -> void:
	var radius = Mass*2*G/(c*c)
	scale = Vector3(radius, radius, radius);
	print(radius);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
