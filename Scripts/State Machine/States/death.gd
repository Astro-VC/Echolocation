extends State

@export var fall : State


var count : float = 0
signal echo

func enter() -> void:
	super()
	do_particle()
	
	count = 0
	parent.global_position = Resources.neutral_respawn


func process_physics(delta: float) -> State:
	if count != time:
		count += delta
		return null
	
	echo.emit()
	do_particle()
	return fall
