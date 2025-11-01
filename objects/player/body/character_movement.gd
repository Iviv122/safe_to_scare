extends CharacterBody2D 
class_name CharacterMovement

@export var character_pos : PlayerNode

var direction : Vector2 = Vector2(0,0)

func _ready():
	character_pos.player_node = self

func _physics_process(_delta: float) -> void:
	if GameStateInstance.state == GameState.State.Selecting:
		return


	direction = Vector2.ZERO 

	if Input.is_action_pressed('w'): 
		direction.y -=1
	if Input.is_action_pressed('s'): 
		direction.y +=1
	if Input.is_action_pressed('d'): 
		direction.x +=1
	if Input.is_action_pressed('a'): 
		direction.x -=1

	if direction:
		# deacc
		velocity = velocity.move_toward(direction.normalized() * PlayerStatsInstance.speed,PlayerStatsInstance.speed/2)
	else:
		# deacc
		velocity = velocity.move_toward(velocity/2,PlayerStatsInstance.speed/5)

	move_and_slide()