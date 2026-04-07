extends Panel
@onready var Label1 = $Label
@onready var Label2 = $Label2

func _process(_delta: float) -> void:
	Label1.text = "Current coins: " + str(Globals.coins) + " coins"
