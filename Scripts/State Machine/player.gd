class_name Human
extends CharacterBody2D

@export var normal_animation : AnimatedSprite2D
@export var outline_animation : AnimatedSprite2D

@export var state_machine : Node


func _ready() -> void:
	state_machine.init(self) 

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
