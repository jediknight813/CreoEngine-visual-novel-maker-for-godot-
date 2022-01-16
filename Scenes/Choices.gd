extends Node2D

var choice_picked = false
signal choice 

func _ready():
	hide_choices()


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

