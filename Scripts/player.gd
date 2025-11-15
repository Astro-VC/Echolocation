extends Node2D

var player : CharacterBody2D
var visi : VisibleOnScreenNotifier2D

func _ready() -> void:
	player = get_child(0)
	visi = get_child(0).find_child("visi")
