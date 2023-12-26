extends Node

var patients: Array[Patient] = []
var activePatient: Patient

signal patientAdded(patient: Patient)
signal activePatientChange(patient: Patient)

func add_patient(patient: Patient):
    print(patient.name)
    patients.push_front(patient)
    patientAdded.emit(patient)

func set_active_patient(patient: Patient):
    if(activePatient == patient):
        return
    activePatient = patient
    activePatientChange.emit(patient)
