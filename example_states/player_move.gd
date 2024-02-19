extends State
class_name PlayerMove

@export var idle_state: State
@export var fall_state: State
@export var jump_state: State

func enter() -> void:
	super()
	animator.play("move")

func process_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump"):
		state_changed.emit(jump_state)
		return

func process_physics(_delta: float) -> void:
	character.velocity.y += character.fall_gravity * _delta
	
	if not character.is_on_floor():
		state_changed.emit(fall_state)
		return
	
	var move_direction = Input.get_axis("move_left", "move_right")
	
	if not move_direction:
		state_changed.emit(idle_state)
		return
		
	if move_direction:
		animator.flip_h = move_direction < 0.0
		
	character.velocity.x = move_direction * character.movement_speed
	character.move_and_slide()
