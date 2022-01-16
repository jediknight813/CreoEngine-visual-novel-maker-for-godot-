extends Button

export var file_name = ""
var PlayerCharacter = "res://Characters/PlayerCharacter/"


func _on_SaveImage_pressed():
	var file = File.new()	
	var img = $ViewportContainer/Viewport.get_texture().get_data()
	img.convert(Image.FORMAT_RGBA8)
	img.save_png(PlayerCharacter + file_name)
	
