extends PanelContainer
@onready var wasButtonPressed: bool = false

func _ready():
	var tw = get_tree().create_tween()
	tw.tween_property($Sprite, "position", Vector2(85, 600), 1)
