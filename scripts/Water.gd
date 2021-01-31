tool
extends StaticBody2D

export(bool) var flowing = true
export(Vector2) var size = Vector2(96, 384) setget set_size
export(Color, RGB) var color = Color(0, 0.25, 0.5) setget set_color

func _ready():
	if !Engine.is_editor_hint() && !flowing:
		$CollisionShape2D.disabled = true
		
		scale.x = 0

func set_size(value):
	size = value
	
	$CollisionShape2D.shape = RectangleShape2D.new()
	$CollisionShape2D.shape.extents = size / 2
	$CollisionShape2D.position.y = size.y / 2
	
	$ColorRect.rect_position.x = -size.x / 2
	$ColorRect.rect_size = size
	
	$Particles2D.process_material = $Particles2D.process_material.duplicate()
	$Particles2D.process_material.emission_box_extents.x = size.x / 2
	$Particles2D.position.y = size.y - $Particles2D.process_material.scale / 2

func set_color(value):
	color = value
	
	$ColorRect.material = $ColorRect.material.duplicate()
	$ColorRect.material.set_shader_param('color', Color(color.r, color.g, color.b, 0.9))
	
	$Particles2D.process_material = $Particles2D.process_material.duplicate(true)
	$Particles2D.process_material.color_ramp.gradient.colors = [color, Color(color.r, color.g, color.b, 0.0)]
