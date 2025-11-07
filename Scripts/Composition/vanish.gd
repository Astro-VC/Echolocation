extends Node

@export var to_fade : Node2D

@export_category("Signal")
@export var sig_node : Node
@export var use_global_sig : bool = false

var fade_in : Color = Color(1,1,1,1)
var fade_out : Color = Color(1,1,1,0)


func _ready() -> void:
	if use_global_sig == false:
		sig_node.echo.connect(echo.bind())
		return
	Global.echo.connect(echo.bind())

func echo(fadex : float, fadey : float) -> void:
	var tween : Tween = get_parent().create_tween()
	tween.tween_property(to_fade, "modulate", fade_in, fadex)
	tween.tween_property(to_fade, "modulate", fade_out, fadey)
