extends Node

@export var use_siganl : bool
@export var sig_node : Node
@export var sig_to_get : String

func _ready() -> void:
	if use_siganl and sig_node != null:
		sig_node.get(sig_to_get).connect(spotted.bind())


func spotted() -> void:
	Global.chase_player = true
