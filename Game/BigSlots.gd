extends PanelContainer

#set_process(false) # Stops _process
var spins: int = 0
var speed := 2000
var sprite_height := 1142
var positions: Array = [0, ]

func _process(delta):
	$Sprite.position.y += speed * delta
	$Sprite2.position.y += speed * delta
	
	if $Sprite.position.y >= sprite_height:
		$Sprite.position.y = $Sprite2.position.y - sprite_height
	
	if $Sprite2.position.y >= sprite_height:
		$Sprite2.position.y = $Sprite.position.y - sprite_height
		spins += 1
	if spins == 3:
		set_process(false)
