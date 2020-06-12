extends Sprite

func move_horizontally(distance):
	var textureWidth = texture.get_size().x
	var viewportWidth = get_viewport().get_visible_rect().size.x
	
	global_position.x -= floor(distance)

	if (global_position.x + textureWidth) <= 0:
		global_position.x = textureWidth
