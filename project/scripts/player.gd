extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Flip node on X axis based on walk direction
	# See https://www.reddit.com/r/godot/comments/191xke2/why_does_function_move_and_slide_break_scalex/
	# for why this is so unintuitive
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		scale.y = -1
		set_rotation(179.07)
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		scale.y = 1
		set_rotation(0)

	# Play walk animation if walking on ground
	if direction and is_on_floor():
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	move_and_slide()
