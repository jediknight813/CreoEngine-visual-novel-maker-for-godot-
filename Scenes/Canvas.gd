extends Node2D


func _process(delta):
	if Input.is_action_just_pressed("draw"):
		var pencil = preload("res://Scenes/Pencil.tscn").instance()
		pencil.default_color = Color(0, 0, 0) 
		add_child(pencil)
