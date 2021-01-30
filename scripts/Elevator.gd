extends Node2D


export var height = 1024
export var at_top = true
export var speed = 100

var dy = 0




# Called when the node enters the scene tree for the first time.
func _ready():
	if at_top:
		$Floor.position = Vector2(0, 0)
		dy = -speed
	else:
		$Floor.position = Vector2(0, height)
		dy = speed

func toggle():
	dy = -dy


func _input(event):
	if Input.is_action_just_pressed("toggle_elevator"):
		toggle()

func _physics_process(delta):
	$Floor.position.y = clamp($Floor.position.y + delta * dy, 0, height)

