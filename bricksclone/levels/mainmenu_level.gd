extends Node2D

@onready var load_test_level_btn = $mainmenu_root_ui/load_test_level_btn


# Called when the node enters the scene tree for the first time.
func _ready():
	load_test_level_btn.pressed.connect(self._load_test_level_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _load_test_level_pressed():
	var test_level = preload("res://levels/test_level.tscn")
	var level_container = get_node("/root/root/level_container")
	level_container.add_child(test_level.instantiate())
