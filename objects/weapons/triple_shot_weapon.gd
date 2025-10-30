extends Weapon
class_name TripleShotWeapon

@export var angle : float = 15
@export var projectiles : int = 3

func shoot(_self : Node2D) -> void:
	var shots = floor(projectiles)/2
	for i in range(-shots,shots+1):
		var bul : Projectile = projectile.instantiate()
		var mpos = _self.get_global_mouse_position()
		var mdir = (mpos-_self.global_position).normalized().rotated(i*deg_to_rad(angle))

		bul.global_position = _self.global_position + mdir*32

		if mdir == Vector2.ZERO:
			var r = randf_range(-3,3)
			bul.dir = Vector2(sin(r),cos(r)) 
		else:
			bul.dir = mdir

		_self.get_tree().current_scene.add_child(bul)
