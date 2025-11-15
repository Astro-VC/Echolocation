extends Node

@export var area : Area2D
@export var collider : Node2D
@export var area_name : String = "on_echo"
@export var coll_nam : String = "Player"

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
	if ar.name == area_name:
		inside.emit()
func check_collision(bdy : Node) -> void:
	if bdy.name != coll_nam:
		echo.emit()
