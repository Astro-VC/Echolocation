extends State

@export var idle : State
@export var jump : State

func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("up"):
		return jump
	
	return null


func process_physics(delta: float) -> State:
	move(delta, move_speed, m_acceleration, m_deceleration, gravity)
	
	if parent.velocity.x == 0:
		return idle
	
	return null
