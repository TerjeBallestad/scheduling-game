class_name CalendarDay extends VBoxContainer

var day: DateTime.Day

func _init(_day: DateTime.Day):
	day = _day

func _ready():
	size_flags_horizontal = Control.SIZE_EXPAND
	var label = Label.new()
	add_child(label)
	label.text = DateTime.Day.find_key(day)
	for slot in 12:
		var slotContainer = CalendarSlot.new()
		slotContainer.text = str(slot + 1)
		slotContainer.datetime = TimeManager.calendar.current_week[day * 96 + slot]
		print("adding slot %s day: %d slot: %d" % [slotContainer.datetime.formatted(), day, slot])
		add_child(slotContainer)


func _can_drop_data(_pos: Vector2, data: Variant) -> bool:
	return data is Texture2D

func _drop_data(_pos: Vector2, data: Variant):
	var textureRect = TextureRect.new()
	textureRect.texture = data
	textureRect.custom_minimum_size = Vector2(80, 300)
	add_child(textureRect)
