extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -400.0

@onready var anim = $AnimatedSprite2D

var can_move = true

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if can_move:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		if direction == 0:       
			anim.play("idle")
		else:
			anim.play("run")
		if direction < 0:
			anim.flip_h = true
		elif direction > 0:
			anim.flip_h = false

	move_and_slide()

func respawn(pos: Vector2) -> void:
	can_move = false
	velocity = Vector2.ZERO
	global_position = pos
	await get_tree().create_timer(0.2).timeout
	can_move = true

	
		
		
	
