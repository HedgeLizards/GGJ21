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

func _ready():
	$Light.texture_scale = 0

func _physics_process(delta):
	
	var control = int(Input.is_action_just_pressed('right')) - int(Input.is_action_just_pressed('left'))
	if control != 0 and active:
		dir = control
	$Sprite.flip_h = (dir < 0)
	if is_on_floor():
		if active and control != 0:
			vel.y = -100
			vel.x = control * fly_speed
		else:
			vel.x = 0
	else:
		vel.x = dir * fly_speed
	
	$Sprite.playing = vel.x != 0
	
	
	
	if Input.is_action_just_pressed('up') and active:
		vel.y = -flap_speed
	
	var dvel = move_and_slide(vel, Vector2.UP)
	
	if is_on_ceiling():
		vel.y = 5
	if is_on_wall():
		dir = -dir
	
	vel.y = min(vel.y + GRAVITY * delta, max_fall_speed)
	
