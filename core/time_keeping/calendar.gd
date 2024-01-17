class_name Calendar extends Node

# The week divided up in 15 minute chunks
var current_week : Array[DateTime] =  []
var current_week_number := 0
var minutes_week := 10080

func _init():
    for s in range(0, minutes_week, 15):
        var date = DateTime.new()
        date.update(0)
        date.add_minutes(s)
        current_week.push_front(date)
        print("new date: %s" % date.formatted())

    print("init current week %d" % current_week_number)

func _ready():
    print_debug("current week %d" % current_week_number)

func _process(_delta):
    pass