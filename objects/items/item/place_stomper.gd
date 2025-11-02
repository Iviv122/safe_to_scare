extends Item
class_name PlaceStomper 

const stomper : PackedScene = preload("res://assets/prefabs/items/stomper.tscn")

func spawn(a : Node2D) -> void:
	print("Spawn stomper")
	a.get_tree().current_scene.add_child(stomper.instantiate())

func pick_up(_self : Node2D) -> void:
	spawn(_self)

func _to_string() -> String:
	return "Place stomper in the center"