extends Node

@export var parent : Node2D
@export var tree : Node2D
@export var projectile_id : int 
@export var amount : int

@export_category("Trow")
@export var trow_velocity : Vector2
@export var direction : float
@export var global_dir : bool = false

@export_category("Cooldown")
@export var timer : Timer
@export var cooldown_time : float
@export var use_cooldown : bool

@export_category("Input")
@export var use_input : bool
@export var input : String

@export_category("Signal")
@export var sig_node : Node
@export var use_signal : bool


var scene : PackedScene

func _ready() -> void:
	scene = load(Textures.projectiles[0])
	
	if use_signal == true and sig_node != null:
		sig_node.echo.connect(trow.bind())

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed(input) and use_input == true:
		if check_inventory() and timer.is_stopped():
			remove_value()
			trow()

func trow() -> void:
	global_set()
	var temp : Node2D = scene.instantiate()
	
	temp.global_position = parent.global_position
	temp.find_child("Detect").spawned_in = true
	temp.find_child("Projectile").linear_velocity = Vector2(trow_velocity.x * direction, trow_velocity.y)
	temp.find_child("Delete").del = true
	
	tree.get_parent().add_child(temp)
	Global.projectile_used.emit()
	
	if use_cooldown:
		timer.start(cooldown_time)
	
	pass

func global_set() -> void:
	if global_dir == true:
		if Global.direction == 0:
			Global.direction = -1
		direction = Global.direction

func check_inventory() -> bool:
	if Resources.projectiles[projectile_id] >= amount:
		return true
	return false
func remove_value() -> void:
	Resources.projectiles[projectile_id] -= amount
