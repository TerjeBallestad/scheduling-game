class_name CalendarContainer extends Panel

var activityButtons: Array[Button] = []
var dayContainers: Array[CalendarDay] = []
@onready var weekContainer: HBoxContainer = %WeekView
@onready var activityPicker: VBoxContainer = %EventPicker

func _ready():
	init_week()
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
		var dayContainer = CalendarDay.new(day)
		dayContainers.push_front(dayContainer)
		weekContainer.add_child(dayContainer)
