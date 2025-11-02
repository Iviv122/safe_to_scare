extends Button
class_name SelectCard

var init_pos : Vector2 = Vector2.ZERO 
var tween : Tween

func _ready():

	autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

	mouse_exited.connect(shrink)
	mouse_entered.connect(expand)

func expand() -> void:
	if tween:
		tween.kill()

	if init_pos == Vector2.ZERO:
		init_pos = position

	tween = create_tween()
	tween.tween_property(self,'position',init_pos + Vector2.UP*50,0.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BACK)

func shrink() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self,'position',init_pos,0.1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BACK)
