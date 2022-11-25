extends KinematicBody2D


var MouseLine: Line2D
var PlayerSprite: Sprite
var Crosshair: Sprite
var Player: Area2D
var BulletSprite: Resource
var BulletScript: Resource
var EnemySprite: Resource
var EnemyScript: Resource
var directional_input = Vector2.ZERO

const speed = 200


func _ready():
	MouseLine = get_node("MouseLine")
	PlayerSprite = get_node("PlayerSprite")
	Crosshair = get_node("Crosshair")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	BulletSprite = load("res://assets/bullet.png")
	BulletScript = load("res://scripts/bullet.gd")
	EnemySprite = load("res://assets/evil_turkey.png")
	EnemyScript = load("res://scripts/enemy.gd")

func _process(delta):
	MouseLine.set_point_position(1, MouseLine.get_local_mouse_position())
	PlayerSprite.rotate(PlayerSprite.get_local_mouse_position().angle())
	Crosshair.position = Crosshair.get_global_mouse_position()
	if(Input.is_action_pressed("ui_select")):
		create_bullet()
		create_enemy()
	
	# Block for movement	
	directional_input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	directional_input.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	move_and_slide(directional_input * speed)

func _on_Control_resized():
	get_node(".").rect_size = get_node(".").get_viewport().size
	print(get_node(".").get_viewport().size)

func create_bullet():
	var bullet: KinematicBody2D = KinematicBody2D.new()
	var sprite: Sprite = Sprite.new()
	sprite.texture = BulletSprite
	bullet.add_child(sprite)
	bullet.set_script(BulletScript)
	add_child(bullet)
	bullet.set_process(true)


func create_enemy():
	var enemy: KinematicBody2D = KinematicBody2D.new()
	var sprite: Sprite = Sprite.new()
	sprite.texture = EnemySprite
	enemy.add_child(sprite)
	enemy.set_script(EnemyScript)
	get_node(".").add_child(enemy)
	enemy.set_process(true)
	enemy.set_player(self)
