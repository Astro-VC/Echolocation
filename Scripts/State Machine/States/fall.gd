extends State

@export var jump : State
@export var land : State

@export_category("Timers")
@export var coyote : Timer
@export var buffer : Timer
@export var bfr_time : float

func enter() -> void:
	super()



func process_input(event: InputEvent) -> State:
	
	if Input.is_action_just_pressed("up") and !coyote.is_stopped():
		buffer.start(bfr_time)
		return jump
	elif Input.is_action_just_pressed("up"):
		buffer.start(bfr_time)
	
	return null


func process_physics(delta: float) -> State:
	squish(delta)
	move(delta, move_speed, m_acceleration, m_deceleration, gravity)
	reset_scale(delta, squish_speed)
	
	if parent.is_on_floor():
		return land
	
	return null
