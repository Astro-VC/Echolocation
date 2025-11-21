extends Node

@export var music : AudioStreamPlayer2D
@export var parent : Node2D
@export var seal_id : int
@export var music_id : int

@export_category("Area")
@export var area_to_use : Area2D
@export var area_to_check : String

@export_category("Screech")
@export var every_n_frames : int = 20

signal inside
signal echo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	seal_id = parent.seal_id
	music_id = parent.music_id
	music.stream = load(Textures.musics[music_id])
	music.play()
	area_to_use.area_entered.connect(break_seal.bind())

func _physics_process(delta: float) -> void:
	if Engine.get_physics_frames() % every_n_frames == 0:
		echo.emit()

func break_seal(area : Node2D) -> void:
	if area.name == area_to_check:
		Resources.seals[seal_id] = false
		inside.emit()
