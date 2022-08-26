extends Node2D
class_name Parent_Room


onready var date_label=$"%Label"
onready var day_label=$"%Label2"
onready var time_label=$"%Label3"
onready var current_scene=get_node("Current_scene")
var prev_scene=''
var curr_scene=''

var scene_dictionary={}


func _ready():
	dir_contents('res://Departments/')
	date_label.text="Date: "+str(GlobalTime.date)
	day_label.text="Day: "+str(GlobalTime.current_day)
	time_label.text="Time: "+str(GlobalTime.time)
	for i in get_tree().get_nodes_in_group("Scene_button"):
		i.connect("pressed",self,"on_pressing_button",[i.name])
	
func change_Time():
	GlobalTime.change_time()


func _on_Timer_timeout():
	change_Time()
	date_label.text="Date: "+str(GlobalTime.date)
	day_label.text="Day: "+str(GlobalTime.current_day)
	time_label.text="Time: "+str(GlobalTime.time)
 

func dir_contents(path):
	var dir=Directory.new()
	if dir.open(path)==OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir():
				append_scene(file_name)
			file_name = dir.get_next()


func append_scene(file_name):
	var file="res://Departments/"+str(file_name)
	var key=file_name.split('.tscn')[0]
	scene_dictionary[key]=load(file)


func on_pressing_button(names):
	prev_scene=curr_scene if curr_scene!='' else ''
	curr_scene=names
	TableAndBenches.emit_signal("scene_changed",prev_scene,curr_scene)
	add_scene(names)


func add_scene(scene_name):
	if current_scene.get_child_count()!=0:
		TableAndBenches.previous_scene=current_scene.get_children()[0]
		TableAndBenches.update_settings(prev_scene)
		current_scene.get_children()[0].queue_free()
	var child =scene_dictionary[scene_name].instance()
	current_scene.position=Vector2()
	current_scene.add_child(child)
	TableAndBenches.current_scene=current_scene.get_children()[0]

