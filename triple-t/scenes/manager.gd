extends Node
@onready var gameover: Panel = %Gameover
@onready var point: Label = %point
@export var hearts: Array[Node]

var points = 0

func _ready() -> void:
	get_tree().paused = false
	update_hearts()

func decrese_health() -> void:
	Global.lives -= 1
	print(Global.lives)
	update_hearts()
	if Global.lives <= 0:
		Global.lives = 3
		get_tree().paused = true
		%Gameover.show() 
		%Gameover.get_node("sad").play()
		 

func update_hearts() -> void:
	for h in range(3):
		if h < Global.lives:
			hearts[h].show()
		else:
			hearts[h].hide()

func add_point() -> void:
	points += 1
	print(points)
	point.text = "Points: " + str(points)
