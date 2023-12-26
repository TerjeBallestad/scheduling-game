extends PanelContainer

var patientButtons: Array[TextureButton] = []
@onready var buttonContainer: VBoxContainer = $VerticalContainer

func _ready():
	GameState.patientAdded.connect(_add_patient_button)

func _add_patient_button(patient: Patient):
	var button = TextureButton.new()
	buttonContainer.add_child(button)
	button.texture_normal = patient.sprite.texture
	button.button_down.connect(GameState.set_active_patient.bind(patient))
