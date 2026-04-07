extends GridContainer
@onready var Small = $Small1
@onready var Small2 = $Small2
@onready var Small3 = $Small3
@onready var Small4 = $Small4


func _input(event):
	if event.is_action_pressed("Up") and Globals.canMove:
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
	Globals.rotated1.emit()
