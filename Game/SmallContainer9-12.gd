extends GridContainer
@onready var Small = $Small9
@onready var Small2 = $Small10
@onready var Small3 = $Small11
@onready var Small4 = $Small12
 

func _input(event):
	if event.is_action_pressed("Right") and Globals.canMove:
		rotate()

func rotate():
	rotation_degrees += 90
	Small.pivot_offset = Small.size / 2
	Small.rotation_degrees -= 90
	Small2.pivot_offset = Small2.size / 2
	Small2.rotation_degrees -= 90
	Small3.pivot_offset = Small3.size / 2
	Small3.rotation_degrees -= 90
	Small4.pivot_offset = Small4.size / 2
	Small4.rotation_degrees -= 90
	Globals.rotated3.emit()
