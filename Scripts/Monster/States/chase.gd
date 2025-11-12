extends State

@export var tp_out : State
@export var walk : State
@export var idle : State
@export var scream : State

@export_category("Navigation")
@export var nav_agent : NavigationAgent2D

@export_category("Random State")
@export var change : Vector2i

var timeout : bool = false

func enter() -> void:
	super()
	
	rand_state = randi_range(change.x,change.y)
	
	if !timer.timeout.is_connected(update.bind()):
		timer.timeout.connect(update.bind())
	timer.start(time)

func process_physics(delta: float) -> State:
	
	if !check_player():
		nav_agent.target_position = Resources.last_sound_pos
	if check_player():
		nav_agent.target_position = Resources.player_pos
	
	mv_monster(delta, nav_agent, scream)
	
	if mv_monster(delta, nav_agent, scream) == scream:
		return scream
	
	if Resources.can_tp == true:
		return tp_out
	
	if timeout == true:
		timeout = false
		Global.chase_player = false
		Global.noise = false
		if rand_state == change.y:
			return walk
		return idle
	
	if !Global.noise and !check_player():
		if rand_state == change.y:
			return walk
		return idle
	
	return null

func update() -> void:
	timeout = true
