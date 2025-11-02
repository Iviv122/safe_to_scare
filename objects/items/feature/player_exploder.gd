extends Node2D
class_name SelfExploder

const bullet : PackedScene = preload("res://assets/prefabs/projectiles/PlayerBullet.tscn")
var player_node : PlayerNode = preload("res://assets/globals/player_pos.tres") 

const time_to_explode : float = 2
var time = 0

const dirs : Array[Vector2] =[
	Vector2.DOWN,
	Vector2.RIGHT,
	Vector2.LEFT,
	Vector2.UP,
	Vector2(-1,-1),
	Vector2(-1,1),
	Vector2(1,1),
	Vector2(1,-1)
]

func explode() -> void:

	var p_pos = player_node.player_node.global_position

	for i in dirs:
		var b : Projectile = bullet.instantiate()
		b.dir = i
		
		b.global_position = p_pos 

		get_tree().current_scene.add_child(b)

func _process(delta):
	time += delta

	if time >= time_to_explode:
		explode()
		time = 0
