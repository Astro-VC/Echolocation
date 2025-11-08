extends State

@export var idle : State
@export var jump : State
@export var fall : State

@export_category("Timers")
@export var coyote : Timer
@export var cyt_time : float

func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("up"):
		return jump
	
	if Input.is_action_just_released("checkMovement"):
		return idle
	
	return null


func process_physics(delta: float) -> State:
	var was_on_floor : bool = parent.is_on_floor()
	move(delta, move_speed, m_acceleration, m_deceleration, gravity)
	reset_scale(delta, squish_speed)
	
	if Engine.get_physics_frames() % 30 == 0:
		do_particle()
		parent.normal_animation.scale = squish_amount
		parent.outline_animation.scale = squish_amount
	
	if parent.velocity.x == 0:
		return idle
	
	if was_on_floor == true and !parent.is_on_floor():
		print("coyote!")
		coyote.start(cyt_time)
	
	if !parent.is_on_floor():
		return fall
	
	return null
