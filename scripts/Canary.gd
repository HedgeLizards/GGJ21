extends KinematicBody2D

var active = false
var vspeed = 0
var is_player = true

func _physics_process(delta):
	var hspeed = 0
	
	if Input.is_action_pressed('left') and active:
		hspeed -= 200
	if Input.is_action_pressed('right')and active:
		hspeed += 200
	
	if Input.is_action_just_pressed('up') and active:
		vspeed = -350
	
	move_and_slide(Vector2(hspeed, vspeed), Vector2.UP)
	
	if is_on_floor() || is_on_ceiling():
		vspeed = 5
	
	vspeed += 300 * delta
	
	if is_on_floor():
		$Label.text = 'IDLE'
	else:
		$Label.text = 'FLAP' if vspeed < 0 else 'FALL'
