extends Node2D
class_name EnemySpawner

@export var enemy_list : EnemyList 
@export var spawn_rate : float = 5

@export var spawn_radius : float = 1500

func _ready():
    spawning()

func spawning() -> void:

    var rand = randf_range(-3,3)
    var pos = Vector2(sin(rand),cos(rand))*spawn_radius 

    var e : Enemy = enemy_list.list.pick_random().instantiate()
    e.global_position = pos
    add_child(e)

    await get_tree().create_timer(1/spawn_rate).timeout
    spawning()