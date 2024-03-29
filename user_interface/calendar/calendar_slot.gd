class_name CalendarSlot extends TextureRect

var datetime: DateTime = DateTime.new(0)
@onready var label: Label = %Label
@onready var panel: Panel = %Panel
var text: String :
	set(value) :
		label.text = value

func set_date(_datetime: DateTime):
	datetime = _datetime
	text = datetime.formatted_time

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
