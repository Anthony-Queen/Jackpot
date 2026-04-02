extends PanelContainer

const speed : int = 2000
const sprite_height : int = 628
var chosenSymbol
@onready   var currentSprite = $Sprite
@onready var Sprite = $Sprite
@onready var Sprite2 = $Sprite2
@export var slot_index: int

# All Symbol Stuff:
const SYMBOLS = {
	"seven":  -409,
	"plum":   -244,
	"bar":    -81,
	"melon":  83,
	"bell":   217,
	"orange": 360,
	"cherry": 490,
	"lemon":  602,
	}  

# More entries = Higher chance of getting picked
var reel = [
	"cherry","cherry","cherry","cherry","cherry","cherry", # 24%
	"lemon","lemon","lemon","lemon","lemon", # 20%
	"orange","orange","orange","orange",  # 16%
	"plum","plum","plum", # 12%
	"melon","melon","melon", # 12%
	"bell","bell", # 8%
	"bar", # 4%
	"seven" # 4%
]

func _ready() -> void:
	chosenSymbol = reel.pick_random()
	Globals.pressed.connect(_on_pressed)

func _process(delta):
	Sprite.position.y += speed * delta
	Sprite2.position.y += speed * delta

	if Sprite.position.y   >= sprite_height:
		Sprite.position.y = Sprite2.position.y - sprite_height
		currentSprite = Sprite
	if Sprite2.position.y >= sprite_height:
		Sprite2.position.y = Sprite.position.y - sprite_height
		currentSprite = Sprite2

func _input(event): 
	if event is InputEventKey and event.pressed and event.keycode in [KEY_ENTER, KEY_SPACE]:
		Globals.pressed.emit()

func _on_pressed():
	set_process(false) 
	if currentSprite == Sprite:
		Sprite.visible = true
		Sprite.position.y = SYMBOLS[chosenSymbol]
		var id = Globals.SYMBOL_TO_ID[chosenSymbol]
		Globals.update_slot(slot_index, id)
		Sprite2.visible = false
	else:
		Sprite2.visible = true
		Sprite2.position.y = SYMBOLS[chosenSymbol]
		var id = Globals.SYMBOL_TO_ID[chosenSymbol]
		Globals.update_slot(slot_index, id)
		Sprite.visible = false
