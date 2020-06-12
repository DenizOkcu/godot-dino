extends Sprite

func move_horizontally(distance):
	var textureWidth = texture.get_size().x
	
	global_position.x -= floor(distance)

	if (global_position.x + textureWidth) <= 0:
		global_position.x = textureWidth
