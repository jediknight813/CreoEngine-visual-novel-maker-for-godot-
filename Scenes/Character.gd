extends Node2D

export var influence = 0


func return_current_influence():
	return int(influence)


func add_remove_influence(amount): 
	influence += int(amount)


func load_image_from_file(path):
		var img = Image.new()
		img.load(path)
		var texture = ImageTexture.new()
		texture.create_from_image(img)
		return texture 
		
		
func _ready():
	if self.name == "PlayerCharacter":
		
		
		$CharacterSprite.frames = SpriteFrames.new()
		
		$CharacterSprite.frames.add_animation("happy")
		$CharacterSprite.frames.add_frame("happy", load_image_from_file("res://Characters/PlayerCharacter/happy.png"), 0)
		
		$CharacterSprite.frames.add_animation("idle")
		$CharacterSprite.frames.add_frame("idle", load_image_from_file("res://Characters/PlayerCharacter/idle.png"), 0)

		$CharacterSprite.frames.add_animation("angry")
		$CharacterSprite.frames.add_frame("angry", load_image_from_file("res://Characters/PlayerCharacter/angry.png"), 0)
		

#this will set the characters position on the screen
var current_position = "one"

func change_position(position):
	current_position = position
	
	if position == "one":
		$CharacterSprite.position = $CharacterPostionOne.position
	
	if position == "two":
		$CharacterSprite.position = $CharacterPostionTwo.position
	
	if position == "three":
		$CharacterSprite.position = $CharacterPostionThree.position
	
	if position == "four":
		$CharacterSprite.position = $CharacterPostionFour.position


#this shows the character

var character_visibility = false 

func show_character_sprite():
	character_visibility = true
	$CharacterSprite.show()

#this hides the character
func hide_character_sprite():
	character_visibility = false
	$CharacterSprite.hide()

#this will change the expression of the character
var current_expression = "happy"
func change_expression(expression):
	current_expression = expression
	$CharacterSprite.play(expression)
	
	
func save_character_data():
	return({"type": "character", "name": self.name, "position": self.current_position, "expression": current_expression, "character_visibility": self.character_visibility})





