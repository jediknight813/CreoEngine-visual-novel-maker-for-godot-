extends Control

#signal save_game
signal load_game
signal delete
signal close_menu


var scene_index
var event_index
var game_data

func set_scene_index(index):
	scene_index = index

func set_event_index(index):
	event_index = index

func set_game_data(data):
	game_data = data
	
func save_text(text):
	$CenterContainer/SaveText.text = text

func _ready():
	self.connect("load_game", self.get_parent().get_parent().get_parent(), "load_game")
	self.connect("close_menu", self.get_parent().get_parent().get_parent(), "close_save_menu")
	self.connect("delete", self.get_parent().get_parent().get_parent(), "delete_save")
	
func _on_SaveButton_pressed():
	pass
	#emit_signal("save_game", scene_index, event_index)


func _on_LoadButton_pressed():
	emit_signal("load_game", scene_index, event_index, game_data)
	emit_signal("close_menu")



func _on_DeleteButton_pressed():
	emit_signal("delete", scene_index, event_index, game_data)
	self.queue_free()
