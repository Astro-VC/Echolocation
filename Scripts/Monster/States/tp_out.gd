extends State

@export var tp_in : State
@export var chase : State
@export var walk : State
@export var idle : State

signal echo

func enter() -> void:
	super()
	Resources.can_tp = false
	echo.emit()


func process_physics(delta: float) -> State:
	if parent.normal_animation.is_playing():
		return null
	
	
	return tp_in
