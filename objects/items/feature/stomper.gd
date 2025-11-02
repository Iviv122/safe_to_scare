extends Area2D
class_name Stomper

@export var progress_bar : TextureProgressBar
@export var time_to_explode : float = 1

@export var stomp_effect : GPUParticles2D

var time : float = 0

func _ready():
	progress_bar.value = 0 
	progress_bar.max_value = time_to_explode 
	progress_bar.min_value = 0


func detect() -> void:
	for i in get_overlapping_bodies():
		if i is Enemy:
			i.damage(0.5)
	for i in get_overlapping_areas():
		if i is Enemy:
			i.damage(0.5)

func proc() -> void:
	detect()	
	stomp_effect.restart()

func _process(delta : float):
	
	if GameStateInstance.state == GameState.State.Selecting:
		return

	time += delta

	if time > time_to_explode:
		proc()
		time = 0


	progress_bar.value = time
