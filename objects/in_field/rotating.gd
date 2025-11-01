extends Sprite2D 
class_name RotatingSprite

@export var speed : float = 1

func _physics_process(_delta):
    rotation_degrees += speed