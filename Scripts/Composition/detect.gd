extends Node

@export var area : Area2D
@export var collider : Node2D
@export var area_name : String = "on_echo"
@export var coll_nam : String = "Player"

@export_category("Timer")
@export var timer : Timer
@export var time : float
@export var use_timer : bool

var spawned_in : bool = false

signal echo
signal inside

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if spawned_in == false:
		area.area_entered.connect(check.bind())
	
	if collider:
		collider.body_entered.connect(check_collision.bind())

func check(ar : Area2D) -> void:
	if use_timer and !timer.is_stopped():
		return
	
	if ar.name == area_name:
		inside.emit()
		timer.start(time)
func check_collision(bdy : Node) -> void:
	if use_timer and !timer.is_stopped():
		return
	
	if bdy.name != coll_nam:
		print(bdy.name)
		echo.emit()
		if use_timer:
			timer.start(time)
