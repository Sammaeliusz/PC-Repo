extends OmniLight3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _change_energy(id:int, value: float)->void:
	if id==0:
		self.light_energy = value*16;
