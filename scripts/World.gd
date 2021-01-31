extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var is_canary = false
var can_switch = false


# Called when the node enters the scene tree for the first time.
func _ready():
	var factor = 1 / OS.get_screen_scale()
	
	$Miner/Camera.zoom = Vector2(factor, factor)
	$Miner/Camera.light = $Canary/Light

func activate_player():
	if is_canary:
		$Miner/Sprite.animation = "idle"
		
		$Canary.active = true
		$Miner.active = false
		$Miner/Camera.move_to($Canary)
	else:
		$Canary.active = false
		$Miner.active = true
		$Canary/Camera.move_to($Miner)


func _input(event):
	if Input.is_action_just_pressed("switch") and can_switch:
		self.is_canary = not is_canary
		self.activate_player()




func _on_CanaryDetection_body_entered(body):
	if body.get("is_miner"):
		can_switch = true

