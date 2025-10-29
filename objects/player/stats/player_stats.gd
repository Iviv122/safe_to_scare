extends Node 
class_name PlayerStats

var health : float = 3 
var speed : float = 450 
var damage : float = 450 

signal updated() 
signal died()

func deal_damage(a : float) -> void:
    health -= a

    if health <= 0:
        health = 0
        die() 

    updated.emit()

func die() -> void:
    died.emit()