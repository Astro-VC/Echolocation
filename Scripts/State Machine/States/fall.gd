extends State

@export var idle : State
@export var walk : State

func enter() -> void:
	super()


func process_physics(delta: float) -> State:
	move(delta, move_speed, m_acceleration, m_deceleration, gravity)
	
	if parent.is_on_floor() and parent.velocity.x == 0:
		return idle
	
	if parent.is_on_floor() and parent.velocity.x != 0:
		return walk
	
	return null
