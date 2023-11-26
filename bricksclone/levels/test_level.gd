extends Node2D

@onready var ball = $ball_chbody
@onready var has_started: bool = false


func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("Starting game")
		ball.velocity = Vector2(0, -100)
		has_started = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
