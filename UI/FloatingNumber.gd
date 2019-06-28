extends Node2D

var phase = randf()*PI*2
var solid_time = 1.0

func _ready():
	scale = Vector2(0.3, 0.3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale.x += delta * 0.3
	scale.y = scale.x
	phase += delta
	position.y -= delta * 32
	position.x += sin(phase) * 0.5
	solid_time -= delta
	if solid_time <= 0:
		modulate.a = max(0, modulate.a - 0.015)
		if modulate.a == 0:
			queue_free()
