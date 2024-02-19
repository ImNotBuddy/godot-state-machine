extends State
class_name PlayerIdle

@export var move_state: State
@export var fall_state: State
@export var jump_state: State

func enter() -> void:
	super()
	character.velocity = Vector2.ZERO
	animator.play("idle")

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
	
	if move_direction:
		state_changed.emit(move_state)
		return
		
	character.move_and_slide()
