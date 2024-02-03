extends Label

func _ready():
	TimeManager.update_time.connect(_on_time_manager_update_time)

func _process(_delta):
	pass

func _on_time_manager_update_time(day: String, timeFormatted: String):
	text = day + ' ' + timeFormatted
