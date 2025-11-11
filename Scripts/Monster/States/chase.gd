extends State

@export var tp_out : State
@export var walk : State
@export var idle : State

@export_category("Navigation")
@export var nav_agent : NavigationAgent2D

func enter() -> void:
	super()
	nav_agent.target_position = Resources.last_sound_pos
	Global.chase = true

func process_physics(delta: float) -> State:
	nav_agent.target_position = Resources.last_sound_pos
	mv_monster(delta, nav_agent)
	
	if Resources.can_tp == true:
		return tp_out
	
	return null
