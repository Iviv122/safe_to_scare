extends CanvasLayer
class_name SelectScreen

@export var stats_list : StatRewardList 
@export var item_list : ItemsList 
@export var curse_list : CurseList 

@export var tutor_label : TutorialLabel
@export var skip_button : Button
@export var where_to_add : Control

@export var reward_label : RichTextLabel

func _ready():
	
	hide()

	add_to_group("curse_reward")
	add_to_group("item_reward")

	where_to_add.custom_minimum_size = Vector2(300,350)
	tutor_label.tutor_ended.connect(select_stat)

	PlayerStatsInstance.lvl_up.connect(select_stat)

func appear() -> void:

	for i in where_to_add.get_children():
		i.queue_free()

	show()
	GameStateInstance.set_state(GameState.State.Selecting)

func curse_reward() -> void:
	skip_button.hide()
	appear()
	reward_label.text = "[shake rate=20.0 level=5 connected=1]Choose your curse![/shake]"

	for i in range(0,3):
		var b = SelectCurse.new()
		
		b.curse = curse_list.get_item()
		b.custom_minimum_size = Vector2(300,300)
		b.text = b.curse._to_string()
		b.pressed.connect(disappear)
		where_to_add.add_child(b)

	
func item_reward() -> void:
	skip_button.show()
	appear()
	reward_label.text = "[tornado radius=3.0 freq=3.0]Choose your reward![/tornado]"
	for i in range(0,3):
		var b = SelectItem.new()

		b.item =  item_list.get_item()
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
	reward_label.text = "[tornado radius=3.0 freq=3.0]Choose your reward![/tornado]"
	for i in range(0,3):
		var b = SelectStat.new()

		b.stat =  stats_list.get_item()
		b.custom_minimum_size = Vector2(300,300)
		b.text = b.stat._to_string()
		b.pressed.connect(disappear)
		where_to_add.add_child(b)


func skip() -> void:
	disappear()
