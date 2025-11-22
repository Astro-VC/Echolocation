extends Node

#Stores scenes and textures

var echo : PackedScene = load("res://Scenes/Other/echo.tscn")
var audio : PackedScene = load("res://Scenes/Other/sound.tscn")

var buffer : PackedStringArray = ["res://Audio/object release.mp3", 
"res://Audio/WalkStone3.mp3", 
"res://Audio/Whoosh.wav", 
"res://Audio/wormhole-129234.mp3", 
"res://Audio/Transition_2.wav", 
"res://Audio/whoosh-axe-throw-389751.mp3", 
"res://Audio/match-cave-164967.mp3",
"res://Audio/Shatter.wav",
"res://Audio/Whah.wav"
]

var musics : PackedStringArray = [
	"res://Audio/Musics/Title_Theme.mp3", 
	"res://Audio/Musics/Theme_1.mp3", 
	"res://Audio/Musics/Theme_2.mp3", 
	"res://Audio/Musics/Puzzle_Zone_Theme.mp3", 
	"res://Audio/Musics/Jumping_Zone_Theme.mp3", 
	"res://Audio/Musics/Monster_Zone_Theme.mp3"
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
	Color("ffc79d")
	]

var collected : PackedStringArray = ["res://Sprites/Objects/RocKWHite.png", "res://Sprites/Objects/TapeWhite.png"]
