extends CharacterBody2D


const SPEED = 500.0

@export var throw_direction: Vector2
@export var max_ricochet: int = 3
@export var player: CharacterBody2D
var bounces = 0

func _ready() -> void:
	velocity = throw_direction.normalized() * SPEED

func _physics_process(_delta: float) -> void:
	if is_on_wall():
		bounces += 1
		if bounces >= max_ricochet:
			final_bounce()
		velocity = velocity.bounce(get_wall_normal())
	move_and_slide()

func final_bounce():
	queue_free()
