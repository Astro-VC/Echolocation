class_name State
extends Node

@export var animation_name: String

@export_category("Movement")
@export var move_speed: float = 100
@export var m_acceleration : float = 10
@export var m_deceleration : float = 8

@export_category("Jump / Tp")
@export var jump_speed : float = 150
@export var j_acceleration : float = 10
@export var j_deceleration : float = 8

@export_category("Gravity")
@export var gravity : float = 980
@export var max_fall_speed : float = 120

@export_category("Squish")
@export var squish_speed : float = 6
@export var squish_amount : Vector2 = Vector2(1,1)

@export_category("Particle")
@export var tree : Node2D
@export var particle_ID : int

@export_category("Timer")
@export var timer : Timer
@export var time : float

## Hold a reference to the parent so that it can be controlled by the state
var parent : CharacterBody2D
var particle : PackedScene
var rand_state : int

func enter() -> void:
	
	parent.normal_animation.play(animation_name)
	parent.outline_animation.play(animation_name)
	if parent.white_animation:
		parent.white_animation.play(animation_name)
	
	if parent.color_animation:
		parent.color_animation.play(animation_name)

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
	
	if parent.white_animation:
		parent.white_animation.scale = lerp(parent.white_animation.scale, Vector2(1, 1), delta * sqsh_speed)
	
	if parent.color_animation:
		parent.color_animation.scale = lerp(parent.color_animation.scale, Vector2(1, 1), delta * sqsh_speed)


func flip(dir : float) -> void:
	parent.normal_animation.flip_h = dir < 0
	parent.outline_animation.flip_h = dir < 0
	
	if parent.white_animation:
		parent.white_animation.flip_h = dir < 0
	
	if parent.color_animation:
		parent.color_animation.flip_h = dir < 0

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
	
	Resources.player_pos = parent.global_position
	parent.move_and_slide()
func mv_monster(delta : float, nav : NavigationAgent2D, stt : State = null) -> State:
	parent.velocity.y += gravity * delta
	parent.velocity.y = clampf(parent.velocity.y, 0, max_fall_speed)
	
	if !nav.is_target_reached():
		var direction : Vector2 = parent.to_local(nav.get_next_path_position()).normalized()
		var di : Vector2 = nav.get_next_path_position()
		
		
		if check_range(di):
			var temp : PackedVector2Array = nav.get_current_navigation_path()
			var tmp : int = temp.size()
			
			Resources.tp_pos = temp[tmp - 3]
			Resources.can_tp = true
		
		parent.velocity.x = lerpf(parent.velocity.x, (move_speed * direction.x), m_acceleration * delta)
		flip(parent.velocity.x)
	else:
		Global.noise = false
		return stt
	
	parent.move_and_slide()
	return null
func walk_monster(delta : float, dir : int) -> void:
	parent.velocity.y += gravity * delta
	parent.velocity.y = clampf(parent.velocity.y, 0, max_fall_speed)
	parent.velocity.x = lerpf(parent.velocity.x, (move_speed * dir), m_acceleration * delta)
	flip(dir)
	
	parent.move_and_slide()

func squish(delta : float, sqsh_speed : float = squish_speed) -> void:
	parent.normal_animation.scale = lerp(parent.normal_animation.scale, squish_amount, delta * sqsh_speed)
	parent.outline_animation.scale = lerp(parent.outline_animation.scale, squish_amount, delta * sqsh_speed)
	
	if parent.white_animation:
		parent.white_animation.scale = lerp(parent.white_animation.scale, squish_amount, delta * sqsh_speed)
	
	if parent.color_animation:
		parent.color_animation.scale = lerp(parent.color_animation.scale, squish_amount, delta * sqsh_speed)

func do_particle(p : int = particle_ID) -> void:
	particle = load(Textures.particles[p])
	var temp := particle.instantiate()
	temp.global_position = Vector2(parent.global_position.x, parent.global_position.y + 12)
	tree.get_parent().call_deferred("add_child", temp)

func check_player() -> bool:
	if Global.chase_player:
		return true
	return false
func check_range(dir : Vector2) -> bool:
	if dir.y < parent.global_position.y - 16:
		return true
	return false
func check_noise(sound_limit : int, stt : State) -> State:
	
	if Resources.sound_volume >= sound_limit:
		return stt
	
	return null
