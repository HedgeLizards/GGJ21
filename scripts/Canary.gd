extends KinematicBody2D

export var GRAVITY = 300
export var fly_speed = 300
export var walk_speed = 100
export var flap_speed = 250
export var max_fall_speed = 200
var active = false
var vel = Vector2()
var is_player = true
var dir = 1

func _physics_process(delta):
	
	var control = int(Input.is_action_pressed('right')) - int(Input.is_action_pressed('left'))
	if control != 0 and active:
		dir = control
	if is_on_floor():
		if active:
			vel.x = control * walk_speed
		else:
			vel.x = 0
	else:
		vel.x = dir * fly_speed
	
	
	
	if Input.is_action_just_pressed('up') and active:
		vel.y = -flap_speed
	
	move_and_slide(vel, Vector2.UP)
	
	if is_on_ceiling():
		vel.y = 5
	
	vel.y = min(vel.y + GRAVITY * delta, max_fall_speed)
	
	if is_on_floor():
		$Label.text = 'IDLE'
	else:
		$Label.text = 'FLAP' if vel.y < 0 else 'FALL'
