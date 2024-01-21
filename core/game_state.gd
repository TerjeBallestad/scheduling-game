extends Node

var patients: Array[Patient] = []
var activePatient: Patient
var activities: Array[Activity]

signal patientAdded(patient: Patient)
signal activePatientChange(patient: Patient)
signal activityAdded(activity: Activity)

func add_patient(patient: Patient):
    print(patient.name)
    patients.push_front(patient)
    patientAdded.emit(patient)

func add_activity(activity: Activity):
    print('adding activity %s' % activity.name)
    activities.push_front(activity)
    activityAdded.emit(activity)

func set_active_patient(patient: Patient):
    if(activePatient == patient):
        return
    activePatient = patient
    activePatientChange.emit(patient)
