extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -400.0

const DISK = preload("uid://dlyahekjt0kqg")

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	if direction and Input.is_action_just_pressed("shoot"):
		var triangle = DISK.instantiate()
		triangle.throw_direction = direction
		triangle.position = position
		add_sibling(triangle)
	move_and_slide()
