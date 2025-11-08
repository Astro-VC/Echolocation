extends State

@export var walk : State
@export var jump : State

func enter() -> void:
	super()



func process_input(event: InputEvent) -> State:
	
	if Input.is_action_just_pressed("checkMovement"):
		return walk
	
	if Input.is_action_just_pressed("up") and parent.is_on_floor():
		return jump
	
	
	return null

func process_physics(delta: float) -> State:
	
	move(delta, move_speed, m_acceleration, m_deceleration, gravity)
	reset_scale(delta, squish_speed)
	parent.velocity.x = lerpf(parent.velocity.x, 0, m_deceleration * delta)
	parent.move_and_slide()
	
	return null
