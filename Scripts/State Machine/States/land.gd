extends State

@export var idle : State
@export var jump : State
@export var walk : State

@export_category("Timers")
@export var buffer : Timer


func enter() -> void:
	super()
	parent.normal_animation.scale = squish_amount
	parent.outline_animation.scale = squish_amount

func process_physics(delta: float) -> State:
	move(delta, move_speed, m_acceleration, m_deceleration, gravity)
	
	if !buffer.is_stopped():
		return jump
	
	if parent.is_on_floor() and Input.is_action_pressed("checkMovement"):
		return walk
	
	if parent.is_on_floor():
		return idle
	
	return null
