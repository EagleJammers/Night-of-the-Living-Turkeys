extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dest = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	look_at(self.get_local_mouse_position())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dest = Vector2(100, 0).rotated(rotation)
	move_and_slide(dest)
