extends Node2D

var Card = preload("res://Card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(7):
		var new_card = Card.instance()
		$CardDisplay.add_card(new_card)
