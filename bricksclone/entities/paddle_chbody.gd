extends CharacterBody2D

@export var width_scale: float = 1.0
@export var max_speed: float = 1000.0
@export var acceleration: float = 100.0
@export var bounce_type: G_Const.BounceType = G_Const.BounceType.DIRECT

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = velocity.x + direction * acceleration * delta
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration * delta)
	velocity.x = clamp(velocity.x, max_speed * -1.0, max_speed)
	#print(direction)
	#print(velocity.x)

	move_and_slide()
