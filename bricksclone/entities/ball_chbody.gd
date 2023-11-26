extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#@export var vel:Vector2 = Vector2(0, 0)
@export var bounce_speed_scale = 1.0  # Vel increase on each bounce.

const MAX_SPEED = 450.0

func _physics_process(delta: float):
	var collisionInfo :KinematicCollision2D = move_and_collide(velocity * delta)
	if collisionInfo:
		if collisionInfo.get_collider().name.contains("paddle_"):
		# if collisionInfo.collider.name == "paddle_chbody":
			var towards = self.position
			var from = collisionInfo.get_collider().position
			var direction_vector: Vector2 =  towards - from
			direction_vector = direction_vector.normalized()
			velocity = direction_vector * velocity.length()
		else:
			velocity = velocity.bounce(collisionInfo.get_normal())
		
		velocity *= bounce_speed_scale
		velocity = velocity.limit_length(MAX_SPEED)

