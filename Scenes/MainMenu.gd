extends Node2D



func _on_StartGameButton_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")


func _on_SettingsButton_pressed():
	$SettingsMenu.open_settings_menu()
