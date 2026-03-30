extends PanelContainer

const speed : int = 500
const sprite_height : int = 628
var chosenSymbol
var currentSprite
signal pressed

# All Symbol Stuff:
const SYMBOLS = {
	"seven":  Rect2(0.0, 3837.5, 552.0, 622.5),
	"plum": Rect2(0.0, 3233.8, 552.0, 589.3),
	"bar":    Rect2(0.0, 2537.0, 552.0, 668.7),
	"melon":  Rect2(0.0, 2017.7, 552.0, 408.3),
	"bell":   Rect2(0.0, 1465.0, 552.0, 471.1),
	"orange": Rect2(0.0, 968.1, 552.0, 424.5),
	"cherry": Rect2(0.0, 390.2, 552.0, 486.6),
	"lemon":  Rect2(0.0, 0.0, 552.0, 418.0)
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

func _on_pressed():
	if currentSprite == $Sprite:
		$Sprite.position.y = SYMBOLS[chosenSymbol].position.y
	else:
		$Sprite2.position.y = SYMBOLS[chosenSymbol].position.y
	set_process(false)
