extends Node

#Control Stuff

signal echo
signal projectile_used
signal noise_updated
signal damage
signal camera_shake
signal update_color
signal zoom
signal tape_taken

signal clear

var noise : bool = false

var direction : float

##Monster info
var chase_player : bool = false

var c : bool = true
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("f") and c:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		c = false
		return
	
	if Input.is_action_just_pressed("f") and !c:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		c = true
		return
