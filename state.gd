extends Node
class_name State

signal state_changed

var character: CharacterBody2D
var animator: AnimatedSprite2D

func enter() -> void:
	#print("[State] Entered " + self.name)
	pass
	
func exit() -> void:
	#print("[State] Exited " + self.name)
	pass
	
func process_input(_event: InputEvent) -> void:
	pass
	
func process_frame(_delta: float) -> void:
	pass
	
func process_physics(_delta: float) -> void:
	pass
