extends State

@export var walk : State
@export var jump : State

func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	
	if Input.is_action_just_pressed("checkMovement"):
		return walk
	
	if Input.is_action_just_pressed("up"):
		return jump
	
	
	return null

func process_physics(delta: float) -> State:
	
	parent.velocity = lerp(parent.velocity, Vector2.ZERO, m_deceleration * delta)
	parent.move_and_slide()
	return null
