extends Node2D
class_name EnemySpawner

@export var enemy_list : Array[PackedScene] 
@export var spawn_rate : float = 1

@export var spawn_radius : float = 1500

var enemy_stats : Array[EnemyStats]
var timer :float = 1

func _ready():
	enemy_list = EnemyList.get_list()
	enemy_stats = EnemyParser.load_enemies_from_file()

func spawn() -> void:

	var rand = randf_range(-3,3)
	var pos = Vector2(sin(rand),cos(rand))*spawn_radius 
	var e : Enemy = enemy_list.pick_random().instantiate()

	e.global_position = pos
	e.insert_stats(enemy_stats.pick_random().duplicate())

	add_child(e)  

	timer = 1 


func append_skill(_e : Enemy) -> void:
	pass

func _process(delta):
	if GameStateInstance.state != GameState.State.Playing:
		return	
	
	if timer <= 0:
		spawn()
	timer -= delta*spawn_rate
