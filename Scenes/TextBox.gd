extends Control

var dialog_index = 0


func change_dialog(dialog):
	$ContinueSprite.hide()
	
	if len(dialog) > 25:
		$Tween.playback_speed = 0.6
	if len(dialog) > 30:
		$Tween.playback_speed = 0.4
	if len(dialog) < 25:
		$Tween.playback_speed = 1
	
	$Text.bbcode_text = dialog
	$Text.percent_visible = 0
	$Tween.interpolate_property(
		$Text, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
	)
	$Tween.start()
	

func set_textbox_text(dialog):
	$Text.bbcode_text = dialog
	$ContinueSprite.hide()



func change_name(name):
	$CenterContainer/CharacterNameText.bbcode_text = name


func _on_Tween_tween_completed(object, key):
	$ContinueSprite.show()
