extends GridContainer
@onready var Small = $Small5
@onready var Small2 = $Small6
@onready var Small3 = $Small7
@onready var Small4 = $Small8


func _input(event):
	if event.is_action_pressed("Left") and Globals.canMove:
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
	Globals.rotated.emit()
