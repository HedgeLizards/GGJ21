extends Control

func _ready():
	var factor = OS.get_screen_scale()
	
	for child in get_children():
		child.rect_scale *= factor

	$Logo.rect_position += Vector2(25, -25) * factor
	$Audio.rect_position += Vector2(-25, -25) * factor

func _on_Audio_mouse_entered():
	$Audio.modulate = Color(1.2, 1.2, 1.2)

func _on_Audio_mouse_exited():
	$Audio.modulate = Color(1, 1, 1)

func _on_Audio_toggled(button_pressed):
	AudioServer.set_bus_mute(0, button_pressed)

func _on_Play_mouse_entered():
	$VBoxContainer/Play.modulate = Color(1.2, 1.2, 1.2)

func _on_Play_mouse_exited():
	$VBoxContainer/Play.modulate = Color(1, 1, 1)

func _on_Play_pressed():
	get_tree().change_scene_to(preload('res://scenes/World.tscn'))

func _on_Exit_mouse_entered():
	$VBoxContainer/Exit.modulate = Color(1.2, 1.2, 1.2)

func _on_Exit_mouse_exited():
	$VBoxContainer/Exit.modulate = Color(1, 1, 1)

func _on_Exit_pressed():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed('interact'):
		_on_Play_pressed()
	elif event.is_action_pressed('exit'):
		_on_Exit_pressed()
