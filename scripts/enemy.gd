extends KinematicBody2D

const speed = 100
var player: KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player != null:
		look_at(player.position)
		move_and_slide(Vector2(speed, 0).rotated(rotation))
		


func set_player(p):
	player = p
	
