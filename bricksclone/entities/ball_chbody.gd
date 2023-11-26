extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var vel:Vector2 = Vector2(1, 1)
@export var bounce_speed_scale = 1.0  # Vel increase on each bounce.

const MAX_SPEED = 450.0

func _physics_process(delta: float):
	var collisionInfo = move_and_collide(vel * delta)
	if collisionInfo:
		if collisionInfo.collider.name == "paddle_p1" or \
			collisionInfo.collider.name == "paddle_p2":
			var towards = self.position
			var from = collisionInfo.collider.position
			var direction_vector: Vector2 =  towards - from
			direction_vector = direction_vector.normalized()
			vel = direction_vector * vel.length()
		else:
			vel = vel.bounce(collisionInfo.normal)
		vel *= bounce_speed_scale
		vel = vel.limit_length(MAX_SPEED)

