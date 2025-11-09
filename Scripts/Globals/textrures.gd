extends Node

#Stores scenes and textures

var echo : PackedScene = load("res://Scenes/Other/echo.tscn")
var audio : PackedScene = load("res://Scenes/Other/sound.tscn")

var buffer : PackedStringArray = ["res://Audio/object release.mp3"]
var projectiles : PackedStringArray = ["res://Scenes/Objects/rock.tscn"]
var particles : PackedStringArray = [
 "res://Scenes/Particle/breack_particle.tscn",
 "res://Scenes/Particle/common_particle.tscn",
 "res://Scenes/Particle/land_particle.tscn"
]

var colors : PackedColorArray = [Color("dedbf9"), Color("c5edea"), Color("f0faf9"), Color("f0f3c2"), Color("ffc2c4"), Color("ff7569"), Color("bca59a"), Color("c4a082")]

var collected : PackedStringArray = ["res://Sprites/Objects/RocKWHite.png"]
