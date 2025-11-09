extends Node

@export var parent : Node2D
@export var tree : Node2D

@export_category("Echo")
@export var echo_color_id : int = 0
@export var echo_noise : float
@export var echo_size : Vector2 = Vector2(1,1)
@export var fade_speed : Vector2

@export_category("Area Settings")
@export var detection_area_name : String

@export_category("Input")
@export var use_input : bool
@export var input : String

@export_category("Signal")
@export var sig_node : Node
@export var use_signal : bool

@export_category("Cooldown")
@export var timer : Timer
@export var cooldown : float = 2

var rdy : bool = true

signal echo

func _ready() -> void:
	timer.timeout.connect(update.bind())
	
	if use_signal == true and sig_node:
		sig_node.echo.connect(screech.bind())

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed(input) and use_input == true:
		screech()

func screech(ec_sz : Vector2 = echo_size, nam : String = detection_area_name, clr_id : int = echo_color_id, tmr : float = cooldown) -> void:
	if rdy == false:
		return
	
	echo.emit(fade_speed.x, fade_speed.y)
	Global.echo.emit(fade_speed.x, fade_speed.y)
	
	timer.start(tmr)
	rdy = false
	var temp : Node2D = Textures.echo.instantiate()
	temp.global_position = parent.global_position
	temp.find_child("SetColor").color_id = clr_id
	temp.find_child("on_echo").name = nam
	temp.find_child("Delete").time = fade_speed.x + fade_speed.y
	temp.find_child("Delete").scale_to = ec_sz
	
	Resources.last_sound_pos = temp.global_position
	Resources.sound_volume += echo_noise
	
	tree.get_parent().call_deferred("add_child", temp)

func update() -> void:
	rdy = true
