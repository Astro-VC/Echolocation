extends Node

@export var parent : Node2D
@export var echo_size : Vector2 = Vector2(1,1)
@export var fade_speed : Vector2

signal echo

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shift"):
		echo.emit(fade_speed.x, fade_speed.y)
		Global.echo.emit(fade_speed.x, fade_speed.y)
		screech()

func screech() -> void:
	var temp : Node2D = Textures.echo.instantiate()
	temp.global_position = parent.global_position
	temp.find_child("Delete").time = fade_speed.x + fade_speed.y
	temp.find_child("Delete").scale_to = echo_size
	get_parent().add_child(temp)
