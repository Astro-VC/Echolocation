extends Node

@export var wave1 : PointLight2D
@export var wave2 : PointLight2D

var color_id : int = 0

func _ready() -> void:
	col(Textures.colors[color_id])
	Global.update_color.connect(col.bind())

func col(co : Color) -> void:
	wave1.color = co
	wave2.color = co
