extends Node2D
class_name AirStriker

const air_strike : PackedScene = preload("res://assets/prefabs/items/air_strike.tscn")
@export var spawn_radius : float = 700

@export var every_x_seconds : float = 1

var time = 0

func _ready():
    time = every_x_seconds

func _process(delta):
    time -= delta
    if time <= 0:
        shoot() 
        time = every_x_seconds

func shoot() -> void:
    var instance : AirStrike= air_strike.instantiate()

    var r = randf_range(-spawn_radius,spawn_radius)
    instance.global_position = Vector2(sin(r),cos(r))*spawn_radius

    get_tree().current_scene.add_child(instance)