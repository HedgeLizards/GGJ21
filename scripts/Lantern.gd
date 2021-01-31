extends Light2D


export var swing = 6
export var swing_time = 3
export var rotation_factor = 0.05
export var rotation_time = 3

export var d_energy = 0.6
export var avg_energy = 1.0
export var avg_attraction = 0.02
export var min_energy = 0.5
export var max_energy = 1.5
var t = 0


enum {OFF, LIGHTING, ON}
var alight = OFF


func _ready():
	texture_scale = 0
	lightup()

func _process(delta):
	t += delta
#	if alight != ON:
#		return
#	for body in $Area.get_overlapping_bodies():
#		if body.get("flowing"):
#			energy -= delta / 0.5
#			return
#	if energy <= 0.05:
#		alight = OFF
#		lightup()
#	texture_scale = energy / avg_energy
	position.x = sin(t * (2*PI) / swing_time) * swing 
	position.y = -sin((t*2) * (2*PI) / swing_time) * swing 
	energy += delta * ((1-avg_attraction) * rand_range(-d_energy, d_energy) + avg_attraction * (avg_energy - energy))
	energy = clamp(energy, min_energy, max_energy)
	rotation = sin(1+(t*2) * (2*PI) / swing_time) * rotation_factor


func lightup():
	if alight == OFF:
		$LighterSound.play()
		$PreLight.start()
	
func start_light():
	$Tween.interpolate_property(self, 'energy', 0, avg_energy, 2, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.interpolate_property(self, 'texture_scale', 0, 1, 2, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Tween_tween_all_completed():
	alight = ON
