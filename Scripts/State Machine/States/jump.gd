extends State

@export var fall : State

func enter() -> void:
	super()
	
	parent.velocity.y = lerp(parent.velocity.y, jump_speed, j_acceleration)

func process_input(event: InputEvent) -> State:
	
	if Input.is_action_just_released("up"):
		parent.velocity.y = 0
		return fall
	
	return null


func process_physics(delta: float) -> State:
	super(delta)
	move(delta, move_speed, m_acceleration, m_deceleration, gravity)
	
	#parent.velocity.y = clamp(parent.velocity.y, jump_speed, max_fall_speed)
	
	if parent.velocity.y > 0 and !parent.is_on_floor():
		return fall
	
	return null
