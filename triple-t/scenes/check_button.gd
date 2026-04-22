extends CheckButton





func _on_toggled(toggled_on: bool) -> void:
	
	print("RUNNING")

	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	DisplayServer.window_set_position(Vector2i(0, 0))
	DisplayServer.window_set_size(DisplayServer.screen_get_size())
