extends Area2D


signal on_pulled


func _input(event):
	if Input.is_action_just_pressed("interact") and not $PullAnimation.is_playing():
		for body in get_overlapping_bodies():
			if body.get("is_player") != null and body.active:
				emit_signal("on_pulled")
				$PullAnimation.play("pull_lever")
				break

