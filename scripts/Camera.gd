extends Camera2D

var light
var origin
var animation

func move_to(node):
	origin = global_position
	
	get_parent().remove_child(self)
	node.add_child(self)
	
	$Tween.interpolate_property(self, 'animation', 1, 0, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Tween_tween_step(object, key, elapsed, value):
	offset = animation * (origin - global_position)
	
	light.texture_scale = (1 - animation if get_parent().name == 'Canary' else animation) * 2
