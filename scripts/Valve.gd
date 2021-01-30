extends Area2D

export(NodePath) var water

onready var collision_shape_2d = get_node('%s/CollisionShape2D' % water)
onready var color_rect = get_node('%s/ColorRect' % water)
onready var narrowness = color_rect.material.get_shader_param('narrowness')
onready var particles_2d = get_node('%s/Particles2D' % water)

var activator = null
var open = true
var animation = 0

func _on_Valve_body_entered(body):
	activator = body

func _on_Valve_body_exited(body):
	activator = null

func _unhandled_input(event):
	if activator && activator.active && event.is_action_pressed('interact'):
		collision_shape_2d.disabled = open
		
		open = !open
		
		particles_2d.emitting = open
		
		if open:
			$Tween.interpolate_property(self, 'animation', null, 0, animation * 2, Tween.EASE_IN_OUT, Tween.TRANS_SINE)
		else:
			$Tween.interpolate_property(self, 'animation', null, 1, (1 - animation) * 2, Tween.EASE_IN_OUT, Tween.TRANS_SINE)
		
		$Tween.start()

func _on_Tween_tween_step(object, key, elapsed, value):
	rotation_degrees = animation * 270
	
	color_rect.material.set_shader_param('narrowness', narrowness + (0.5 - narrowness) * animation)
