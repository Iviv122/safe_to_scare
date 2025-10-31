extends Node
class_name Inventory

@export var weapon : Weapon
@export var player_node : PlayerNode

var reload : float = 0 

func shoot() -> void:
	if reload <= 0:
		weapon.shoot(player_node.player_node)
		reload = weapon.reload_time

func _process(delta):

	if Input.is_action_pressed('shoot'):
		shoot()

	reload -= delta*PlayerStatsInstance.reload_speed
