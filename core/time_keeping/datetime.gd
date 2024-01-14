class_name DateTime extends Node

enum Day {
	monday,
	tuesday,
	wednesday,
	thursday,
	friday,
	saturday,
	sunday
	}

signal date_target_reached()

var time: float
var day: int = 0
var hour: float = 0.0
var minute: float = 0.0
var game_time_factor : float = 60000
var game_minutes : float
var game_seconds : float
var game_hours : float
var game_days : float
var seconds_second : float
var seconds_minute: float
var seconds_hour : float
var seconds_day : float

func _init():
	seconds_second = 60 / game_time_factor
	seconds_minute = seconds_second * 60
	seconds_hour = seconds_minute * 60
	seconds_day = seconds_hour * 24
	update(TimeManager.time)


func formatted():
	return "%s %02d:%02d" % [Day.find_key(day), hour, minute]

func update(_time: float):
	time = _time
	game_minutes = time / seconds_minute
	game_hours = time / seconds_hour
	game_days = time / seconds_day
	hour = fmod(game_hours, 24)
	minute = fmod(game_minutes, 60)
	day = fmod(game_days, 7)

func target_date(_day: Day, _hour: float, _minute: float):
	var daysToAdd = _day - day
	if daysToAdd < 0:
		daysToAdd += 7
	time += daysToAdd * seconds_day
	time += (_hour - hour) * seconds_hour
	time += (_minute - minute) * seconds_minute
	update(time)
	TimeManager.add_alarm(self)
	return self

func countdown(seconds: int):
	time += seconds
	update(time)
	TimeManager.add_alarm(self)
	return self

func add_days(_days: int):
	time += _days * seconds_day
	update(time)

func add_hours(_hours: float):
	time += _hours * seconds_hour
	update(time)

func add_minutes(_minutes: float):
	print(_minutes, seconds_minute)
	time += _minutes * seconds_minute
	update(time)
