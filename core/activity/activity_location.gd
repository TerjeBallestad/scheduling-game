class_name ActivityLocation extends Node2D

@export var activity: Activity

func _on_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("patient_navigation") && GameState.activePatient:
		GameState.activePatient.move_to_interactable(activity)
		var nameout = "going to with %s" % name
		print(nameout)
