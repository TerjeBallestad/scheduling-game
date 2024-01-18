class_name CalendarDay extends VBoxContainer

var day: DateTime.Day

func _init(_day: DateTime.Day):
	day = _day

func _ready():
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var label = Label.new()
	add_child(label)
	label.text = DateTime.Day.find_key(day)
	for slot in 24:
		var slotContainer = CalendarSlot.new()
		slotContainer.datetime = TimeManager.calendar.current_week[day * 96 + slot * 4]
		slotContainer.text = slotContainer.datetime.formatted
		print("adding slot %s day: %d slot: %d" % [slotContainer.datetime.formatted, day, slot])
		add_child(slotContainer)


func _can_drop_data(_pos: Vector2, data: Variant) -> bool:
	return data is Texture2D

func _drop_data(_pos: Vector2, data: Variant):
	var textureRect = TextureRect.new()
	textureRect.texture = data
	textureRect.custom_minimum_size = Vector2(80, 300)
	add_child(textureRect)
