@tool
extends Node2D
class_name BrickField
# Helper class to createa field of bricks to assist level building


@export var brick_width: float = 5.0
@export var brick_height: float = 1.0
@export var brick_margin_row: float = 0.0
@export var brick_margin_column: float = 0.0

@export var row_count: int = 5
@export var bricks_per_row: int = 5
@export_range(0.0, 1.0) var row_offset: float = 0.0

var brick_scn = preload("res://entities/brick_stbody.tscn")

# TODO: Brick size (16px) is hard-coded. Can be read from scene instance?

# Called when the node enters the scene tree for the first time.
func _ready():
	print("hello init")
	
	if not Engine.is_editor_hint():
		# Create bricks
		for row in range(row_count):
			for column in range(bricks_per_row):
				_place_brick(row, column)

func _place_brick(row: int, column: int):
	var xpos = column * brick_width * 16 + column * brick_margin_row
	var ypos = row * brick_height * 16 + row * brick_margin_column
	var new_brick = brick_scn.instantiate()
	new_brick.position = Vector2(xpos, ypos)
	new_brick.scale = Vector2(brick_width, brick_height)
	add_child(new_brick)

# func _process(delta):
# 	print("hello")
# 	if Engine.is_editor_hint():
# 		# Show area where bricks are to be created?
# 		var width = brick_width * bricks_per_row
# 		var heigth = brick_height * row_count
# 		var rect = Rect2(position.x, position.y, width, heigth)
# 		draw_rect(rect, Color.RED)
# 		return

func _process(delta):
	if Engine.is_editor_hint():
		queue_redraw()


func _draw():
	if Engine.is_editor_hint():
		# Show area where bricks are to be created?
		#var brick = brick_scn.instantiate()
		var width = brick_width * bricks_per_row * 16
		var heigth = brick_height * row_count * 16
		var rect = Rect2(0, 0, width, heigth)
		draw_rect(rect, Color.RED)
		return
	
