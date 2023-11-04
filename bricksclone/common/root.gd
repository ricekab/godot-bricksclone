extends Node2D

@onready var audio_sound_pool = $audio_sound_pool
var generic_sound = preload("res://sounds/hit_generic.wav")

var elapsed: float = 0.0
var plays : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed += delta
	if elapsed > 5.0:
		print("Play sound now ", plays)
		audio_sound_pool.play_sound(generic_sound)
		plays += 1
		if plays > 3:
			elapsed = 0.0
