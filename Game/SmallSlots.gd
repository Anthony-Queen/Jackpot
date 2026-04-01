extends PanelContainer

const speed : int = 500
const sprite_height : int = 628
var chosenSymbol
@onready   var currentSprite = $Sprite
signal pressed

# All Symbol Stuff:
const SYMBOLS = {
	"seven":  Rect2(0, 50, 560, 4421),
	"plum":   Rect2(0, -590, 560, 4421),
	"bar":    Rect2(0, -1243, 560, 4421),
	"melon":  Rect2(0, -1905, 560, 4421),
	"bell":   Rect2(0, -2430, 560, 4421),
	"orange": Rect2(0, -2935, 560, 4421),
	"cherry": Rect2(0, -3465, 560, 4421),
	"lemon":  Rect2(0, -3900, 560, 4421)
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
	$Sprite.position.y += speed * delta
	$Sprite2.position.y += speed * delta

	if $Sprite.position.y >= sprite_height:
		$Sprite.position.y = $Sprite2.position.y - sprite_height
		currentSprite = $Sprite
	if $Sprite2.position.y >= sprite_height:
		$Sprite2.position.y = $Sprite.position.y - sprite_height
		currentSprite = $Sprite2

func _input(event): 
	if event is InputEventKey and event.pressed and event.keycode in [KEY_ENTER, KEY_SPACE]:
		pressed.emit()


func _on_pressed() -> void: #Debugging rn cause this shit is so fkng ass
	set_process(false)
	if currentSprite == $Sprite:
		$Sprite.region_rect = SYMBOLS[chosenSymbol]
		print($Sprite.region_rect, chosenSymbol)
	else:
		print("Ur gay")
