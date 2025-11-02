extends Resource
class_name EnemyList 

@export var list : Array[PackedScene]

func _init():
	var path = 'res://assets/prefabs/enemies/'
	var dir = DirAccess.open(path)

	for i in dir.get_files():
		var file_path = path + i

		if (file_path.get_extension() == "remap"):
			file_path = file_path.replace('.remap', '')

		var loaded = load(file_path)
		if !list.has(loaded):
			list.append(loaded)
			print(file_path)

	for i in list:
		print(i.resource_name)

func get_enemy() -> PackedScene:
	return list.pick_random()
