class_name CalendarDay extends VBoxContainer

var day: DateTime.Day = DateTime.Day.monday
@onready var day_label: Label = %DayLabel
@export var slot_count := 24
@export var slot_scene: PackedScene

func setup(_day: DateTime.Day):
	day = _day
	day_label.text = DateTime.Day.find_key(day)[0].to_upper() + DateTime.Day.find_key(day).substr(1, -1)
	for slot in slot_count:
		var slotContainer = get_child(slot + 1)
		slotContainer.set_date(TimeManager.calendar.current_week[day * 96 + slot * 4])
		print("adding slot %s day: %d slot: %d" % [slotContainer.datetime.formatted, day, slot])

func _can_drop_data(_pos: Vector2, data: Variant) -> bool:
	return data is Texture2D

func _drop_data(_pos: Vector2, data: Variant):
	var textureRect = TextureRect.new()
	textureRect.texture = data
	textureRect.custom_minimum_size = Vector2(80, 300)
	add_child(textureRect)
