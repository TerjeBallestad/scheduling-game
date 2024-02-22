class_name Patient extends CharacterBody2D

@export var patient: PatientResource
@export var texture: Texture2D
@onready var sprite: Sprite2D = %Sprite2D
@onready var point_and_click_2d: PointAndClick2D = %PointAndClick2D
@export var outline_material: Material
@export var energy: Dictionary

var interactable: Interactable
var patientManager: PatientManager
var hasInteracted := false
var active := false

func _ready():
	sprite.texture = patient.texture
	energy = {
		will = 43,
		creative = 12,
		physical = 5,
	}

func move_to_interactable(_interactable: Interactable) -> void:
	hasInteracted = false
	print("patient %s going to %s" % [patient.name, _interactable])
	interactable = _interactable
	point_and_click_2d.set_new_movement_position(interactable.get_position())

func _on_navigation_agent_2d_navigation_finished():
	if not hasInteracted:
		print('finished')
		point_and_click_2d.stop_movement()
		hasInteracted = true
		if interactable:
			interactable.interact()

func activate():
	active = true
	sprite.material = outline_material

func deactivate():
	active = false
	sprite.material = null

func _on_mouse_entered():
	sprite.material = outline_material
	patientManager.patient_mouseover = self

func _on_mouse_exited():
	if patientManager.patient_mouseover == self:
		patientManager.patient_mouseover = null
	if not active:
		sprite.material = null
