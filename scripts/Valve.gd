extends Area2D

export(Array, NodePath) var waters

var water_nodes = []
var activator = null
var turned = false
var animation = 0

func _ready():
	for water in waters:
		water_nodes.push_back(get_node(water))

func _on_Valve_body_entered(body):
	activator = body

func _on_Valve_body_exited(body):
	activator = null

func _input(event):
	if activator && activator.active && event.is_action_pressed('interact'):
		for water_node in water_nodes:
			water_node.get_node('CollisionShape2D').disabled = water_node.flowing
			water_node.flowing = !water_node.flowing
			water_node.get_node('Particles2D').emitting = water_node.flowing
			
		turned = !turned
		
		$Tween.remove_all()
		
		if turned:
			$Tween.interpolate_property(self, 'animation', null, 1, (1 - animation) * 2, Tween.TRANS_LINEAR, 0)
		else:
			$Tween.interpolate_property(self, 'animation', null, 0, animation * 2, Tween.TRANS_LINEAR, 0)
		
		$Tween.start()
		$Noise.play()

func _on_Tween_tween_step(object, key, elapsed, value):
	for water_node in water_nodes:
		var size = animation if water_node.flowing == turned else 1 - animation
		water_node.scale.x = size
		var noise = water_node.get_node("Noise")
		if not noise.playing:
			noise.play()
		noise.volume_db = size * 40 - 40
		
	
	rotation_degrees = animation * 270


func _on_Tween_tween_all_completed():
	for water_node in water_nodes:
		var noise = water_node.get_node("Noise")
		if not noise.playing:
			noise.play()
		noise.stop()
