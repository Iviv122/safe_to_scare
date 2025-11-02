extends Item
class_name SelfExplodeItem

func spawn(a : Node2D) -> void:
	print("self exploder")
	a.get_tree().current_scene.add_child(SelfExploder.new())

func pick_up(_self : Node2D) -> void:
	spawn(_self)

func _to_string() -> String:
	return "Shoot bullets in all directions every 2 seconds"