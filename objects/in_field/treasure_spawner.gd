extends Node2D
class_name TreasureSpawner 

@export var spawn_rate : float = 10
var treaure : PackedScene = preload("res://assets/prefabs/on_field/treasure.tscn")
@export var spawn_radius : float = 600

var enemy_stats : Array[EnemyStats]
var timer :float = 1

func _ready():
	timer = spawn_rate 

func shoot() -> void:
	var instance : Treasure=  treaure.instantiate()

	var r = randf_range(0,spawn_radius)
	instance.global_position = Vector2(sin(r),cos(r))*r

	get_tree().current_scene.add_child(instance)

func _process(delta):
	if GameStateInstance.state != GameState.State.Playing:
		return	
	
	if timer <= 0:
		shoot()
		timer = spawn_rate 
	timer -= delta