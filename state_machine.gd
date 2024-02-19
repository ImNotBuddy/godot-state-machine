extends Node
class_name StateMachine

@export var initial_state: State
var current_state: State

func init(character: CharacterBody2D, animator: AnimatedSprite2D) -> void:
	for child in get_children():
		if not child is State:
			continue
		
		child.state_changed.connect(change_state)
		child.character = character
		child.animator = animator
		
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func change_state(new_state: State):
	if current_state:
		current_state.exit()
		
	new_state.enter()
	current_state = new_state

func process_input(event: InputEvent) -> void:
	if current_state:
		current_state.process_input(event)

func process_frame(delta: float):
	if current_state:
		current_state.process_frame(delta)
	
func process_physics(delta: float) -> void:
	if current_state:
		current_state.process_physics(delta)
