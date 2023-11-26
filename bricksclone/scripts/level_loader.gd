extends Node

@onready var root_level_container = get_node("/root/root/level_container")

func load_level_by_resource_path(res_path: String):
	# res_path: Resource path to a level. Example: "res://levels/mainmenu_level.tscn"
	var level = load(res_path)
	for child in root_level_container.get_children():
		child.queue_free()
	root_level_container.add_child(level.instantiate())

func _ready():
	pass # Replace with function body.
