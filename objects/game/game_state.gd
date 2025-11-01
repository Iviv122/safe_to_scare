extends Node 
class_name GameState

signal updated()

var state : State = State.Tutorial

func set_state(new_state : State) -> void:
    state = new_state
    updated.emit()

enum State{
    Tutorial,
    Playing,
    Selecting,
}