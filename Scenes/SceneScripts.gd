extends Node2D


#this is what an example scene looks like
#var start_scene = [{"background":"trainbeach","event_id":0},{"character":"Diva","place":"one","expression":"idle","event_id":1},{"background":"sittingroom","event_id":1},{"dialog":"hello dev","name":"Diva","expression":"happy","event_id":2},{"dialog":"seeing how the dialog works?","name":"Diva","expression":"happy","event_id":3},{"dialog":"it could be better, but lets test a few things.","name":"Diva","expression":"happy","event_id":4},{"choice":"keep testing","choicetwo":"stop testing","actionone":"influence_fail_scene","actiontwo":"influence_pass_scene","event_id":5}]
#var influence_pass_scene = [{"background":"sittingroom","event_id":0},{"character":"Diva","place":"one","expression":"idle","event_id":1},{"dialog":"well, this is new, looks nice.","name":"Diva","expression":"happy","event_id":2},{"dialog":"we should do something later","name":"Diva","expression":"happy","event_id":3}]
#var influence_fail_scene = [{"background":"sittingroom","event_id":0}, {"character":"Diva","place":"three","expression":"idle","event_id":1}, {"dialog":"i'll see you later!","name":"Diva","expression":"happy","event_id":2}, {"dialog":"follow me!","name":"Diva","expression":"happy","event_id":3}]
#var all_Scenes = { "influence_pass_scene": influence_pass_scene, "influence_fail_scene": influence_fail_scene, "scene_one": start_scene}

var scene_one = [{"background":"sittingroom","action_id":"aj681082276d0j5c","type":"background_action_background","order_id":0},{"character":"Diva","position":"two","expression":"happy","action_id":"54aa67688fc7bia2","type":"character_action_show_character","order_id":1},{"dialog":"[wave amp=80 freq=5]testing out the dialog system i see[/wave]","character_sprite":"Diva","name":"[color=#fa6149]Godete[/color]","expression":"happy","action_id":"b7gahc0g8ajjab75","type":"dialog","order_id":2},{"dialog":"lets test out the choices","character_sprite":"Diva","name":"Diva","expression":"happy","action_id":"ehg01213ha3686ij","type":"dialog","order_id":3},{"choices":[{"choice_text":"choice 1","choice_scene":"scene_one"},{"choice_text":"choice 2","choice_scene":"scene_one"},{"choice_text":"choice 3","choice_scene":"scene_one"}],"choice_id":121421,"action_id":"9g6f8e4h5ec4aa6f","type":"choice_action_choice","order_id":4}]
var scene_two = []
var ending = []


func return_scene_info(index):
	return self.get(index)



# how to add choices to the scene {"choice": "use creo engine", "choicetwo" : " don't use creo engine", "actionone": 0, "actiontwo": 0, "event_id" : 5}
# how to add dialog to the scene {"dialog": "hello there!" ,"name":"diva","event_id":2},
# how to change background {"background":"trainbeach","event_id":1}
# how to add a character to the scene {"character":"diva","place":"one","expression":"idle","event_id":0}
