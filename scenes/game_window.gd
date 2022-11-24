extends Node2D


var MouseTracker: Line2D
var PlayerSprite: Sprite
var Crosshair: Sprite
var Player: Area2D
var BulletSprite: Resource
var BulletScript: Resource
var EnemySprite: Resource
var EnemyScript: Resource


func _ready():
	MouseTracker = get_node("Player/Line2D")
	PlayerSprite = get_node("Player/PlayerSprite")
	Crosshair = get_node("Player/Crosshair")
	Player = get_node("Player")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	BulletSprite = load("res://assets/bullet.png")
	BulletScript = load("res://scripts/bullet.gd")


func _process(delta):
	MouseTracker.set_point_position(1, MouseTracker.get_local_mouse_position())
	PlayerSprite.rotate(PlayerSprite.get_local_mouse_position().angle())
	Crosshair.position = Crosshair.get_global_mouse_position()
	if(Input.is_action_pressed("ui_select")):
		create_bullet()


func _on_Control_resized():
	get_node(".").rect_size = get_node(".").get_viewport().size
	print(get_node(".").get_viewport().size)


func create_bullet():
	var bullet: KinematicBody2D = KinematicBody2D.new()
	var sprite: Sprite = Sprite.new()
	sprite.texture = BulletSprite
	bullet.add_child(sprite)
	bullet.set_script(BulletScript)
	get_node(".").add_child(bullet)
	bullet.set_process(true)


func spawn_enemy():
	var enemy: KinematicBody2D = KinematicBody2D.new()
	var sprite: Sprite = Sprite.new()
	sprite.texture = EnemySprite
	enemy.add_child(sprite)
	enemy.set_script(EnemyScript)
	get_node(".").add_child(enemy)
	enemy.set_process(true)
