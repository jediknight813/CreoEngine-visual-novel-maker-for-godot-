extends Node2D

func _process(delta):
	self.position = get_global_mouse_position()
