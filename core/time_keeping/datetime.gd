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

var game_time_factor: float = 60000
var time := 0.0
var seconds_second: float # seconds in an in-game second
var seconds_minute: float # seconds in an in-game minute
var seconds_hour: float # seconds in an in-game hour
var seconds_day: float # seconds in an in-game day

var game_minutes: float :
	get :
		return time / seconds_minute

var game_hours: float :
	get :
		return time / seconds_hour

var game_days: float :
	get :
		return time / seconds_day

var minute: float:
	get :
		return fmod(game_minutes, 60)

var hour: float :
	get :
		return fmod(game_hours, 24)

var day: int :
	get :
		return fmod(game_days, 7)

var formatted: String :
	get:
		return "%s %02d:%02d" % [Day.find_key(day)[0].to_upper() + Day.find_key(day).substr(1, -1), hour, minute]

var formatted_time: String :
	get:
		return "%02d:%02d" % [hour, minute]

var formatted_day:
	get:
		return Day.find_key(day)[0].to_upper() + Day.find_key(day).substr(1, -1)

func _init(_time: float = -1):
	seconds_second = 60 / game_time_factor
	seconds_minute = seconds_second * 60
	seconds_hour = seconds_minute * 60
	seconds_day = seconds_hour * 24
	if(_time == -1):
		time = TimeManager.time
	else:
		time = _time

func update(_time: float):
	time = _time

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
