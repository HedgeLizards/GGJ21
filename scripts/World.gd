extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var is_canary = false


# Called when the node enters the scene tree for the first time.
func _ready():
	var factor = 72.0 / OS.get_screen_dpi()
	
	$Miner/Camera.zoom = Vector2(factor, factor)
	$Canary/Camera.zoom = Vector2(factor, factor)
	
	self.activate_player()

func activate_player():
	if is_canary:
		$Canary.active = true
		$Miner.active = false
		$Canary/Camera.current = true
		$Miner/Camera.current = false
		$Canary/Light.visible = true
	else:
		$Canary.active = false
		$Miner.active = true
		$Canary/Camera.current = false
		$Miner/Camera.current = true
		$Canary/Light.visible = false


func _input(event):
	if Input.is_action_just_pressed("switch"):
		self.is_canary = not is_canary
		self.activate_player()


