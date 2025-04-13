extends Node2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("meow"):
		var meows := [$HappyMeow, $AngryMeow]
		for meow in meows:
			meow.stop()
		meows.pick_random().play()
