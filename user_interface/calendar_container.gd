class_name CalendarContainer extends PanelContainer

var activityButtons: Array[Button] = []
@onready var buttonContainer: GridContainer = $GridContainer

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
	buttonContainer.add_child(button)
	button.text = activity.name
	button.button_down.connect(schedule_activity.bind(activity))
	button.custom_minimum_size = Vector2(120, 200)
