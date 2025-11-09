extends State

@export var idle : State
@export var jump : State
@export var walk : State
@export var fall : State

@export_category("Echo")
@export var size : Vector2
@export var area_name : String
@export var color_id : int
@export var cooldown : float

@export_category("Timers")
@export var buffer : Timer

signal echo

func enter() -> void:
	super()
	do_particle()
	echo.emit(size, area_name, color_id, cooldown)
	parent.normal_animation.scale = squish_amount
	parent.outline_animation.scale = squish_amount

func process_physics(delta: float) -> State:
	move(delta, move_speed, m_acceleration, m_deceleration, gravity)
	
	if !parent.is_on_floor():
		return fall
	
	if !buffer.is_stopped():
		return jump
	
	if parent.is_on_floor() and Input.is_action_pressed("checkMovement"):
		return walk
	
	if parent.is_on_floor():
		return idle
	
	return null
