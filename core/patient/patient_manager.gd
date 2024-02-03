class_name  PatientManager extends Node2D

@export var patients: Array[Patient]
var patient_mouseover: Patient

func _ready():
    GameState.activePatientChange.connect(set_active_patient)
    for patient in patients:
        patient.patientManager = self
        GameState.add_patient(patient)

func set_active_patient(patient: Patient):
    print('active patient: ', patient.name)
    for p in patients:
        p.deactivate()
    patient.activate()

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("patient_navigation") && GameState.activePatient:
        if patient_mouseover:
            GameState.set_active_patient(patient_mouseover)
            return
        GameState.activePatient.point_and_click_2d.set_new_movement_position(get_global_mouse_position())
