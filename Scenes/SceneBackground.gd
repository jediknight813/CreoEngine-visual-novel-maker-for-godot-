extends Node2D

var current_background = "none"
func ChangeBackground(background):
	current_background = background
	$BackgroundSprite.play(background)


func return_current_background():
	return ({"type": "background", "background": current_background})
