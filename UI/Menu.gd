extends Control

var pause_time = 0

func _process(delta):
	if get_tree().paused:
		pause_time += delta
		if pause_time > 0.1:
			if Input.is_action_just_released("ui_cancel"):
				hide()
				get_tree().paused = false
				pause_time = 0

func _on_PlayButton_pressed():
	hide()
	get_tree().paused = false
	pause_time = 0

func _on_QuitButton_pressed():
	get_tree().quit()
