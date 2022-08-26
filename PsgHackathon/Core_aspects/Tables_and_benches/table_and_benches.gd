extends Node

var current_scene
var previous_scene

var total_dev_benches=[]
var current_dev_employees=[]

var total_marketing_benches=[]
var current_marketing_employees=[]

var total_testing_benches=[]
var current_testing_employees=[]

var save_json_path="res://Core_aspects/Save_jsons/"
var total_dev_employees_hired=0

signal scene_changed()

var save_files={
	"Board":[],
	"Hr":[],
	"Marketing":[],
	"Development":[],
	"Testing":[]
}

func _ready():
	connect("scene_changed",self,"on_scene_changing")

func determine_hiring_count(array):
	return array.count(0)


func generate_id():
	var id=1
	for i in range(len(current_dev_employees)):
		if current_dev_employees[i]==0:
			id=i+1
			current_dev_employees[id]=1
			break
	return id

func on_scene_changing(previous,current):
	load_settings(current)

func update_settings(previous):
	var entities=previous_scene.get_node("Entities")
	if entities:
		pass

func load_settings(current):
	if save_files[current].empty():
		return

func update_dev_employees():
	total_dev_benches+=1


func employee_dev_hash(id):
	return current_dev_employees[id-1]
