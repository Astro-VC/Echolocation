extends Node

@export var to_fade : Node2D
@export var fade_speed : Vector2

@export_category("Signal")
@export var sig_node : Node

var fade_in : Color = Color(1,1,1,1)
var fade_out : Color = Color(1,1,1,0)


func _ready() -> void:
	sig_node.echo.connect(echo.bind())

func echo() -> void:
	var tween : Tween = get_parent().create_tween()
	var temp : Node2D = Textures.echo.instantiate()
	
	temp.global_position = to_fade.global_position
	temp.find_child("Delete").time = fade_speed.x + fade_speed.y
	get_parent().add_child(temp)
	
	tween.tween_property(to_fade, "modulate", fade_in, fade_speed.x)
	tween.tween_property(to_fade, "modulate", fade_out, fade_speed.y)
	
	
