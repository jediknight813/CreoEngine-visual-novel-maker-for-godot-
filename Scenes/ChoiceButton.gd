extends Button

var scene_name_to_change_to

func button_text(text):
	self.text = text
	
func set_choice_scene(scene_name):
	scene_name_to_change_to = scene_name


func _on_ChoiceButton_pressed():
	get_tree().get_root().get_node("Game").button_choice_change_scene(scene_name_to_change_to)
	get_parent().get_parent().get_parent().delete_children()
	
