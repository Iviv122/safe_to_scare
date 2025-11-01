extends CanvasLayer
class_name SelectScreen

var stats_list : Array
var item_list : Array

@export var tutor_label : TutorialLabel

func _ready():
	hide()

	tutor_label.tutor_ended.connect(select_item)

func appear() -> void:
	show()
	GameStateInstance.set_state(GameState.State.Selecting)

func select_item() -> void:
	appear()


func select_stat() -> void:
	appear()
