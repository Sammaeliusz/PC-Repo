extends Node3D

# Includy do wszystkich 'plików' w drzewku Node3D

@onready var camera: Camera3D = $Camera3D
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var slider: HSlider = $CanvasLayer/VBoxContainer/HSlider
@onready var label: Label = $CanvasLayer/VBoxContainer/Label

var shader_material: ShaderMaterial
var auto_move: bool = false

func _ready() -> void:
	
	shader_material = color_rect.material as ShaderMaterial
	# Odbieranie wartości "procent prędkości światła" od slidera
	slider.value_changed.connect(_speed_change)
	_speed_change(slider.value)
	
func _speed_change(value: float) -> void:
	if shader_material:
		shader_material.set_shader_parameter("beta", value)
	
	#Przydatny label, żeby widzieć prędkość i przód/tył
	if value >= 0:
		label.text = "Prędkość (przód): %.3f c" % value
	else:
		label.text = "Prędkość (tył): %.3f c" % value
		
func _process(delta: float) -> void:
	
	# Obsługa poruszania sie do przodu i tyłu WASD (tylko W i S)
	var move_dir = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		move_dir -= camera.global_transform.basis.z
	if Input.is_action_pressed("ui_down"):
		move_dir += camera.global_transform.basis.z
		
	if move_dir != Vector3.ZERO:
		camera.global_position += move_dir.normalized() * delta * 5.0
		
	# Obsługa obracania 'głowy' trzymając prawy przycisk myszki
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		var mouse_delta = Input.get_last_mouse_velocity() * delta * 0.001
		camera.rotate_y(-mouse_delta.x)
		camera.rotate_object_local(Vector3.RIGHT, -mouse_delta.y)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
