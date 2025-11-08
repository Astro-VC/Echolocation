extends State

@export var idle : State
@export var jump : State
@export var walk : State

@export_category("Timers")
@export var buffer : Timer

var count : float = 0

func enter() -> void:
	count = 0
	super()

func process_physics(delta: float) -> State:
	squish(delta)
	move(delta, move_speed, m_acceleration, m_deceleration, gravity)
	
	if !buffer.is_stopped():
		return jump
	
	if !count > 0.1:
		count += delta
		return null
	
	if parent.is_on_floor():
		return idle
	
	if parent.is_on_floor():
		return walk
	
	return null
