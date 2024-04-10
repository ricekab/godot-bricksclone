extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#@export var vel:Vector2 = Vector2(0, 0)
@export var bounce_speed_scale = 1.0  # Vel increase on each bounce.
@export var max_speed = 450.0


func _physics_process(delta: float):
	var collisionInfo: KinematicCollision2D = move_and_collide(velocity * delta)
	if not collisionInfo:
		return
	var collider = collisionInfo.get_collider()
	# Determine bounce type, default to bouncing on the normal vector
	var bounce_type: G_Const.BounceType = G_Const.BounceType.NORMAL
	if "bounce_type" in collider:
		print("NO BOUNCE TYPE FOUND IN COLLIDER, using default (normal)")
		bounce_type = collider.bounce_type
	match bounce_type:
		G_Const.BounceType.DIRECT:
			var towards = self.position
			var from = collisionInfo.get_collider().position
			var direction_vector: Vector2 = towards - from
			direction_vector = direction_vector.normalized()
			velocity = direction_vector * velocity.length()
		G_Const.BounceType.NORMAL:
			velocity = velocity.bounce(collisionInfo.get_normal())
		G_Const.BounceType.REFLECT:
			pass
	if "do_hit" in collider:
		collider.do_hit()
	# if collisionInfo.collider.name == "paddle_chbody":
	velocity *= bounce_speed_scale
	velocity = velocity.limit_length(max_speed)
