extends Area2D


func _ready() -> void:
	print("Finish node ready!")

	
func _on_body_entered(body: Node2D) -> void:
	print("Body entered: ", body.name)
	if body.name == "player":
		get_tree().change_scene_to_file("res://scenes/Completed.tscn")
