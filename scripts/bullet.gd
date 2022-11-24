extends KinematicBody2D

const speed = 100

func _ready():
	look_at(self.get_local_mouse_position())

func _process(delta):
	move_and_slide(Vector2(speed, 0).rotated(rotation))
