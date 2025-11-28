extends Node

@export var eco : Node
@export var label : Label
@export var timer : Timer
@export var time : float = 0.1
@export var audio : AudioStreamPlayer
@export var audio2 : AudioStreamPlayer

var count : int = 0
var characters : int
var player : bool

signal echo

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	timer.start(time)


func _input(_event: InputEvent) -> void:
	
	if Input.is_action_just_pressed("mouse") and timer.is_stopped():
		
		timer.start(time)
		count += 1
		print(count)
		
		match count:
			1:
				label.visible_ratio = 0
				label.text = "...as the\nsaying goes:"
				echo.emit()
			2:
				label.visible_ratio = 0
				label.text = '"Born With No Wings,\nBorn With No Future."'
				echo.emit()
			3:
				label.visible_ratio = 0
				label.text = "We condemn you\nto the dark."
				echo.emit()
			4:
				label.visible_ratio = 0
				label.text = "'If the depths\ncannot hold me,'"
				echo.emit()
				player = true
			5:
				label.visible_ratio = 0
				label.text = "'once again\ni will rise,'"
				echo.emit()
			6:
				label.visible_ratio = 0
				label.text = "'as the\nsaying goes:'"
				echo.emit()
			7:
				label.visible_ratio = 0
				label.text = '"Silence brings hope\nfor those who wait."'
				echo.emit()
			8:
				get_tree().change_scene_to_file("res://Scenes/Places/main.tscn")






func _process(delta: float) -> void:
	label.visible_ratio += delta
	
	if label.visible_ratio < 1:
		if Engine.get_process_frames() % 10 == 0:
			
			if !player:
				audio.pitch_scale = randf_range(0.6, 0.7)
				audio.play()
				return
			audio2.pitch_scale = randf_range(0.4, 0.5)
			audio2.play()
