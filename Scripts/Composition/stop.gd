extends Node

@export var parent : CPUParticles2D


func _ready() -> void:
	parent.restart()
	parent.finished.connect(delete.bind())

func delete()-> void:
	parent.queue_free()
