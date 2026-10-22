extends Node

func _ready() -> void:
	get_window().size_changed.connect(_resize)
	_resize()

func _resize() -> void:
	self.size = get_window().size
