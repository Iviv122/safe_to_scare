extends Node 
class_name PlayerStats

@export var player_node : PlayerNode

var max_health : float = 3
var health : float = 3 
var speed : float = 450 

# modifier. Take item/weapon and multiply
var damage : float = 1 
var reload_speed : float = 1


var level : int = 1 
var expirience : float = 0
var expirience_req : float = 10

signal updated() 
signal damaged()
signal died()
signal lvl_up()

func add_stats(stats : StatReward) ->void:
    max_health += stats.max_health
    speed += stats.speed
    reload_speed += stats.reload_speed 
    damage += stats.damage

    health = max_health

    updated.emit()

func _ready():
    health = max_health

func gain_exp(a : float) -> void:

    expirience += a

    if expirience <= 0:
        expirience = 0

    if expirience >= expirience_req:
        level += 1
        expirience = 0
        lvl_up.emit()

    updated.emit()

func deal_damage(a : float) -> void:
    health -= a

    if health >= max_health:
        health = max_health
    if health <= 0:
        health = 0
        die() 
    damaged.emit()
    updated.emit()

func die() -> void:
    died.emit()