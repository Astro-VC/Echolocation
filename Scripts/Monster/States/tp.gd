extends State

@export var idle : State
@export var walk : State
@export var chase : State

@export_category("Navigation")
@export var nav_agent : NavigationAgent2D

signal echo

func enter() -> void:
	super()
	rand_state = randi_range(0,1)
	parent.global_position = Resources.tp_pos
	echo.emit()


func process_physics(delta: float) -> State:
	mv_monster(delta, nav_agent)
	
	if parent.normal_animation.is_playing():
		return null
	
	if check_player() or Global.noise:
		return chase
	
	return walk
