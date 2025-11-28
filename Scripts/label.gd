extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.tape_taken.connect(check.bind())


func check() -> void:
	if Resources.seals[0] == true:
		return
	
	if Resources.seals[1] == true:
		return
	
	if Resources.seals[2] == true:
		return
	
	if Resources.seals[3] == true:
		return
	
	text = "Climb out of here"
