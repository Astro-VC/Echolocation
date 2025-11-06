extends Node

signal echo

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shift"):
		echo.emit()
