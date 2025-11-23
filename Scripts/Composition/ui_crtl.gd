extends Control

@export var inpt : String = "m"

var b : bool = true

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed(inpt) and b:
		show()
		b = false
		return
	
	if Input.is_action_just_pressed(inpt) and !b:
		hide()
		b = true
