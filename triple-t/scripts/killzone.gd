extends Area2D

@onready var timer: Timer = $Timer
var manager
var hit = false

func _ready() -> void:
	manager = get_tree().get_first_node_in_group("manager")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" and not hit:
		hit = true
		var fah = body.get_node("fah")
		if fah:
			fah.play()
		manager.decrese_health()
		timer.start()

func _on_timer_timeout() -> void:
	hit = false
	get_tree().reload_current_scene()
