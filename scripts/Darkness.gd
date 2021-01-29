extends Node2D

func _process(delta):
	update()

func _draw():
	draw_rect(Rect2(-get_canvas_transform().get_origin(), get_viewport_rect().size), Color.black)
