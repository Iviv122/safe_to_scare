extends Node2D
class_name EnemySpawner

@export var enemy_list : EnemyList 
@export var spawn_rate : float = 1

@export var spawn_radius : float = 1500

@export var myself_node : EnemySpawnerNode

var enemy_stats : Array[EnemyStats]
var timer :float = 1

func _ready():
	enemy_stats = EnemyParser.load_enemies_from_file()
	myself_node.node = self

func spawn_pos(pos : Vector2) -> void:
	var e : Enemy = enemy_list.get_enemy().instantiate()

	e.global_position = pos
	e.insert_stats(enemy_stats.pick_random().duplicate())

	add_child(e)  


func spawn() -> void:

	var rand = randf_range(-3,3)
	var pos = Vector2(sin(rand),cos(rand))*spawn_radius 
	var e : Enemy = enemy_list.get_enemy().instantiate()

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
