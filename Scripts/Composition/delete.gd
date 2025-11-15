extends Node

@export var timer : Timer
@export var wave : Light2D

var original_scale : Vector2
var scale_to : Vector2

var time : float

func _ready() -> void:
	if timer:
		timer.timeout.connect(delete.bind())
	
		original_scale = wave.scale
	
	if wave:
		move_wave()
		timer.start(time)

func _physics_process(delta: float) -> void:
	if wave != null:
		wave.scale += (scale_to / 12) * delta

func move_wave() -> void:
	var tween : Tween = get_parent().create_tween()
	
	tween.tween_property(wave, "scale", scale_to, 0.1).set_trans(Tween.TRANS_EXPO)

func delete() -> void:
	get_parent().queue_free()
