extends Node2D




func _on_Timer_timeout():
	get_tree().change_scene_to(preload('res://scenes/World.tscn'))

