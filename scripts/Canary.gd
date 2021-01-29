extends KinematicBody2D

export var GRAVITY = 300
export var speed = 200
export var flap_speed = 350
var active = false
var vspeed = 0
var is_player = true

func _physics_process(delta):
	var hspeed = 0
	
	if Input.is_action_pressed('left') and active:
		hspeed -= speed
	if Input.is_action_pressed('right')and active:
		hspeed += speed
	
	if Input.is_action_just_pressed('up') and active:
		vspeed = -flap_speed
	
	move_and_slide(Vector2(hspeed, vspeed), Vector2.UP)
	
	if is_on_floor() || is_on_ceiling():
		vspeed = 5
	
	vspeed += GRAVITY * delta
	
	if is_on_floor():
		$Label.text = 'IDLE'
	else:
		$Label.text = 'FLAP' if vspeed < 0 else 'FALL'
