class_name Interactable extends Node2D

signal on_interact(interactable: Interactable)
@export var patient: Patient

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func interact():
	var nameout = "interacting with %s" % name
	print(nameout)


func _on_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("patient_navigation"):
		patient.move_to_interactable(self)
		var nameout = "going to with %s" % name
		print(nameout)
