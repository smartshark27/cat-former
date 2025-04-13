extends CharacterBody2D


const SPEED := 300.0
const JUMP_VELOCITY := -500.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	_direct()
	_animate(direction)

	move_and_slide()


func _direct():
	# Flip node on X axis based on walk direction
	# See https://www.reddit.com/r/godot/comments/191xke2/why_does_function_move_and_slide_break_scalex/
	# for why this is so unintuitive
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		scale.y = -1
		set_rotation(179.07)
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		scale.y = 1
		set_rotation(0)


func _animate(direction: float):
	# Animate the player
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		# Jump
		$AnimatedSprite2D.play("jump")
	elif not is_on_floor() and velocity.y > 0 and velocity.y < 10:
		# Fall
		$AnimatedSprite2D.play("fall")
	elif is_on_floor() and direction:
		# Walk
		$AnimatedSprite2D.play("walk")
	elif is_on_floor():
		# Stop
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.stop()
