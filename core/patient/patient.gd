class_name Patient extends CharacterBody2D

@export var texture: Texture2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var point_and_click_2d: PointAndClick2D = $PointAndClick2D
var interactable: Interactable
var patientManager: PatientManager
var hasInteracted := false

# func _unhandled_input(event: InputEvent) -> void:
# 	if event.is_action_pressed("patient_navigation"):
# 		point_and_click_2d.set_new_movement_position(get_global_mouse_position())

func _ready():
	sprite.texture = texture

func move_to_interactable(_interactable: Interactable) -> void:
	hasInteracted = false
	print(_interactable)
	interactable = _interactable
	point_and_click_2d.set_new_movement_position(interactable.get_position())

func _on_navigation_agent_2d_navigation_finished():
	if not hasInteracted:
		print('finished')
		point_and_click_2d.stop_movement()
		if interactable:
			hasInteracted = true
			interactable.interact()
