extends PanelContainer

var patientButtons: Array[TextureButton]
var buttonContainer: Container

func _init():
    GameState.patientAdded.connect(_add_patient_button)

func _add_patient_button(patient: Patient):
    var button = TextureButton.new()
    buttonContainer.add_child(button)
    button.texture_normal = patient.sprite.texture
    button.button_down.connect(print_something(patient))

func print_something(patient: Patient):
    print('something', patient.name)
