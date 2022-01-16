extends Control

#this contains a list of dictionaries that have a name and dialog
#ex {"name" : "john smith", "dialog" : "hello world"}
var dialog_list = []

var dialog_box = preload("res://Scenes/TextBox.tscn")


#this hides the dialog history menu
func hide_dialog_box():
	remove_loaded_dialog_boxes()
	dialog_list.invert()
	self.hide()
	self.set_process(false)

#this shows the dialog history menu
func show_dialog_box():
	dialog_list.invert()
	create_dialog_for_history()
	$ScrollContainer2.show()
	self.show()
	self.set_process(true)



func _ready():
	hide_dialog_box()

	
#this creates the previous dialog and puts them into a horizontal container
func create_dialog_for_history():
	for i in dialog_list:
		var character_name = i["name"]
		var dialog_text = i["dialog"]
		var new_dialog_box = dialog_box.instance()
		new_dialog_box.set_textbox_text(dialog_text)
		new_dialog_box.change_name(character_name)
		$ScrollContainer2/VScrollBar.add_child(new_dialog_box)

#this removes all the dialog boxes created from the create_dialog_for_history function
func remove_loaded_dialog_boxes():
	for n in $ScrollContainer2/VScrollBar.get_children():
		$ScrollContainer2/VScrollBar.remove_child(n)
		n.queue_free()

	

#this closes the dialog history menu
func _on_CloseButton_pressed():
	hide_dialog_box()


#this is where all the previous dialog is receved and stored
func _on_Game_dialog_history(name, dialog):
	dialog_list.append({"dialog": dialog, "name" : name})


#this opens the dialog history menu
func _on_MenuOptions_open_history():
	show_dialog_box()

