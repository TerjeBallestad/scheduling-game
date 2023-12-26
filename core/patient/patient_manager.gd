class_name  PatientManager extends Node2D

@export var patients: Array[Patient]

func _ready():
    GameState.activePatientChange.connect(print_something)
    for patient in patients:
        patient.patientManager = self
        GameState.add_patient(patient)

func print_something(patient: Patient):
    print('active patient: ', patient.name)

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("patient_navigation") && GameState.activePatient:
        GameState.activePatient.point_and_click_2d.set_new_movement_position(get_global_mouse_position())
