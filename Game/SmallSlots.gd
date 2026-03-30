extends PanelContainer

const speed : int = 500
const sprite_height : int = 628
signal pressed
# All Symbol Probabilities!!!!:
const SYMBOLS = {
	"seven":  Rect2(0.0, 3837.5, 552.0, 622.5),
	"prugna": Rect2(0.0, 3233.8, 552.0, 589.3),
	"bar":    Rect2(0.0, 2537.0, 552.0, 668.7),
	"melon":  Rect2(0.0, 2017.7, 552.0, 408.3),
	"bell":   Rect2(0.0, 1465.0, 552.0, 471.1),
	"orange": Rect2(0.0, 968.1, 552.0, 424.5),
	"cherry": Rect2(0.0, 390.2, 552.0, 486.6),
	"lemon":  Rect2(0.0, 0.0, 552.0, 418.0)
}



func _ready():
	pressed.connect(_on_pressed)

func _process(delta):
	$Sprite.position.y += speed * delta
	$Sprite2.position.y += speed * delta
	
	if $Sprite.position.y >= sprite_height:
		$Sprite.position.y = $Sprite2.position.y - sprite_height
	
	if $Sprite2.position.y >= sprite_height:
		$Sprite2.position.y = $Sprite.position.y - sprite_height

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode in [KEY_ENTER, KEY_SPACE]:
		pressed.emit()

func _on_pressed():
	set_process(false)
