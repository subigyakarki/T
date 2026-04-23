extends Node

@onready var pause_panel: Panel = %pausePanel

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS  # ✅ keeps running even when paused

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		pause_panel.show()

func _on_resume_pressed() -> void:
	pause_panel.hide()
	get_tree().paused = false

func _on_go_back_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn") 
