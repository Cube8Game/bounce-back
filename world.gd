extends Node2D

var counter = 0.0
@onready var timer: Timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	counter += delta
	if counter < 1.0:
		return
	counter = 0.0
	var enemy = preload("uid://b3phs1ghnfvjt").instantiate()
	add_child(enemy)


func _on_enemy_2_die() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
