extends Area2D 
class_name Enemy

@export var collision_shape : CollisionPolygon2D 
@export var character_pos : PlayerNode

var stats : EnemyStats = EnemyStats.new()
   
@export var sprite : Sprite2D

signal damaged

@export var occluder : LightOccluder2D

func _ready() -> void:
	on_spawn()
	body_entered.connect(entered)

	var oc = OccluderPolygon2D.new()
	oc.polygon = collision_shape.polygon

func insert_stats(stat_block : EnemyStats) -> void:
	stats = stat_block
	
	scale *= stats.size
	modulate = stats.color


func on_spawn() -> void:
	pass

func entered(other : Node2D) -> void:
	if other is CharacterMovement:
		player_contact() 

func player_contact() -> void:	
	PlayerStatsInstance.deal_damage(stats.contact_damage)
	queue_free()

func damage(a : float) -> void:
	stats.health -= a
	
	if stats.health <= 0:
		die()

	damaged.emit()

func _process(delta):
	global_position += (character_pos.player_node.global_position - global_position).normalized()*delta*stats.speed

func die () -> void:
	PlayerStatsInstance.gain_exp(stats.exp_death)
	queue_free()
