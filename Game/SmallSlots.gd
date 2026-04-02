extends PanelContainer

const speed : int = 2000
const sprite_height : int = 628
var chosenSymbol
@onready   var currentSprite = $Sprite
signal pressed

# All Symbol Stuff:
const SYMBOLS = {
	"seven":  -226,
	"plum":   -137,
	"bar":    -46.5,
	"melon":  45,
	"bell":   118,
	"orange": 192,
	"cherry": 265,
	"lemon":  332,
	}  

# More entries = Higher chance of getting picked
var reel = [
	"cherry","cherry","cherry","cherry","cherry", "cherry", # 24%
	"lemon","lemon","lemon","lemon", "lemon", # 20%
	"orange","orange","orange", "orange", # 16%
	"plum", "plum", "plum", # 12%
	"melon","melon", "melon", # 12%
	"bell", "bell", # 8%
	"bar", # 4%
	"seven", # 4%
]

func _ready():
	chosenSymbol = reel.pick_random()
	pressed.connect(_on_pressed)

func _process(delta):
	print($Sprite2.position, "Sprite2")
	print($Sprite.position, "Sprite1")
	$Sprite.position.y += speed * delta
	$Sprite2.position.y += speed * delta

	if $Sprite.position.y   >= sprite_height:
		$Sprite.position.y = $Sprite2.position.y - sprite_height
		currentSprite = $Sprite
	if $Sprite2.position.y >= sprite_height:
		$Sprite2.position.y = $Sprite.position.y - sprite_height
		currentSprite = $Sprite2

func _input(event): 
	if event is InputEventKey and event.pressed and event.keycode in [KEY_ENTER, KEY_SPACE]:
		pressed.emit()


func _on_pressed() -> void:
	set_process(false) 
	if currentSprite == $Sprite:
		$Sprite.position.y = SYMBOLS[chosenSymbol]
		print($Sprite.position, chosenSymbol, SYMBOLS[chosenSymbol])
		print($Sprite.position, "PressedSprite")
	else:
		$Sprite2.position.y = SYMBOLS[chosenSymbol]
		print($Sprite2.position, chosenSymbol, SYMBOLS[chosenSymbol]) 
