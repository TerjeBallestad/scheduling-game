class_name Activity extends Interactable

@export var activity: ActivityResource
@onready var sprite: Sprite2D = %Sprite2D

func _ready():
    GameState.add_activity(self)
    sprite.texture = activity.texture

func _on_input_event(_viewport, event, _shape_idx):
    if event.is_action_pressed("patient_navigation") && GameState.activePatient:
        GameState.activePatient.move_to_interactable(self)
        var nameout = "going to with %s" % name
        print(nameout)

func interact():
    print("interacting with %s" % activity.name)
