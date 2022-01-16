extends Control

signal savegame
signal loadgame

var save_game_info

var save = preload("res://Scenes/SaveLoad.tscn")

var save_list = []




func add_saves_to_container():
	var save_index = 0
	for i in save_list:
		save_index += 1
		var scene_index = i["scene_index"]
		var event_index = i["event_index"]
		var game_data_index = i["game_data"]
		var new_save = save.instance()
		
		new_save.set_scene_index(scene_index)
		new_save.set_event_index(event_index)
		new_save.set_game_data(save_list[0]['game_data'])
		
		new_save.save_text("Save " + str(save_index))
		$ScrollContainer/VBoxContainer.add_child(new_save)
		
		
func open_save_menu():
	self.show()
	self.set_process(true)
	add_saves_to_container()
	
func close_save_menu():
	self.hide()
	self.set_process(false)
	remove_loaded_saves()


func remove_loaded_saves():
	for n in $ScrollContainer/VBoxContainer.get_children():
		$ScrollContainer/VBoxContainer.remove_child(n)
		n.queue_free()


func _on_Game_savegamedata(scene_index, event_index):
	var game_data = []
	
	var background_node = get_parent().get_node("SceneBackground").return_current_background()
	game_data.append(background_node)
	
	
	var sounds = get_parent().get_node("GameMusic").save_currently_playing_sounds()
	for i in sounds:
		game_data.append(i)
	
	
	var character_node = get_parent().get_node("Characters")
	for n in character_node.get_children():
		game_data.append(n.save_character_data())
		
	save_list.append({"scene_index": scene_index, "event_index": event_index, "game_data": game_data})
	remove_loaded_saves()
	add_saves_to_container()

func _on_LoadButton_pressed():
	emit_signal("loadgame", save_game_info)


func delete_save(scene_index, event_index):
	var index = 0
	for i in save_list:
		if scene_index == i['scene_index']:
			if event_index == i['event_index']:
				save_list.remove(index)
		index += 1

func _on_CloseMenuButton_pressed():
	close_save_menu()

func load_game(scene_index, event_index, game_data):
	get_parent().get_node("GameMusic").stop_all_audio()
	emit_signal("loadgame", scene_index, event_index, game_data)

func _on_SaveGameButton_pressed():
	emit_signal("savegame")
