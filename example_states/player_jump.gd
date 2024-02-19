extends State
class_name PlayerJump

@export var idle_state: State
@export var move_state: State
@export var fall_state: State

func enter() -> void:
	super()
	character.velocity.y = character.jump_velocity

func process_physics(_delta: float) -> void:
	character.velocity.y += character.jump_gravity * _delta
	
	if character.velocity.y > 0.0:
		state_changed.emit(fall_state)
		return
		
	var move_direction = Input.get_axis("move_left", "move_right")
	
	if move_direction:
		animator.flip_h = move_direction < 0.0
	
	character.velocity.x = move_direction * character.movement_speed
	character.move_and_slide()
