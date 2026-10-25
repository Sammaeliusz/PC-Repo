extends Node
signal tunneled_signal(id: int,value)
# 0 -> Speed change
func _tunel(value, id:int) -> void:
	tunneled_signal.emit(id, value)
