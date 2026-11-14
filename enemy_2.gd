extends CharacterBody2D


const SPEED = 150.0

var orientation = Vector2.RIGHT
var direction = 1.0
var counter = 0.0
var next = 1.0

func _physics_process(delta: float) -> void:
	counter += delta
	if counter > next or is_on_wall():
		counter = 0.0
		next = randf() * 0.5 + 0.5
		if randf() > 0.5:
			direction = 1.0
		else:
			direction = -1.0
	orientation = Vector2.from_angle(orientation.angle() + direction * PI * delta)
	if is_on_wall():
		orientation = orientation.bounce(get_wall_normal())
	velocity = orientation * SPEED
	move_and_slide()

signal die

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.queue_free()
		die.emit()
	queue_free()
