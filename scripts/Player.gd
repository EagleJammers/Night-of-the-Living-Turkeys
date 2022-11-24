extends KinematicBody2D


var MouseLine: Line2D
var PlayerSprite: Sprite
var Crosshair: Sprite
var Player: Area2D
var BulletSprite: Resource
var BulletScript: Resource


func _ready():
	MouseLine = get_node("MouseLine")
	PlayerSprite = get_node("PlayerSprite")
	Crosshair = get_node("Crosshair")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	BulletSprite = load("res://assets/bullet.png")
	BulletScript = load("res://scripts/bullet.gd")

func _process(delta):
	MouseLine.set_point_position(1, MouseLine.get_local_mouse_position())
	PlayerSprite.rotate(PlayerSprite.get_local_mouse_position().angle())
	Crosshair.position = Crosshair.get_global_mouse_position()
	if(Input.is_action_pressed("ui_select")):
		create_bullet()

func create_bullet():
	var bullet: KinematicBody2D = KinematicBody2D.new()
	var sprite: Sprite = Sprite.new()
	sprite.texture = BulletSprite
	bullet.add_child(sprite)
	bullet.set_script(BulletScript)
	add_child(bullet)
	bullet.set_process(true)
