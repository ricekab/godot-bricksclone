extends Node2D

@onready var audio_sound_pool = $audio_sound_pool
@onready var level_container = $level_container
@onready var test_ui = $test_ui

var generic_sound = preload("res://sounds/hit_generic.wav")

var elapsed: float = 0.0
var plays: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	test_ui.load_test_level_btn.pressed.connect(self._load_test_level_pressed)
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _load_test_level_pressed():
	var test_level = preload("res://levels/test_level.tscn")
	$level_container.add_child(test_level.instantiate())
