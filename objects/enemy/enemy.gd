extends Area2D 
class_name Enemy

@export var character_pos : CharacterPos
@export var health : float = 8
@export var speed : float = 515

signal damaged

func _ready() -> void:
	on_spawn()
	body_entered.connect(entered)

func on_spawn() -> void:
	pass

func entered(other : Node2D) -> void:
	if other is CharacterMovement:
		player_contact() 

func player_contact() -> void:
	queue_free()

func damage(a : float) -> void:
	health -= a
	
	if health <= 0:
		die()

	damaged.emit()

func _process(delta):
	global_position += (character_pos.player_node.global_position - global_position).normalized()*delta*speed

func die () -> void:
	queue_free()
