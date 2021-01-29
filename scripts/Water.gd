tool
extends StaticBody2D

export(Vector2) var size = Vector2(40, 120) setget set_size

func set_size(value):
	size = value
	
	$CollisionShape2D.shape = RectangleShape2D.new()
	$CollisionShape2D.shape.extents = size / 2
	$CollisionShape2D.position = size / 2
	$ColorRect.rect_size = size
