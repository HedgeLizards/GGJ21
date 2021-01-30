extends Light2D


export var swing = 10
export var swing_time = 3
export var d_energy = 0.8
export var avg_energy = 1.0
export var avg_attraction = 0.1
export var min_energy = 0.6
export var max_energy = 1.8
var t = 0



func _process(delta):
	t += delta
	position.x = sin(t * (2*PI) / swing_time) * swing + rand_range(-1.0, 1.0)
	position.y = -sin((t*2) * (2*PI) / swing_time) * swing + rand_range(-1.0, 1.0)
	energy += delta * ((1-avg_attraction) * rand_range(-d_energy, d_energy) + avg_attraction * (avg_energy - energy))
	energy = clamp(energy, min_energy, max_energy)