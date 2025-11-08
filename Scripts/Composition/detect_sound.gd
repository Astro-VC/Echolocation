extends Node

@export var area : Area2D

signal echo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.area_entered.connect(check.bind())

func check(ar : Area2D) -> void:
	if ar.name == "on_echo":
		echo.emit()
