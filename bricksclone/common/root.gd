extends Node2D

@onready var audio_sound_pool = $audio_sound_pool
@onready var level_container = $level_container
@onready var test_ui = $test_ui

var generic_sound = preload("res://sounds/hit_generic.wav")

var elapsed: float = 0.0
var plays: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	var mainmenu_level = preload("res://levels/mainmenu_level.tscn")
	level_container.add_child(mainmenu_level.instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


