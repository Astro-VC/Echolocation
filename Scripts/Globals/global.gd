extends Node

#Control Stuff

signal echo
signal projectile_used
signal noise_updated

var noise : bool = false

var direction : float

##Monster info
var chase_player : bool = false
