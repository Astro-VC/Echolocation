extends Node

#Stores scenes and textures

var echo : PackedScene = load("res://Scenes/Other/echo.tscn")
var audio : PackedScene = load("res://Scenes/Other/sound.tscn")

var buffer : PackedStringArray = [
"res://Audio/Final sfx/Landing Stone (mp3cut.net).mp3", 
"res://Audio/Final sfx/Rocks steps.mp3", 
"res://Audio/Final sfx/Rock throw.mp3", 
"res://Audio/Final sfx/sonar enemy.mp3",
"res://Audio/Transition_2.wav", 
"res://Audio/Final sfx/Enemy teleport 1.mp3", 
"res://Audio/Final sfx/sonar player.mp3",
"res://Audio/Final sfx/Bells.mp3",
"res://Audio/Final sfx/Collect.mp3",
"res://Audio/Final sfx/Rock land.mp3",
"res://Audio/Final sfx/Collect.mp3"
]

var musics : PackedStringArray = [
	"res://Audio/Musics/Title_Theme.mp3", 
	"res://Audio/Musics/Theme_1.mp3", 
	"res://Audio/Musics/Theme_2.mp3", 
	"res://Audio/Musics/Puzzle_Zone_Theme.mp3", 
	"res://Audio/Musics/Jumping_Zone_Theme.mp3", 
	"res://Audio/Musics/Monster_Zone_Theme.mp3",
	"res://Audio/Musics/Chase_Theme.mp3"
	]

var projectiles : PackedStringArray = ["res://Scenes/Objects/rock.tscn"]
var particles : PackedStringArray = [
 "res://Scenes/Particle/breack_particle.tscn",
 "res://Scenes/Particle/common_particle.tscn",
 "res://Scenes/Particle/land_particle.tscn",
 "res://Scenes/Particle/scream_particle.tscn"
]

var colors : PackedColorArray = [
	Color("dedbf9"), 
	Color("c5edea"), 
	Color("f0faf9"), 
	Color("f0f3c2"), 
	Color("ffc2c4"), 
	Color("ff7569"), 
	Color("bca59a"), 
	Color("c4a082"), 
	Color("cbcbcb"),
	Color("f1bf81"),
	Color("ffc79d"),
	Color("ffffff00")
	]

var collected : PackedStringArray = ["res://Sprites/Objects/RocKWHite.png", "res://Sprites/Objects/TapeWhite.png"]
