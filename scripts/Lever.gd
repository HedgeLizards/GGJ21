extends Area2D


signal on_pulled


func _input(event):
	if Input.is_action_just_pressed("interact"):
		for body in get_overlapping_bodies():
			if body.get("is_player") != null and body.active:
				emit_signal("on_pulled")
				break

