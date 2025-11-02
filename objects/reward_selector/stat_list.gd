extends Resource
class_name StatRewardList

@export var list : Array[StatReward]

var queue : Array[StatReward] 

func _init():
    list = StatRewardParser.load_stat_rewards_from_file()


func shuffle() -> void:
    queue.clear()
    for i in list:
        queue.append(i)
    queue.shuffle()

func get_item() -> StatReward:
    
    if queue.size() == 0:
        shuffle()
    
    return queue.pop_back()