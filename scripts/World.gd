extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var is_canary = false


# Called when the node enters the scene tree for the first time.
func _ready():
	var factor = 1 / OS.get_screen_scale()
	
	$Miner/Camera.zoom = Vector2(factor, factor)
	$Miner/Camera.light = $Canary/Light

func activate_player():
	if is_canary:
		$Miner/Sprite.playing = false
		$Miner/Sprite.frame = 0
		
		$Canary.active = true
		$Miner.active = false
		$Miner/Camera.move_to($Canary)
	else:
		$Canary.active = false
		$Miner.active = true
		$Canary/Camera.move_to($Miner)


func _input(event):
	if Input.is_action_just_pressed("switch"):
		self.is_canary = not is_canary
		self.activate_player()


