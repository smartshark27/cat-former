extends Node2D


func _on_left_button_button_down() -> void:
	print("left down")
	Input.action_press("left")


func _on_left_button_button_up() -> void:
	print("left up")
	Input.action_release("left")


func _on_right_button_button_down() -> void:
	print("right down")
	Input.action_press("right")


func _on_right_button_button_up() -> void:
	print("right up")
	Input.action_release("right")


func _on_jump_button_button_down() -> void:
	print("jump down")
	Input.action_press("jump")


func _on_jump_button_button_up() -> void:
	print("jump up")
	Input.action_release("jump")
