extends Node

@export var tree : Node2D
@export var parent : Node2D
@export var sig_node : Node
@export var delete_node : Node
@export var projectile_id : int

@export_category("Collected Sprite")
@export var sprite : Sprite2D
@export var timer : Timer
@export var collected_id : int
@export var duration : float

@export_category("Particle")
@export var particle_id : int

var particle : PackedScene

func _ready() -> void:
	particle = load(Textures.particles[particle_id])
	sig_node.inside.connect(collect.bind())
	timer.timeout.connect(delete_node.delete.bind())

func collect() -> void:
	Resources.projectiles[projectile_id] += 1
	if sprite:
		sprite.texture = load(Textures.collected[collected_id])
	
	var temp := particle.instantiate()
	temp.global_position = parent.global_position
	tree.get_parent().call_deferred("add_child", temp)
	Global.tape_taken.emit()
	
	timer.start(duration)
