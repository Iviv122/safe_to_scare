extends SelectCard
class_name SelectCurse

var curse : Curse
func _pressed() -> void:
    curse.apply()