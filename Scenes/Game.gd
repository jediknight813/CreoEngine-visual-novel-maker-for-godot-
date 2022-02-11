extends Node2D

var scene
var dialog_finished = "false"
var choice_picked = false
var picked_choice
var event_index
var scene_index
var skip_dialog = false


signal savegamedata

signal dialog_history


func _ready():
	get_current_scene("scene_one")
	use_scene(scene, event_index)


func get_current_scene(index):
	scene = $SceneScripts.return_scene_info(index)
	scene_index = index
	return scene



func use_scene(scene, event_index):
	#print(scene, event_index)
	
	Globals.event_id = 0
	event_index = Globals.event_id
	for i in scene:
		var current_event = i.keys()
		if i["order_id"] == event_index:
			Globals.event_id += 1
			event_index = Globals.event_id
			#print(event_index)
			
			if current_event[0] == "background":
				$SceneBackground.ChangeBackground(i['background'])
		
			if current_event[0] == "character":
				get_node("Characters/" + i['character']).show_character_sprite()
				get_node("Characters/" + i['character']).change_position(i['position'])
				get_node("Characters/" + i['character']).change_expression(i['expression'])
				

			if current_event[0] == "play_audio":
				$GameMusic.play_music_track(i['play_audio'])
			
			if current_event[0] == "hide_character":
				get_node("Characters/" + i['hide_character']).hide_character_sprite()
				
				
			if current_event[0] == "influence_amount":
				get_node("Characters/" + i['character']).add_remove_influence(i['influence_amount'])
			
			if current_event[0] == "influence_event_check":
				if get_node("Characters/" + i['character']).return_current_influence() >= int(i["influence_event_check"]):
					var b = get_current_scene(i['pass'])
					use_scene(b, event_index)
				else:
					var b = get_current_scene(i['fail'])
					use_scene(b, event_index)
					
					 
					
			if current_event[0] == "stop_audio":
				$GameMusic.stop_music_track(i['stop_audio'])
			
			if current_event[0] == "choices":
				skip_dialog = false
				$TextBox.hide()
				$MenuOptions.hide()
				
	
				$Choices.display_choices(i["choices"])
				#print(i["choices"])
				while choice_picked == false:
					yield(get_tree().create_timer(0.1), "timeout")
				choice_picked = false
				
				
			if current_event[0] == "dialog":
				dialog_finished = false
				get_node("Characters/" + i['character_sprite']).change_expression(i['expression'])
				$TextBox.change_dialog(i['dialog'])
				$TextBox.change_name(i['name'])
				emit_signal("dialog_history", i['name'], i['dialog'])
				yield(get_tree().create_timer(0.3), "timeout")
				while dialog_finished == false and skip_dialog == false:
					yield(get_tree().create_timer(0.1), "timeout")
			
			
func _on_Button_pressed():
	if choice_picked == false:
		dialog_finished = true


func button_choice_change_scene(scene_name):
	$TextBox.show()
	get_current_scene(scene_name)
	$MenuOptions.show()
	use_scene(scene, 0)


func _on_Choices_choice(choice):
	choice_picked = true
	picked_choice = choice


func _on_MenuOptions_savemenu():
	$SaveAndLoad.open_save_menu()


func _on_SaveAndLoad_savegame():
	emit_signal("savegamedata", scene_index, event_index)


func _on_SaveAndLoad_loadgame(scene_index, event_index, game_data):
	load_game(game_data)
	scene = $SceneScripts.return_scene_info(scene_index)
	use_scene(scene, event_index)



func load_game(game_data):
	for i in game_data:
		if i["type"] == "character":
			get_node("Characters/" + i['name']).change_position(i['position'])
			get_node("Characters/" + i['name']).change_expression(i['expression'])
			if i['character_visibility'] == true:
				get_node("Characters/" + i['name']).show_character_sprite()
			else:
				get_node("Characters/" + i['name']).hide_character_sprite()
		
		
		if i["type"] == "background":
			$SceneBackground.ChangeBackground(i['background'])
		
		if i["type"] == "sound":
			$GameMusic.play_music_track(i['sound'])


func _on_MenuOptions_go_to_previous_event():
	event_index = Globals.event_id
	if event_index > 1 and choice_picked == false:
		Globals.event_id -= 1
		event_index = Globals.event_id
		use_scene(scene, event_index)



func _on_MenuOptions_skip_dialog():
	skip_dialog = true


func _on_MenuOptions_open_settings_menu():
	$SettingsMenu.open_settings_menu()


#copys the game data to the clipboard
func _on_DevButtonForGameData_pressed():
	var data_to_copy = [{"names": [], "sounds": [], "backgrounds": [], "expressions": []}]
	var expressions_list = []
	
	for b in $Characters.get_children():
		data_to_copy[0]["names"].append(b.name)
		
	for c in $GameMusic.get_children():
		data_to_copy[0]["sounds"].append(c.name)
	
	for d in $SceneBackground.get_children():
		var backgrounds = d.frames.get_animation_names()
		data_to_copy[0]["backgrounds"] = backgrounds
	
	for e in $Characters.get_children():
		e = e.get_children()
		var expressions = e[0].frames.get_animation_names()
		for f in expressions:
			if expressions_list.has(f) == false:
				expressions_list.append(f)
		
		
	data_to_copy[0]["expressions"] = expressions_list
	var jstr = JSON.print(data_to_copy[0])
	OS.set_clipboard(jstr)





