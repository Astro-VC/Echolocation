extends State

@export var walk : State
@export var chase : State
@export var tp_out : State

func enter() -> void:
	super()
	rand_state = randi_range(0,1)
	timer.start(time)

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.velocity.y = clampf(parent.velocity.y, 0, max_fall_speed)
	parent.velocity.x = lerpf(parent.velocity.x, 0, m_deceleration * delta)
	
	if check_monster_state():
		return chase
	
	if !timer.is_stopped():
		return null
	
	match rand_state:
		0:
			return walk
		1:
			return tp_out
	
	return null
