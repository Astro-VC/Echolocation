extends Node

#Stores values

var projectiles : PackedInt64Array = [99999999,0]
var life : PackedInt32Array = [3]

## monster, parkour, maze
var seals : Array[bool] = [true,true,true, true]

var last_sound_pos : Vector2
var sound_volume : float = 0

var map_coord : int = 0

var tp_pos : Vector2
var can_tp : bool

var player_pos : Vector2
var neutral_respawn : Vector2

func _physics_process(delta: float) -> void:
	if sound_volume >= 1:
		sound_volume -= delta * 4
		Global.noise_updated.emit()
