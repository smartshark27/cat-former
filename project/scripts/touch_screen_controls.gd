extends Node2D


func _on_left_button_pressed() -> void:
	Input.action_press("left")


func _on_left_button_released() -> void:
	Input.action_release("left")


func _on_right_button_pressed() -> void:
	Input.action_press("right")


func _on_right_button_released() -> void:
	Input.action_release("right")


func _on_jump_button_pressed() -> void:
	Input.action_press("jump")


func _on_jump_button_released() -> void:
	Input.action_release("jump")
