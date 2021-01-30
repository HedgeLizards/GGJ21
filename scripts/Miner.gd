extends KinematicBody2D

export var GRAVITY = 700
export var speed = 200
export var jump_speed = 450
export var jump_in_air = false
var vel = Vector2()
var active = true
var is_player = true

func _physics_process(delta):
	if active:
		var input_movement = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
		
		if input_movement < 0:
			$Sprite.flip_h = true
			$Hand.position.x = -abs($Hand.position.x)
		if input_movement > 0:
			$Sprite.flip_h = false
			$Hand.position.x = abs($Hand.position.x)
		
		if input_movement != 0 && is_on_floor():
			$Sprite.playing = true
		else:
			$Sprite.playing = false
			$Sprite.frame = 0
		
		vel.x = input_movement*speed
	else:
		vel.x = 0
	
	vel.y += delta * GRAVITY
	if is_on_floor():
		if Input.is_action_just_pressed("up") and active:
			vel.y = -jump_speed
	
	vel = self.move_and_slide(vel, Vector2.UP)
