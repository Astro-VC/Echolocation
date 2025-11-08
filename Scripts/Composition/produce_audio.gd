extends Node

@export var tree : Node2D
@export var parent : Node2D 

@export_category("Audio")
@export var audio_id : int

@export_category("Input")
@export var use_input : bool
@export var input : String

@export_category("Signal")
@export var sig_node : Node
@export var use_signal : bool

var audio : PackedScene

func _ready() -> void:
	audio = Textures.audio
	
	if use_signal == true and sig_node:
		sig_node.echo.connect(produce_audio.bind())

func _unhandled_input(_event: InputEvent) -> void:
	if use_input == true and Input.is_action_just_pressed(input):
		produce_audio()

func produce_audio() -> void:
	var temp := audio.instantiate()
	
	temp.global_position = parent.global_position
	temp.find_child("Sound").stream = load(Textures.buffer[audio_id])
	
	tree.get_parent().call_deferred("add_child", temp)
