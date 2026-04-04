extends PanelContainer

func _input(event):
	if event.is_action_pressed("Right"):
		rotate()

func rotate():
	$".".rotation_degrees += 90
	Globals.rotated.emit()
