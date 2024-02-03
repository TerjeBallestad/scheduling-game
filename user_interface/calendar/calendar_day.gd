class_name CalendarDay extends VBoxContainer

var day: DateTime.Day
@onready var day_label: Label = %DayLabel
@export var slot_count := 24
@export var slot_scene: PackedScene

func _ready():
	print(day, DateTime.Day.find_key(day))
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	day_label.text = DateTime.Day.find_key(day)
	for slot in slot_count:
		var slotContainer = slot_scene.instantiate()
		slotContainer.datetime = TimeManager.calendar.current_week[day * 96 + slot * 4]
		slotContainer.text = slotContainer.datetime.formatted
		print("adding slot %s day: %d slot: %d" % [slotContainer.datetime.formatted, day, slot])
		add_child(slotContainer)

func _process(_delta: float):
	print(slot_count)

func setup(_day: DateTime.Day):
	day = _day

func _can_drop_data(_pos: Vector2, data: Variant) -> bool:
	return data is Texture2D

func _drop_data(_pos: Vector2, data: Variant):
	var textureRect = TextureRect.new()
	textureRect.texture = data
	textureRect.custom_minimum_size = Vector2(80, 300)
	add_child(textureRect)
