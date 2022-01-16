extends Node2D


func play_music_track(track):
	get_node(track).play()
	
func stop_music_track(track):
	get_node(track).stop()


func stop_all_audio(): 
	for n in self.get_children():
		n.stop()


func save_currently_playing_sounds():
	var sounds_playing = []
	for n in self.get_children():
		if n.playing == true:
			sounds_playing.append({"type": "sound", "sound": n.name})
		else:
			pass
			
	return sounds_playing
	
	
func _ready():			
	save_currently_playing_sounds()

func change_volume(value):
	for _i in self.get_children():
		_i.volume_db = value
	
	
func _on_SettingsMenu_music_volume_changed(value):
	change_volume(value)

