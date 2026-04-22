extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -600.0

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if direction == 0:       
		anim.play("idle")
	else:
		anim.play("run")
	if direction < 0:
		anim.flip_h = true
	elif  direction > 0:
		anim.flip_h = false
		

	
		
		
	
