extends Node 
class_name PlayerStats

var health : float = 3 

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