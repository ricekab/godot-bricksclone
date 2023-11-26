extends Node2D

@onready var load_test_level_btn = $mainmenu_root_ui/load_test_level_btn


# Called when the node enters the scene tree for the first time.
func _ready():
	load_test_level_btn.pressed.connect(self._load_test_level_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _load_test_level_pressed():
	G_LevelLoader.load_level_by_resource_path("res://levels/test_level.tscn")
