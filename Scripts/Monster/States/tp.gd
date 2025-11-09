extends State

@export var idle : State
@export var walk : State
@export var chase : State

func enter() -> void:
	super()
	rand_state = randi_range(0,1)


func process_physics(delta: float) -> State:
	
	if parent.normal_animation.is_playing():
		return null
	
	if check_monster_state():
		return chase
	
	match rand_state:
		0:
			return walk
		1:
			return idle
	
	
	return null
