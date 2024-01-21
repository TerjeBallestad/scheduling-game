class_name Activity extends Interactable

func _ready():
    GameState.add_activity(self)

func _on_input_event(_viewport, event, _shape_idx):
    if event.is_action_pressed("patient_navigation") && GameState.activePatient:
        GameState.activePatient.move_to_interactable(self)
        var nameout = "going to with %s" % name
        print(nameout)
