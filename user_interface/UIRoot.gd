class_name UIRoot extends CanvasLayer

@onready var calendar: CalendarContainer = %CalendarContainer

func _unhandled_input(event):
    if event.is_action_released("calendar"):
        print(event)
        calendar.open()
