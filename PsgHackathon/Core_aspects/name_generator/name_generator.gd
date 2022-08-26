extends Node

var name_dict={}

var races=["Indian","Hispanic","White","Black"]


func _ready():
	randomize()
	dir_contents("res://Jsons/")

func load_names(file_name):
	var path="res://Jsons/"+str(file_name)
	var key=file_name.split(".json")[0]
	var file=File.new()
	file.open(path,File.READ)
	var data=parse_json(file.get_as_text())
	name_dict[key]=data['names']

func dir_contents(path):
	var dir=Directory.new()
	if dir.open(path)==OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir():
				load_names(file_name)
			file_name = dir.get_next()


func generate_random_name(Race,Gender):
	randomize()
	var key=Race+'_'+Gender
	var random=randi()%len(name_dict[key])
	return name_dict[key][random]

