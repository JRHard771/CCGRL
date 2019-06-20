extends Control

export var card_title = "" setget set_title
export var card_description = "" setget set_description
export(Texture) var card_image = load("res://icon.png") setget set_image
var hovered = false
onready var dest_scale = rect_scale

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	rect_scale = rect_scale.linear_interpolate(dest_scale, delta * 3)
	if hovered:
		if Input.get_mouse_button_mask():
			rect_position = rect_position.linear_interpolate(get_global_mouse_position(), delta * 10)

func set_title(value):
	$VBoxContainer/Title.bbcode_text = value

func set_description(value):
	$VBoxContainer/Description.bbcode_text = value

func set_image(value):
	$VBoxContainer/TextureRect.texture = load(value)

func _on_mouse_entered():
	hovered = true
	dest_scale *= 1.5
	var daddy = get_parent()
	daddy.remove_child(self)
	daddy.add_child(self)

func _on_mouse_exited():
	hovered = false
	dest_scale /= 1.5
