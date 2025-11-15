extends Node

@export var use_siganl : bool
@export var sig_node : Node
@export var sig_to_get : String
@export var dmage_sprite : AnimatedSprite2D

@export_category("Timer")
@export var timer : Timer
@export var time : float

var cooldown : bool = true

func _ready() -> void:
	if use_siganl and sig_node != null:
		sig_node.get(sig_to_get).connect(spotted.bind())
	
	if timer:
		timer.timeout.connect(update.bind())
		timer.start(time)


func spotted() -> void:
	
	if cooldown == true:
		return
	
	cooldown = true
	dmage_sprite.show()
	Global.damage.emit()
	Global.camera_shake.emit(3)
	Global.update_color.emit(Textures.colors[5])
	Global.chase_player = true
	Resources.life[0] -= 1
	Engine.time_scale = 0.3
	await get_tree().create_timer(0.3).timeout
	Engine.time_scale = 1
	dmage_sprite.hide()
	timer.start(time)
func update() -> void:
	cooldown = false
