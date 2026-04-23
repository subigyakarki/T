extends Area2D

@onready var manager: Node = %manager

@onready var coin_sound: AudioStreamPlayer2D = $coin

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		coin_sound.play()
		await coin_sound.finished 
		manager.add_point()
		queue_free()
