extends AudioStreamPlayer2D


export (Array, AudioStream) var sounds

func play_something():
	if playing:
		return
	self.stream = sounds[randi() % len(sounds)]
	
	play()

