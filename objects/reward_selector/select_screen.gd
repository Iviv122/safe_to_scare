extends CanvasLayer
class_name SelectScreen

var stats_list : Array[StatReward]
var item_list : Array

@export var tutor_label : TutorialLabel

@export var where_to_add : Control

func _ready():
	
	stats_list = StatRewardParser.load_stat_rewards_from_file()	
	print("Loaded stat rewards: ",stats_list.size())
	hide()

	tutor_label.tutor_ended.connect(select_stat)

func appear() -> void:
	show()
	GameStateInstance.set_state(GameState.State.Selecting)

func select_item() -> void:
	appear()


func select_stat() -> void:
	for i in where_to_add.get_children():
		i.queue_free()
	
	appear()
	
	for i in range(0,3):
		var b = SelectStat.new()
		b.stat =  stats_list.pick_random()
		b.text = b.stat._to_string()
		where_to_add.add_child(b)
