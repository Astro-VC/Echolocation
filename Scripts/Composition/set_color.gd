extends Node

@export var wave1 : PointLight2D
@export var wave2 : PointLight2D

var color_id : int = 0

func _ready() -> void:
	wave1.color = Textures.colors[color_id]
	wave2.color = Textures.colors[color_id]
