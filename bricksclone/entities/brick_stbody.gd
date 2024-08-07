class_name Brick
extends StaticBody2D

@export var hitpoints: int = 1
@export var bounce_type: G_Const.BounceType = G_Const.BounceType.NORMAL
@export var brick_hit_type: BrickHitType = BrickHitType.Normal

enum BrickHitType {
	Normal,
	Indestructible
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func do_hit():
	match brick_hit_type:
		BrickHitType.Normal:
			self.hitpoints -= 1
			if self.hitpoints > 1:
				return
			# Brick is destroyed
			self.queue_free()
		BrickHitType.Indestructible:
			pass