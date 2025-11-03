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
signal healed()
signal died()
signal lvl_up()

func restart() -> void:
    max_health= 3
    health = 3 
    speed = 450 

    damage= 1 
    reload_speed = 1

    level= 1 
    expirience = 0
    expirience_req = 10

func add_stats(stats : StatReward) ->void:
    max_health += stats.max_health
    speed += stats.speed
    reload_speed += stats.reload_speed 
    damage += stats.damage

    heal()

    updated.emit()

func _ready():

    add_to_group("restart")
    heal()

func heal() -> void:
    health = max_health
    healed.emit()
    updated.emit()

func gain_exp(a : float) -> void:

    expirience += a

    if expirience <= 0:
        expirience = 0

    if expirience >= expirience_req:
        level += 1
        expirience = 0
        expirience_req += expirience_req
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