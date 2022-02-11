extends Node2D

var choice_picked = false
signal choice 
var choice_button = preload("res://Scenes/ChoiceButton.tscn")


func display_choices(choices):
	for i in choices:
		var new_choice_button = choice_button.instance()
		new_choice_button.set_choice_scene(i["choice_scene"])
		new_choice_button.button_text(i["choice_text"])
		$ScrollContainer/VBoxContainer.add_child(new_choice_button)
	
	
func _ready():
	#hide_choices()
	pass


func delete_children():
	for i in $ScrollContainer/VBoxContainer.get_children():
		i.queue_free()
	
#hides the choice buttons
func hide_choices():
	$ChoiceOne.hide()
	$ChoiceTwo.hide()

#shows the choice buttons
func show_choices():
	$ChoiceOne.show()
	$ChoiceTwo.show()

#set the text on the choice buttons
func button_choice_text(ChoiceOne, ChoiceTwo):
	show_choices()
	$ChoiceOne.text = ChoiceOne
	$ChoiceTwo.text = ChoiceTwo
	while choice_picked == false:
		yield(get_tree().create_timer(0.1), "timeout")
		

#this emits a signal that tells the interepter that choice one was picked
func _on_ChoiceOne_pressed():
	choice_picked == true
	hide_choices()
	emit_signal("choice", "choiceone")


#this emits a signal that tells the interepter that choice two was picked
func _on_ChoiceTwo_pressed():
	choice_picked == true
	hide_choices()
	emit_signal("choice", "choicetwo")

