extends Node2D

signal savemenu
signal go_to_previous_event
signal skip_dialog
signal open_history
signal open_settings_menu

func _on_MenuButton_pressed():
	get_parent().get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_SaveButton_pressed():
	emit_signal("savemenu")


func _on_LoadButton_pressed():
	emit_signal("savemenu")


func _on_BackButton_button_up():
	emit_signal("go_to_previous_event")


func _on_SkipButton_pressed():
	emit_signal("skip_dialog")


func _on_HistoryButton_pressed():
	emit_signal("open_history")



func _on_SettingsButton_pressed():
	emit_signal("open_settings_menu")
