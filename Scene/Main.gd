extends Node2D

var Card = preload("res://UI/Card.tscn")
var FloatingNumber = preload("res://UI/FloatingNumber.tscn")
onready var hand = $CardDisplay

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(5):
		var new_card = Card.instance()
		hand.add_card(new_card)

func _process(delta):
	if Input.is_action_just_released("ui_cancel"):
		get_tree().paused = true
		$Menu/Control.show()
	if Input.is_action_just_released("ui_accept"):
		var num = FloatingNumber.instance()
		get_tree().root.add_child(num)
		num.position = get_global_mouse_position()
		num.get_node("Label").text = str(randi()%200)
