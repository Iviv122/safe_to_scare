extends Area2D
class_name Treasure

@export var time_to_fill : float = 3
@export var progress : TextureProgressBar 

var is_filling : int = 0 
var time :float= 0

func _ready():
	ItemsList.get_list()

	progress.min_value = 0
	progress.max_value = time_to_fill
	progress.value = time 

	body_entered.connect(is_player_entered)
	body_exited.connect(is_player_exited)

func is_player_entered(n : Node2D) -> void:
	if n is CharacterMovement:
		is_filling = 1 
func is_player_exited(n : Node2D) -> void:
	if n is CharacterMovement:
		is_filling = -1	

func proc() -> void:
	get_tree().call_group("item_reward","item_reward")	
	queue_free()

func _process(delta : float):
	
	if GameStateInstance.state == GameState.State.Selecting:
		return

	time += delta*is_filling

	if time < 0:
		time = 0

	if time > time_to_fill:
		proc()


	progress.value = time
