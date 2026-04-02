extends Control

func _ready() -> void:
	Globals.pressed.connect(_on_pressed)

func _on_pressed():
	print("Connected")
