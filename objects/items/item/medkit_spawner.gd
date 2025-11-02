extends Item
class_name MedKitSpawner 

func spawn(a : Node2D) -> void:
	print("Med kit spawner")
	a.get_tree().current_scene.add_child(MedKiter.new())

func pick_up(_self : Node2D) -> void:
	spawn(_self)

func _to_string() -> String:
	return "Spawn medkit every 5 seconds"