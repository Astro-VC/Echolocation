extends Node

@export var tree : Node2D
@export var parent : Node2D 

@export_category("Audio")
@export var audio_id : int
@export var volume : float
@export var pitch_rand : Vector2
@export var random_pitch : bool

@export_category("Input")
@export var use_input : bool
@export var input : String

@export_category("Signal")
@export var sig_node : Node
@export var use_signal : bool
@export var sig_name : String = "echo"

var audio : PackedScene

func _ready() -> void:
	audio = Textures.audio
	
	if use_signal == true and sig_node:
		sig_node.get(sig_name).connect(produce_audio.bind())

func _unhandled_input(_event: InputEvent) -> void:
	if use_input == true and Input.is_action_just_pressed(input):
		produce_audio()

func produce_audio(_x : float = 0, _y : float = 0) -> void:
	var temp := audio.instantiate()
	
	temp.global_position = parent.global_position
	temp.find_child("Sound").stream = load(Textures.buffer[audio_id])
	temp.find_child("Sound").volume_db = volume
	if random_pitch:
		temp.find_child("Sound").pitch_scale = randf_range(pitch_rand.x, pitch_rand.y)
	
	tree.get_parent().call_deferred("add_child", temp)
