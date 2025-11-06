extends Node

@export var timer : Timer
var time : float

func _ready() -> void:
	timer.timeout.connect(delete.bind())
	timer.start(time)

func delete() -> void:
	print("dead")
	get_parent().queue_free()
