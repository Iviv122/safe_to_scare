extends CharacterBody2D 
class_name CharacterMovement

@export var character_pos : PlayerNode

@export var speed : float

var direction : Vector2 = Vector2(0,0)

func _ready():
	character_pos.player_node = self

func _physics_process(_delta: float) -> void:

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
		velocity = direction.normalized() * speed 
	else:

		velocity = velocity.move_toward(Vector2.ZERO,speed)

	move_and_slide()