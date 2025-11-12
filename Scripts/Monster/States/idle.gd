extends State

@export var walk : State
@export var chase : State
@export var scream : State

@export_category("Random State")
@export var change : Vector2i

func enter() -> void:
	super()
	
	rand_state = randi_range(change.x,change.y)
	print(rand_state)
	timer.start(time)

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.velocity.y = clampf(parent.velocity.y, 0, max_fall_speed)
	parent.velocity.x = lerpf(parent.velocity.x, 0, m_deceleration * delta)
	parent.move_and_slide()
	
	
	if (Global.noise and Resources.sound_volume >= 3) or check_player():
		return chase
	
	if !timer.is_stopped():
		return null
	
	if rand_state == change.y:
		return scream
	
	return walk
