extends Node2D

signal music_volume_changed
signal sound_fx_volume_changed

func open_settings_menu():
	self.show()
	self.set_process(true)


func close_settings_menu():
	self.hide()
	self.set_process(false)


func _on_CloseSettingsMenuButton_pressed():
	close_settings_menu()


func _on_MusicVolumeSlider_value_changed(value):
	emit_signal("music_volume_changed", value)


func _on_SoundFxVolumeSlider_value_changed(value):
	emit_signal("sound_fx_volume_changed", value)
