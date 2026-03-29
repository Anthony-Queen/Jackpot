extends PanelContainer

var speed := 2000
var sprite_height := 4460

func _process(delta):
	$Sprite.position.y += speed * delta
	$Sprite2.position.y += speed * delta
	
	if $Sprite.position.y >= sprite_height:
		$Sprite.position.y = $Sprite2.position.y - sprite_height
		print("Worky 1")
	
	if $Sprite2.position.y >= sprite_height:
		$Sprite2.position.y = $Sprite.position.y - sprite_height
		print("Worky 2")
