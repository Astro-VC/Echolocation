extends Node

@export var camera : Camera2D

@export var distance : Vector2 = Vector2(0.1, 0.1)
@export var time : float = 3
@export var shaake : bool

@export_category("Neighbours")
@export var player : Node2D

@export_category("Screech zoom")
@export var zoom_amount : Vector2
@export var duration : float

var shake : float = 0
var rng := RandomNumberGenerator.new()

func _ready() -> void:
	Global.camera_shake.connect(update.bind())
	Global.zoom.connect(zoom.bind())
	await get_tree().create_timer(0.1).timeout
	player.visi.screen_exited.connect(change_cam.bind())

func _process(delta: float) -> void:
	if shake > 0 and shaake:
		camera_shake(shake, time, delta)
	


func camera_shake(force : float, time : float, delta : float) -> void:
	shake = lerpf(force, 0, time * delta)
	camera.offset = Vector2(rng.randf_range(-force, force), rng.randf_range(-force, force))
func update(force : float) -> void:
	shake = force
func change_cam() -> void:
	
	Resources.neutral_respawn = player.player.global_position + Vector2(0,-2)
	
	if player.player.global_position.y > 170 and player.player.global_position.y < 190:
		camera.global_position.y = 360
		Resources.map_coord += 4
		return
	if player.player.global_position.y < 170 and player.player.global_position.y > 160:
		Resources.map_coord -= 4
		camera.global_position.y = 0
		return
	
	
	if player.player.velocity.x > 0:
		camera.global_position.x += 640
		Resources.map_coord += 1
		return
	else:
		camera.global_position.x -= 640
		Resources.map_coord -= 1
		return
func zoom() -> void:
	var tween : Tween = get_tree().create_tween()
	
	tween.tween_property(camera, "zoom", zoom_amount, duration).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(camera, "zoom", Vector2(1,1), 0.5).set_trans(Tween.TRANS_CUBIC)
