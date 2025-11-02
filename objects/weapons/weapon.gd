extends Resource
class_name Weapon

# time/reload_time
@export var name : String
@export var reload_time : float = 1
@export var projectile : PackedScene

func shoot(_self : Node2D) -> void:
	var bul : Projectile = projectile.instantiate()
	var mpos = _self.get_global_mouse_position()
	var mdir = (mpos-_self.global_position).normalized()

	bul.global_position = _self.global_position + mdir*32

	if mdir == Vector2.ZERO:
		var r = randf_range(-3,3)
		bul.dir = Vector2(sin(r),cos(r)) 
	else:
		bul.dir = mdir

	_self.get_tree().current_scene.add_child(bul)
