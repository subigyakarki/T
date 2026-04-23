extends Panel

@onready var sad_music: AudioStreamPlayer2D = $sad

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	pass

func _on_tryagain_pressed() -> void:
	sad_music.stop()
	get_tree().paused = false
	Global.lives = 3
	get_tree().reload_current_scene()

func _on_exit_pressed() -> void:
	get_tree().quit()
