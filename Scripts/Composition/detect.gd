extends Node

@export var area : Area2D
@export var collider : RigidBody2D

@export_category("Player")
@export var detect_player : bool

var spawned_in : bool = false
signal echo
signal inside

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if spawned_in == false:
		area.area_entered.connect(check.bind())
	
	if detect_player:
		area.body_entered.connect(check_player.bind())
	
	if collider:
		collider.body_entered.connect(check_collision.bind())


func check_player(bdy: Node2D) -> void:
	print(bdy)
	if bdy.name == "Player":
		print("Horray")
		Global.chase = true
func check(ar : Area2D) -> void:
	if ar.name == "on_echo":
		inside.emit()
func check_collision(bdy : Node) -> void:
	if bdy.name != "Player":
		echo.emit()
