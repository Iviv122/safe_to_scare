extends Area2D
class_name MedKit 

@export var appear_particle : GPUParticles2D 

func _ready():
	body_entered.connect(heal)
	appear_particle.restart()

func heal(a : Node2D) -> void:
	if a is CharacterMovement:
		PlayerStatsInstance.heal()
		queue_free()
