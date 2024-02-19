extends State
class_name PlayerFall

@export var idle_state: State
@export var move_state: State

func enter() -> void:
	super()

func process_physics(_delta: float) -> void:
	character.velocity.y += character.fall_gravity * _delta
		
	var move_direction = Input.get_axis("move_left", "move_right")
	
	if move_direction:
		animator.flip_h = move_direction < 0.0
	
	character.velocity.x = move_direction * character.movement_speed
	character.move_and_slide()
	
	if character.is_on_floor():
		if move_direction:
			state_changed.emit(move_state)
			return
		else:
			state_changed.emit(idle_state)
			return
