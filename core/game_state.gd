extends Node

var patients: Array[Patient]
signal patientAdded(patient: Patient)
var number = 14
var string = 'whaaat'

func add_patient(patient: Patient):
    print(patient)
    patients.push_front(patient)
    patientAdded.emit(patient)
