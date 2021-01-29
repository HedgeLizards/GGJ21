extends KinematicBody2D

export var GRAVITY = 9.81 * 5
export var speed = 25
export var jump_speed = 50
export var jump_in_air = true
var vel = Vector2()

# adapted from 3d thing

func _physics_process(delta):
	var input_movement = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	vel.x = input_movement*speed
	
	vel.y += delta * GRAVITY
	if is_on_floor() or jump_in_air:
		if Input.is_action_just_pressed("up"):
			vel.y = -jump_speed
	
	var oldvel = vel
	vel = self.move_and_slide(vel, Vector2(0, 1), true, 4, deg2rad(60))
	
	

