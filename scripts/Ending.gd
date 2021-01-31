extends Area2D

var animation

func _on_Ending_body_entered(body):
	$CollisionShape2D.disabled = true
	$Barrier/CollisionShape2D.set_deferred('disabled', true)
	
	$Tween.interpolate_property(get_parent().get_node('CanvasLayer/ColorRect'), 'color:a', 0, 1, 4, Tween.TRANS_LINEAR, 0)
	$Tween.start()

func _on_Tween_tween_completed(object, key):
	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene('res://scenes/Menu.tscn')
