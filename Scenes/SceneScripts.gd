extends Node2D


#this is what an example scene looks like
#var start_scene = [{"background":"trainbeach","event_id":0},{"character":"Diva","place":"one","expression":"idle","event_id":1},{"background":"sittingroom","event_id":1},{"dialog":"hello dev","name":"Diva","expression":"happy","event_id":2},{"dialog":"seeing how the dialog works?","name":"Diva","expression":"happy","event_id":3},{"dialog":"it could be better, but lets test a few things.","name":"Diva","expression":"happy","event_id":4},{"choice":"keep testing","choicetwo":"stop testing","actionone":"influence_fail_scene","actiontwo":"influence_pass_scene","event_id":5}]
#var influence_pass_scene = [{"background":"sittingroom","event_id":0},{"character":"Diva","place":"one","expression":"idle","event_id":1},{"dialog":"well, this is new, looks nice.","name":"Diva","expression":"happy","event_id":2},{"dialog":"we should do something later","name":"Diva","expression":"happy","event_id":3}]
#var influence_fail_scene = [{"background":"sittingroom","event_id":0}, {"character":"Diva","place":"three","expression":"idle","event_id":1}, {"dialog":"i'll see you later!","name":"Diva","expression":"happy","event_id":2}, {"dialog":"follow me!","name":"Diva","expression":"happy","event_id":3}]
#var all_Scenes = { "influence_pass_scene": influence_pass_scene, "influence_fail_scene": influence_fail_scene, "scene_one": start_scene}


var scene_one = [{"character":"Diva","position":"three","expression":"happy","action_id":"4f6c951a1ihf53fj","type":"character_action_show_character","order_id":0},{"background":"sittingroom","action_id":"c48c75d1b7262848","type":"background_action_background","order_id":1},{"dialog":"hello there","character_sprite":"Diva","name":"[b]Diva[/b]","expression":"happy","action_id":"10h24ig6bh3c30a7","type":"dialog","order_id":2},{"dialog":"this is a test of the dialog system.","character_sprite":"Diva","name":"Diva","expression":"idle","action_id":"aig1cc82b92h7519","type":"dialog","order_id":3},{"play_audio":"BackgroundMusic","action_id":"h6eg1255djg7g5dd","type":"audio_action_play_audio","order_id":4},{"dialog":"Do you like the Song?","character_sprite":"Diva","name":"Diva ","expression":"happy","action_id":"hh2h65b9h29fjh8h","type":"dialog","order_id":5},{"choice_one_text":"no","choice_two_text":"yes","choice_one_scene":"like_the_song","choice_two_scene":"dont_like_the_song","action_id":"90h1g418i7hg1131","type":"choice_action_choice","order_id":6}]
var like_the_song = [{"dialog":"Really?","character_sprite":"Diva","name":"Dive","expression":"happy","action_id":"2f3dca9ac9ge1037","type":"dialog","order_id":0},{"dialog":"it hurts my ears","character_sprite":"PlayerCharacter","name":"Diva","expression":"happy","action_id":"38313gh2e1c96aaf","type":"dialog","order_id":1},{"influence_amount":"-10","character":"Diva","action_id":"a9fbb97859ef954b","type":"influence_action_add_or_remove_influence","order_id":2},{"dialog":"anyway we should go check out this new place i found, follow me!","character_sprite":"Diva","name":"Diva","expression":"happy","action_id":"ce8j226h410i43ig","type":"dialog","order_id":3}]
var dont_like_the_song = [{"dialog":"i know right!","character_sprite":"Diva","name":"Diva","expression":"happy","action_id":"je5hgib973ff2ea2","type":"dialog","order_id":0},{"stop_audio":"BackgroundMusic","action_id":"g54b6c472hcgjcgf","type":"audio_action_play_audio","play_audio":"SoundFx","order_id":1},{"influence_amount":"10","character":"Diva","action_id":"a52h9670cg4dj1c4","type":"influence_action_add_or_remove_influence","order_id":2},{"dialog":"anyway we should go check out this new place i found, follow me!","character_sprite":"Diva","name":"Diva","expression":"happy","action_id":"05d4ig7fj955h3d5","type":"dialog","order_id":3}]


func return_scene_info(index):
	return self.get(index)



# how to add choices to the scene {"choice": "use creo engine", "choicetwo" : " don't use creo engine", "actionone": 0, "actiontwo": 0, "event_id" : 5}
# how to add dialog to the scene {"dialog": "hello there!" ,"name":"diva","event_id":2},
# how to change background {"background":"trainbeach","event_id":1}
# how to add a character to the scene {"character":"diva","place":"one","expression":"idle","event_id":0}
