extends Node

@export var label : Label

@export_category("Text")
@export var string : String = ""
@export var data_to_show : String
@export var data_id : int
@export var is_array : bool
@export var use_data : bool

@export_category("Signal")
@export var sig_node : Node
@export var global_sig : String
@export var use_signal : bool
@export var global_signal : bool

@export_category("Input")
@export var input : String
@export var use_input : bool

func _ready() -> void:
	if use_signal and sig_node != null:
		sig_node.echo.connect(update_text.bind())
	
	if global_signal and global_sig != null:
		Global.get(global_sig).connect(update_text.bind())
	
	update_text()

func _unhandled_input(_event: InputEvent) -> void:
	if use_input == true and Input.is_action_just_pressed(input) :
		update_text()

func get_data() -> String:
	if use_data:
		
		if is_array:
			var temp : Array = Resources.get(data_to_show)
			return str(temp[data_id])
		var temp : int = int(Resources.get(data_to_show))
		return str(temp)
		
	return ""
func update_text() -> void:
	label.text = string + get_data()
