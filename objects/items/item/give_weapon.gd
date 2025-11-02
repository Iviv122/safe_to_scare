extends Item
class_name GiveWeapon 

@export var list : Array[Weapon] 
var weapon

func pick_up(_self : Node2D) -> void:
    InventoryInstance.give_weapon(weapon)

func reroll() -> void:
    weapon = list.pick_random()
    if weapon == InventoryInstance.weapon:
        reroll()

func _to_string() -> String:
    reroll()
    return "Use " + weapon.name