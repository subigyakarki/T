extends Control


@onready var main_buttons: VBoxContainer = $MainButtons
@onready var option: Panel = $Option
@onready var how_to_play: Panel = $"How to Play"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_buttons.visible = true
	option.visible = false
	how_to_play.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_howToPlay_pressed() -> void:
	main_buttons.visible = false
	how_to_play.visible = true
	


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
	



func _on_settings_pressed() -> void:
	main_buttons.visible = false
	option.visible = true


func _on_back_pressed() -> void:
	_ready()
