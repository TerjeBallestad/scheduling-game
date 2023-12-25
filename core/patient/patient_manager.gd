class_name  PatientManager extends Node

@export var patients: Array[Patient]

func _init():
    print('hello', patients.count())
    for patient in patients:
        print("adding patient", patient.name)
        GameState.add_patient(patient)
