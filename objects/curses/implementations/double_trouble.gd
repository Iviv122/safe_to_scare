extends Curse
class_name DoubleTrouble

var spawner_node : EnemySpawnerNode = preload("res://assets/globals/spawner_node.tres")

func apply() -> void:
	spawner_node.node.spawn_rate *= 2
