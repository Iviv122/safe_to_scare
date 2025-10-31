extends Projectile
class_name Bomb

@export var life_time: float = 1
@export var fly_distance: float = 300
@export var explosion_radius: float = 80

func explode() -> void:
	var space_state = get_world_2d().direct_space_state

	var circle_shape = CircleShape2D.new()
	circle_shape.radius = explosion_radius

	transform.origin = global_position

	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = circle_shape
	query.transform = global_transform
	query.collide_with_areas = true

	var result1 = space_state.intersect_shape(query)

	if result1.size() > 0:
		for i in result1:
			if i.collider is Enemy:
				i.collider.damage(PlayerStatsInstance.damage * damage_modifier)

	queue_free()

func set_speed(a : float) ->void:
	speed = a

func on_spawn() -> void:
	var tween := create_tween().set_parallel()
	
	tween.tween_property(self, "modulate", Color.RED, life_time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_method(set_speed,speed,0,life_time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)

	await get_tree().create_timer(life_time).timeout
	explode()

func on_collide() -> void:
	for i in result:
		if i.collider is Enemy:
			explode()
			break

func move() -> void:
	global_position += dir*speed
