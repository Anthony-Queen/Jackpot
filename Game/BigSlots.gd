extends PanelContainer

func _ready():
	if $Sprite and $Sprite2:
		spin()

func spin():
	var tw = get_tree().create_tween()
	tw.tween_property($Sprite, "position", Vector2(85, 600), 1)
	tw.parallel().tween_property($Sprite2, "position", Vector2(85, 600), 1)
