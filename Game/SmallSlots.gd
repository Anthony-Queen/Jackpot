extends PanelContainer

const speed : int = 500
const sprite_height : int = 628
var chosenSymbol
var currentSprite
signal pressed

# All Symbol Stuff:
const SYMBOLS = {
	"seven":  3837,
	"plum": 3234,
	"bar":    2537,
	"melon":  2017,
	"bell":   1465,
	"orange": 668,
	"cherry": Vector2(0, 496),
	"lemon":  0,
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

func _on_pressed(): # Cant set this position, cause THIS position only works on a rect, so instead its setting it to world coordinates
	set_process(false)
	if currentSprite == $Sprite:
		$Sprite.position = SYMBOLS["cherry"]
		print($Sprite.position)
	else:
		$Sprite2.position = SYMBOLS["cherry"] + Vector2(0, sprite_height)
		print($Sprite2.position)
#I fckng hate this
