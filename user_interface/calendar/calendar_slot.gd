class_name CalendarSlot extends TextureRect

var datetime: DateTime
var label: Label
var panel: Panel
var text: String :
	set(value) :
		label.text = value

func _init():
	expand_mode = TextureRect.EXPAND_FIT_WIDTH
	stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	label = Label.new()
	add_child(label)
	panel = Panel.new()
	panel.show_behind_parent = true
	panel.set_anchors_preset(Control.PRESET_FULL_RECT)
	panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(panel)
	custom_minimum_size.y = 28

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

	print('dropped data at %s active patient:' % [datetime.formatted])
