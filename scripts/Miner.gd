extends KinematicBody2D

export var GRAVITY = 700
export var speed = 250
export var jump_speed = 450
export var jump_in_air = false
var vel = Vector2()
var active = true
var is_player = true
var standing = true
var is_miner = true

var oldpos = Vector2()

func _ready():
	$Sprite.playing = true
	oldpos = position

func _physics_process(delta):
	if active:
		var input_movement = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
		
		if input_movement < 0 && !$Sprite.flip_h:
			$Sprite.flip_h = true
			$Tween.interpolate_property($Hand, 'position:x', null, -$Hand.position.x, 0.2, Tween.TRANS_SINE, Tween.EASE_OUT)
			$Tween.start()
		if input_movement > 0 && $Sprite.flip_h:
			$Sprite.flip_h = false
			$Tween.interpolate_property($Hand, 'position:x', null, -$Hand.position.x, 0.2, Tween.TRANS_SINE, Tween.EASE_OUT)
			$Tween.start()
		
		if input_movement != 0 && (is_on_floor() or standing):
			$Sprite.animation = "walk"
		elif (is_on_floor() or standing):
			$Sprite.animation = "idle"
		else:
			$Sprite.animation = "jump"
		
		vel.x = input_movement*speed
	else:
		vel.x = 0
	
	vel.y += delta * GRAVITY
#	if is_on_floor():
#		if Input.is_action_just_pressed("up") and active:
#			standing = false
#			vel.y = -jump_speed
	
	var dvel = self.move_and_slide(vel, Vector2(0, -1))
	vel = dvel
	
	if is_on_floor():
		standing = true
	elif position.y - oldpos.y > 0:
		standing = false
	oldpos = position

func _on_Sprite_frame_changed():
	if $Sprite.animation == 'walk' && ($Sprite.frame - 1) % 4 == 0:
		get_node('Step%d' % (randi() % 4)).play()
