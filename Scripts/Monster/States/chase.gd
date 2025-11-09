extends State

@export var tp_out : State
@export var walk : State
@export var idle : State

@export_category("Navigation")
@export var nav_agent : NavigationAgent2D

func enter() -> void:
	super()
	nav_agent.target_position = Resources.last_sound_pos

func process_physics(delta: float) -> State:
	mv_monster(delta, nav_agent)
	
	return null
