extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dest = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	dest = get_viewport().get_mouse_position()
	look_at(dest)
	dest = Vector2(100, 0).rotated(rotation)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	dest = Vector2(100, 0).rotated(rotation)
	move_and_slide(dest)
