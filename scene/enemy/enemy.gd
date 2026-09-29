extends Node2D

var base_angle := deg_to_rad(180)
const TAMA_02 = preload("uid://ghlyryc5xreq")

func shoot():
	var tama = TAMA_02.instantiate()
	tama.position = global_position
	tama.rotation = global_rotation + base_angle
	get_tree().current_scene.add_child(tama)
	
func _on_timer_timeout() -> void:
	shoot()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
