extends CharacterBody2D


const SPEED = 150.0

var vertical = false
var direction = 1.0
var counter = 0.0
var next = 1.0

func _physics_process(delta: float) -> void:
	counter += delta
	if counter > next or is_on_wall():
		counter = 0.0
		next = randf() * 0.5 + 0.5
		vertical = randf() > 0.5
		if randf() > 0.5:
			direction = 1.0
		else:
			direction = -1.0
	if vertical:
		velocity.y = direction * SPEED
		velocity.x = 0
	else:
		velocity.x = direction * SPEED
		velocity.y = 0
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	queue_free()
