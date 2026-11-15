extends Node3D

# Includy do wszystkich 'plików' w drzewku Node3D

@onready var camera: Camera3D = $Camera3D
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var slider: HSlider = $CanvasLayer/VBoxContainer/HSlider
@onready var label: Label = $CanvasLayer/VBoxContainer/Label
@onready var light: OmniLight3D = $OmniLight3D
@onready var SL_toggle: CheckButton = $CanvasLayer/VBoxContainer/SL_Toggle
var shader_material: ShaderMaterial
var auto_move: bool = false
@onready var start_hue : float = light.light_color.h
@onready var start_energy : float = light.light_energy
func _ready() -> void:
	shader_material = color_rect.material as ShaderMaterial
	# Odbieranie wartości "procent prędkości światła" od slidera
	slider.value_changed.connect(_speed_change)
	SL_toggle.toggled.connect(_speed_change)
	_speed_change(slider.value)
	
func _speed_change(value: float) -> void:
	if shader_material:
		shader_material.set_shader_parameter("beta", value)
	if(! SL_toggle.button_pressed):
		shader_material.set_shader_parameter("beta", 0)
	
	#Przydatny label, żeby widzieć prędkość i przód/tył
	if value > 0:
		label.text = "Prędkość (przód): %.3f c" % value
	elif value < 0:
		label.text = "Prędkość (tył): %.3f c" % value
		
func _process(delta: float) -> void:
	var camera_dir = -camera.global_transform.basis.z
	var to_light = light.global_position - camera.global_position
	if to_light.length() > 0:
		to_light = to_light/to_light.length()
	var cos_theta = -to_light.dot(camera_dir)
	var l_color : Color = light.light_color
	l_color.h = clampf(start_hue*(1-slider.value*cos_theta),0.0, 1.0)
	light.light_color = l_color
	var intensity_multiplier = 1.0 + (slider.value * 4.0 * max(0.0, cos_theta))
	light.light_energy = start_energy * intensity_multiplier
	
	# Obsługa poruszania sie do przodu i tyłu 
	var move_dir = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		move_dir -= camera.global_transform.basis.z
	if Input.is_action_pressed("ui_down"):
		move_dir += camera.global_transform.basis.z
		
	if move_dir != Vector3.ZERO:
		camera.global_position += move_dir.normalized() * delta * 5.0
		
	var rotation_speed = 2.0 # Prędkość obrotu "głowy"
	#Obroty głową(roll)
	if Input.is_action_pressed("ui_left"):
		camera.rotate_y(rotation_speed * delta)
	if Input.is_action_pressed("ui_right"):
		camera.rotate_y(-rotation_speed * delta)
	#(YAW)
	if Input.is_action_pressed("Yaw-"):
		camera.rotate_x(-rotation_speed * delta)
	if Input.is_action_pressed("Yaw+"):
		camera.rotate_x(rotation_speed * delta)
	
	## Obsługa obracania 'głowy' trzymając prawy przycisk myszki
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		var mouse_delta = Input.get_last_mouse_velocity() * delta * 0.001
		camera.rotate_y(-mouse_delta.x)
		camera.rotate_object_local(Vector3.RIGHT, -mouse_delta.y)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
