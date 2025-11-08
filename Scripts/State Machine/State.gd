class_name State
extends Node

@export var animation_name: String

@export_category("Movement")
@export var move_speed: float = 100
@export var m_acceleration : float = 10
@export var m_deceleration : float = 8

@export_category("Jump")
@export var jump_speed : float = 150
@export var j_acceleration : float = 10
@export var j_deceleration : float = 8

@export_category("Gravity")
@export var gravity : float = 980
@export var max_fall_speed : float = 120


@export_category("Squish")
@export var squish_speed : float = 6
@export var squish_amount : Vector2 = Vector2(1,1)

## Hold a reference to the parent so that it can be controlled by the state
var parent : CharacterBody2D

func enter() -> void:
	parent.normal_animation.play(animation_name)
	parent.outline_animation.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

func reset_scale(delta : float, sqsh_speed : int) -> void:
	parent.normal_animation.scale = lerp(parent.normal_animation.scale, Vector2(1, 1), delta * sqsh_speed)
	parent.outline_animation.scale = lerp(parent.outline_animation.scale, Vector2(1, 1), delta * sqsh_speed)


func flip(dir : float) -> void:
	parent.normal_animation.flip_h = dir < 0
	parent.outline_animation.flip_h = dir < 0

func move(delta : float, spd : float, acc : float, deac : float, grav : float, min : float = 0) -> void:
	parent.velocity.y += grav * delta
	parent.velocity.y = clampf(parent.velocity.y, min, max_fall_speed)
	
	var dir : float = Input.get_axis("left","right")
	if dir:
		Global.direction = dir * -1
		parent.velocity.x = lerpf(parent.velocity.x, (spd * dir), acc * delta)
		flip(dir)
	
	if dir == 0 and Input.is_action_pressed("checkMovement"):
		parent.velocity.x = lerpf(parent.velocity.x, (spd * Global.direction), acc * delta)
		flip(Global.direction)
	
	if dir == 0 and !Input.is_action_pressed("checkMovement"):
		parent.velocity.x = lerpf(parent.velocity.x, 0, deac * delta)
	
	parent.move_and_slide()

func squish(delta : float, sqsh_speed : float = squish_speed) -> void:
	parent.normal_animation.scale = lerp(parent.normal_animation.scale, squish_amount, delta * sqsh_speed)
	parent.outline_animation.scale = lerp(parent.outline_animation.scale, squish_amount, delta * sqsh_speed)
