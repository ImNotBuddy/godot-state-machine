extends CharacterBody2D

@export var movement_speed: float = 150.0

@export var jump_height: float
@export var jump_time_to_peak: float
@export var jump_time_to_descent: float

@onready var jump_velocity: float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity: float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity: float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

@onready var state_machine: StateMachine = $StateMachine
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	state_machine.init(self, animator)

func _unhandled_input(event: InputEvent):
	state_machine.process_input(event)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
