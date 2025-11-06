extends Node

@export var follow : bool = false
@export var obj_to_move : Node2D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouse and follow:
		obj_to_move.global_position = obj_to_move.get_global_mouse_position()
