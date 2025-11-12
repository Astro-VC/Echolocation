extends Node


@export var node_to_force : State
@export var state_machine : Node

@export_category("Signal")
@export var sig_node : Node
@export var sig_name : String = "inside"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sig_node.get(sig_name).connect(force.bind())


func force() -> void:
	if Global.chase_player == false:
		state_machine.current_state = node_to_force
		state_machine.change_state(node_to_force)
