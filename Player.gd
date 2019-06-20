extends Node2D

onready var dest_position = position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.linear_interpolate(dest_position, delta * 10)

func _input(event):
	if event.is_action_pressed("ui_up"):
		dest_position.y -= 32
	elif event.is_action_pressed("ui_down"):
		dest_position.y += 32
	elif event.is_action_pressed("ui_left"):
		dest_position.x -= 32
	elif event.is_action_pressed("ui_right"):
		dest_position.x += 32
