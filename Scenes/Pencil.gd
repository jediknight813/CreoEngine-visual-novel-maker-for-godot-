extends Line2D


func _process(delta):
	if Input.is_action_just_released("draw"):
		$Timer.stop()



func _on_Timer_timeout():
	add_point(get_parent().get_parent().get_parent().get_local_mouse_position())
	$Timer.start()

