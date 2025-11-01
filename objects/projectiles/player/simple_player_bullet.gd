extends Projectile
class_name SimplePlayerBullet

func on_collide() -> void:
	for i in result:
		if i.collider is Enemy:
			i.collider.damage(PlayerStatsInstance.damage * damage_modifier)
			var effect : GPUParticles2D = hit_effect.instantiate() 
			effect.global_position = global_position
			effect.emitting = true
			get_tree().current_scene.add_child(effect)
			queue_free()

func move() -> void:
	global_position += dir*speed
