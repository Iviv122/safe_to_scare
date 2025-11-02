extends SelectCard
class_name SelectCurse

var curse : Curse
func _pressed() -> void:
    print("hi")
    print(curse._to_string())