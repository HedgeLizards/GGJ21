extends Control

func _on_Audio_mouse_entered():
	$Audio.modulate = Color(1.5, 1.5, 1.5)

func _on_Audio_mouse_exited():
	$Audio.modulate = Color(1, 1, 1)

func _on_Audio_toggled(button_pressed):
	AudioServer.set_bus_mute(0, button_pressed)

func _on_Start_mouse_entered():
	$Start.modulate = Color(1.5, 1.5, 1.5)

func _on_Start_mouse_exited():
	$Start.modulate = Color(1, 1, 1)

func _on_Start_pressed():
	get_tree().change_scene_to(preload('res://scenes/World.tscn'))

func _on_Exit_mouse_entered():
	$Exit.modulate = Color(1.5, 1.5, 1.5)

func _on_Exit_mouse_exited():
	$Exit.modulate = Color(1, 1, 1)

func _on_Exit_pressed():
	get_tree().quit()
