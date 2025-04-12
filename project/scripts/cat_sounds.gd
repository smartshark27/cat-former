extends Node2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("meow"):
		var meows: Array = [$HappyMeow, $AngryMeow]
		for meow: AudioStreamPlayer2D in meows:
			meow.stop()
		meows.pick_random().play()
