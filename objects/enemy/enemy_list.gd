extends Resource
class_name EnemyList 

var list : Array[PackedScene]

func _init() -> void:

	var path = "res://assets/prefabs/enemies/"
	var enemies = DirAccess.open(path).get_files()
	
	for i in enemies:
		list.append(load(path + i))

	print("loaded enemies")
