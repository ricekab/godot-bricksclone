extends Node
## Manages a pool of AudioStreamPlayer instances to play sound with.

@export var initial_num_of_streams: int = 1
var _audio_stream_pool: Array[AudioStreamPlayer] = []


# Called when the node enters the scene tree for the first time.
func _ready():
	for n in initial_num_of_streams:
		_create_audio_stream_player()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# TODO: Periodically clean unused players?
	pass


func play_sound(sound_resource: AudioStream):
	var player = _get_audio_stream_player()
	player.stream = sound_resource
	player.play()


## Get an available AudioStreamPlayer to play a sound on.
## If one does not exist, a new one is created.
func _get_audio_stream_player() -> AudioStreamPlayer:
	for player in _audio_stream_pool:
		if not player.playing:
			return player
	return _create_audio_stream_player()


func _create_audio_stream_player() -> AudioStreamPlayer:
	print("creating player ", _audio_stream_pool.size())
	var new_player = AudioStreamPlayer.new()
	_audio_stream_pool.append(new_player)
	add_child(new_player)
	return new_player
