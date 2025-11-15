extends Node

#Control Stuff

signal echo
signal projectile_used
signal noise_updated
signal damage
signal camera_shake
signal update_color
signal zoom

var noise : bool = false

var direction : float

##Monster info
var chase_player : bool = false
