extends Node2D


export var height = 672
export var at_top = false
export var speed = 100

var dy = 0
var running = false




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
	running = true
	playsound()


func _input(event):
	if Input.is_action_just_pressed("toggle_elevator"):
		toggle()

func _physics_process(delta):
	var last_y = $Floor.position.y
	$Floor.position.y = clamp($Floor.position.y + delta * dy, 0, height)
	running = $Floor.position.y != last_y
	playsound()

func playsound():
	if running and not $Floor/Noise.playing:
		$Floor/Noise.play()
	elif not running and $Floor/Noise.playing:
		$Floor/Noise.stop()

