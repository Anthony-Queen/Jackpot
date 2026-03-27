extends PanelContainer
@onready var tw = get_tree().create_tween()
@onready var wasButtonPressed: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while not wasButtonPressed:
		tw.tween_property($Sprite, "position", Vector2(85, 600), 1)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta: float) -> void:
#	pass 
