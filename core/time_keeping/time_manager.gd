extends Node

var game_time_factor : float = 500
var time : float
var datetime : DateTime
var calendar : Calendar
var timeFormatted : String
var realTimeFormatted : String
var previousTimeFormatted : String
var startTime := 900
var alarms: Array[DateTime] = []
var target_timestamp: DateTime
signal update_time(day: String, timeFormatted: String)

func _ready():
	time += startTime
	datetime = DateTime.new()
	calendar = Calendar.new()
	Engine.time_scale = 1
	print("original time = %s %f" % [datetime.formatted(), time])
	target_timestamp = DateTime.new().target_date(DateTime.Day.saturday, 2, 59)
	target_timestamp.date_target_reached.connect(_on_timestamp_target_reaced)
	add_alarm(target_timestamp)
	print(target_timestamp.formatted())

func _process(delta):
	time += delta
	datetime.update(time)
	timeFormatted = datetime.formatted()
	if timeFormatted != previousTimeFormatted:
		update_time.emit("", timeFormatted)
		previousTimeFormatted = timeFormatted
	for alarm in alarms:
		if alarm.time <= datetime.time:
			alarm.date_target_reached.emit()
			alarms.erase(alarm)
			alarm.queue_free()

func add_alarm(alarm: DateTime):
	print(alarm.formatted())
	alarms.append(alarm)

func _on_timestamp_target_reaced():
	print("target reaced")
