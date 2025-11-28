extends Node

@export var textur : NinePatchRect
@export var button : TextureButton
@export var label : Label
@export var parent : Node
@export var second : Node

@export_category("Values")
@export var add_scale : Vector2
@export var duration : float = 0.5
@export var awa : bool

@export_category("Scene")
@export var scene_to_go : String

@export var quit : bool = false

var cycle : bool = true
var original_scale : Vector2
var tween : Tween

func _ready() -> void:
	if parent:
		parent.quit = quit
	original_scale = button.scale
	
	if !awa:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
	button.mouse_entered.connect(change_texture.bind())
	button.mouse_exited.connect(change_texture.bind())
	button.pressed.connect(change_scene.bind())

func change_scene() -> void:
	if awa == true:
		if button.modulate.a <= 0.3:
			return
	
	if second:
		second.get_parent().get_tree().paused = false
	
	if quit:
		get_tree().quit()
		return
	
	if scene_to_go:
		Resources.deaths = 0
		print(scene_to_go)
		get_tree().change_scene_to_file(scene_to_go)


func change_texture() -> void:
	tween = get_parent().create_tween()
	if cycle:
		cycle = false
		tween.tween_property(button, "scale", add_scale, duration)
		label.modulate = Color("171717")
		textur.texture = load("res://Sprites/Tiles/HoverUiBack.png")
		return
	cycle = true
	tween.tween_property(button, "scale", original_scale, duration)
	label.modulate = Color("ffffff")
	textur.texture = load("res://Sprites/Tiles/MapUITiles.png")
