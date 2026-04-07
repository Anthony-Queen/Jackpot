extends PanelContainer

const speed : int = 2000
const sprite_height : int = 628
var chosenSymbol
@onready var currentSprite = $Sprite
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
	#"lemon":  602,
	}  

# More entries = Higher chance of getting picked
var reel = [
	"cherry","cherry","cherry","cherry","cherry","cherry", # 24%
	#"lemon","lemon","lemon","lemon","lemon", # 20%
	"orange","orange","orange","orange",  # 16%
	"plum","plum","plum", # 12%
	"melon","melon","melon", # 12%
	"bell","bell", # 8%
	"bar", # 4%
	"seven" # 4%
]

func _ready() -> void:
	chosenSymbol = reel.pick_random()

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
	if event is InputEventKey and event.pressed and event.keycode == KEY_ENTER:
		Globals.canMove = false
		if Globals.Enters < 5:
			Globals.Enters += 1
			_on_pressed()
		else:
			Globals.Enters = 0
			print("Wow sho kool") #Replay logic here

func _on_pressed():
	set_process(false)
	currentSprite.visible = true
	currentSprite.position.y = SYMBOLS[chosenSymbol]

	var id = Globals.SYMBOL_TO_ID[chosenSymbol]
	Globals.update_slot(slot_index, id)

	if currentSprite == Sprite:
		Sprite2.visible = false
	else:
		Sprite.visible = false

	Globals.spins += 1
	if Globals.spins == 5:
		Globals.check_wins()
		print("Checked!")
