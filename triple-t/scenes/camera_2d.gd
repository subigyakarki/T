extends Camera2D

@export var player_path: NodePath
var player

var pan_speed = 500.0
var zoom_speed = 0.1
var min_zoom = 0.5
var max_zoom = 3.0

func _ready():
	player = get_node(player_path)


func _process(delta):
	# 🎮 Camera follows player
	if player:
		global_position = player.global_position

	# ⌨️ Manual camera movement (WASD)
	var input_dir = Vector2.ZERO

	if Input.is_key_pressed(KEY_A):
		input_dir.x -= 1
	if Input.is_key_pressed(KEY_D):
		input_dir.x += 1
	if Input.is_key_pressed(KEY_W):
		input_dir.y -= 1
	if Input.is_key_pressed(KEY_S):
		input_dir.y += 1

	if input_dir != Vector2.ZERO:
		input_dir = input_dir.normalized()
		global_position += input_dir * pan_speed * delta

	# 🔍 Zoom controls
	if Input.is_key_pressed(KEY_Q):
		_zoom(1)

	if Input.is_key_pressed(KEY_E):
		_zoom(-1)


func _zoom(direction):
	var zoom_factor = 1.0 - (zoom_speed * direction)
	zoom *= Vector2(zoom_factor, zoom_factor)

	zoom = zoom.clamp(
		Vector2(min_zoom, min_zoom),
		Vector2(max_zoom, max_zoom)
	)
