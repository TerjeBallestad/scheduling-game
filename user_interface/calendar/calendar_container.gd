class_name CalendarContainer extends PanelContainer

@export var day_container_scene: PackedScene
@onready var weekContainer: HBoxContainer = %WeekView
@onready var activityPicker: VBoxContainer = %EventPicker
var activityButtons: Array[Button] = []
var dayContainers: Array[CalendarDay] = []

func _ready():
	GameState.activityAdded.connect(_add_activity_button)

func schedule_activity(activity: Interactable):
	var date = DateTime.new().countdown(3)
	date.date_target_reached.connect(on_patient_try_activity.bind(activity))

func on_patient_try_activity(activity: Interactable):
	if GameState.activePatient:
		GameState.activePatient.move_to_interactable(activity)

func _add_activity_button(activity: Interactable):
	var button = Button.new()
	activityPicker.add_child(button)
	button.text = activity.name
	button.button_down.connect(schedule_activity.bind(activity))
	button.custom_minimum_size = Vector2(120, 200)

func init_week() -> void :
	for day in 7 :
		var dayContainer = day_container_scene.instantiate()
		print(dayContainer.has_node('DayLabel'))
		dayContainer.setup(day)
		dayContainers.push_front(dayContainer)
		weekContainer.add_child(dayContainer)

func _on_close_button_pressed():
	hide()

func open():
	show()
	init_week()
