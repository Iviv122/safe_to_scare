extends CanvasLayer
class_name SelectScreen

var stats_list : Array[StatReward]
var item_list : Array[Item]

@export var tutor_label : TutorialLabel
@export var skip_button : Button

@export var where_to_add : Control

func _ready():
	
	stats_list = StatRewardParser.load_stat_rewards_from_file()	
	item_list = ItemsList.get_list()

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
	for i in range(0,3):
		var b = SelectItem.new()

		b.item =  item_list.pick_random()
		b.custom_minimum_size = Vector2(300,300)
		b.text = b.item._to_string()
		b.pressed.connect(disappear)
		where_to_add.add_child(b)



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
