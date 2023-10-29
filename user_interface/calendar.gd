class_name Calendar extends PanelContainer

@export var activities: Array[Interactable]
@export var temp_patient: Patient

func schedule_activity():
	var date = DateTime.new().countdown(3)
	date.date_target_reached.connect(on_patient_try_activity)

func on_patient_try_activity():
	temp_patient.move_to_interactable(activities[0])


func _on_button_button_up():
	schedule_activity()
