extends Area2D 
class_name AirStrike

@export var progress_bar : TextureProgressBar
@export var time_to_explode : float

var time : float = 0

func _ready():
	progress_bar.value = 0 
	progress_bar.max_value = time_to_explode 
	progress_bar.min_value = 0


func detect() -> void:
	for i in get_overlapping_bodies():
		if i is Enemy:
			i.die()
	for i in get_overlapping_areas():
		if i is Enemy:
			i.die()

func proc() -> void:
	detect()	
	queue_free()

func _process(delta : float):
	
	if GameStateInstance.state == GameState.State.Selecting:
		return

	time += delta

	if time < 0:
		time = 0

	if time > time_to_explode:
		proc()


	progress_bar.value = time
