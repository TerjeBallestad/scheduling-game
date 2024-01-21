class_name CalendarEvent extends TextureRect



func _get_drag_data(_at_position: Vector2):
	var preview_texture = TextureRect.new()

	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30,30)

	var preview = Control.new()
	preview.add_child(preview_texture)

	set_drag_preview(preview)
	texture = null

	return preview_texture.texture


func _can_drop_data(_pos: Vector2, data: Variant) -> bool:
	return data is Texture2D


func _drop_data(_pos: Vector2, data: Variant):
	texture = data
	custom_minimum_size = Vector2(80, 300)
