extends Control

var hovered = false
var saved_rotation = 0
onready var dest_scale = self.rect_scale
onready var dest_position = self.rect_position
onready var dest_rotation = self.rect_rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	rect_scale = rect_scale.linear_interpolate(dest_scale, delta * 10)
	rect_position = rect_position.linear_interpolate(dest_position, delta * 5)
	rect_rotation = lerp(rect_rotation, dest_rotation, delta * 10)

func _on_mouse_entered():
	hovered = true
	dest_scale *= 1.5
	dest_position.y -= 89
	saved_rotation = dest_rotation
	dest_rotation = 0
	var daddy = get_parent()
	daddy.remove_child(self)
	daddy.add_child(self)

func _on_mouse_exited():
	hovered = false
	dest_scale /= 1.5
	dest_position.y += 89
	dest_rotation = saved_rotation
