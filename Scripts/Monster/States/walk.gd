extends State

@export var tp_out : State
@export var idle : State
@export var scream : State
@export var chase : State

@export_category("Random State")
@export var change : Vector2i

var dir : int

func enter() -> void:
	super()
	
	rand_state = randi_range(change.x,change.y)
	if rand_state > 0:
		dir = 1
	else:
		dir = -1
	
	timer.start(time)

func process_physics(delta: float) -> State:
	
	walk_monster(delta, dir)
	
	if (Global.noise and Resources.sound_volume >= 3) or check_player():
		return chase
	
	if !timer.is_stopped():
		return null
	
	if rand_state == change.y:
		return idle
	
	rand_state = randi_range(change.x,change.y)
	timer.start(time)
	return null
