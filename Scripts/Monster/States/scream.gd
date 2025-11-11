extends State

@export var idle : State
@export var walk : State
@export var chase : State

@export_category("Random State")
@export var change : Vector2i

var hold : int = 0

signal echo

func enter() -> void:
	super()
	hold = 0
	rand_state = randi_range(change.x,change.y)



func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.velocity.y = clampf(parent.velocity.y, 0, max_fall_speed)
	parent.move_and_slide()
	
	if parent.normal_animation.frame == 5 and hold == 0:
		echo.emit()
	
	if parent.normal_animation.is_playing():
		return null
	hold += 1
	if hold == 1:
		parent.normal_animation.play_backwards()
		parent.outline_animation.play_backwards()
		return null
	
	if check_monster_state():
		return chase
	
	if rand_state == change.y:
		return walk
	
	return idle
