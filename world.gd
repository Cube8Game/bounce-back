extends Node2D

var counter = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	counter += delta
	if counter < 1.0:
		return
	counter = 0.0
	var enemy = preload("uid://b3phs1ghnfvjt").instantiate()
	add_child(enemy)
