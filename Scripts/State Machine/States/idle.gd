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
