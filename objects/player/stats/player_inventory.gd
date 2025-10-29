extends Node
class_name Inventory

@export var weapon : Weapon
@export var player_node : PlayerNode

func _input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		shoot()

func shoot() -> void:
	weapon.shoot(player_node.player_node)