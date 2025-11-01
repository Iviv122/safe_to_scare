extends CanvasLayer
class_name SelectScreen

var stats_list : Array[StatReward]
var item_list : Array

@export var tutor_label : TutorialLabel
@export var skip_button : Button

@export var where_to_add : Control

func _ready():
	
	stats_list = StatRewardParser.load_stat_rewards_from_file()	
	print("Loaded stat rewards: ",stats_list.size())
	hide()

	add_to_group("curse_reward")
	add_to_group("item_reward")

	where_to_add.custom_minimum_size = Vector2(300,350)
	tutor_label.tutor_ended.connect(select_stat)

func appear() -> void:

	for i in where_to_add.get_children():
		i.queue_free()

	show()
	GameStateInstance.set_state(GameState.State.Selecting)

func curse_reward() -> void:
	skip_button.hide()
	appear()

func item_reward() -> void:
	skip_button.show()
	appear()

func disappear() -> void:
	hide()
	GameStateInstance.set_state(GameState.State.Playing)

func select_stat() -> void:
	skip_button.show()	
	appear()
	
	for i in range(0,3):
		var b = SelectStat.new()

		b.stat =  stats_list.pick_random()
		b.custom_minimum_size = Vector2(300,300)
		b.text = b.stat._to_string()
		b.pressed.connect(disappear)
		where_to_add.add_child(b)


func skip() -> void:
	disappear()
