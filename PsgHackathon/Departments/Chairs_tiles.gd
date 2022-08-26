extends TileMap

var scene_dict={
	1:preload("res://Objects/Chair.tscn")
}
var d={}
var chairs_available=[]
var interview_form=preload("res://Objects/Interview_form.tscn")
onready var chairs=$"../Chairs"
var entered=false

func _ready():
	for i in get_tree().get_nodes_in_group("form"):
		i.connect("decision_taken",self,"on_decision_taken")
	yield(get_tree(),"idle_frame")
	replace_tiles_with_scene(scene_dict)
	get_parent().check_positions()
	if d.empty():
		for i in range(chairs.get_child_count()):
			chairs_available.append(0)
	var total_numbers_to_hire=max(1,randi()%chairs.get_child_count())
	for i in range(total_numbers_to_hire):
		if chairs_available[i]==0:
			var required_chair=chair_hashing(i)
			var entity_scene=load("res://Interview_participant/Interview_participant.tscn").instance()
			entity_scene.position=required_chair.get_node("Position2D").position
			var temp=EntityDetailsGenerator.spwan_entity_details()
			entity_scene.entity_name=temp['name']
			entity_scene.gender=temp['gender']
			entity_scene.skill="Development"
			entity_scene.blood_group=temp['blood_group']
			entity_scene.race=temp['ethnicity']
			required_chair.add_child(entity_scene)

	for i in get_tree().get_nodes_in_group("Interview"):
		i.connect("mouse_entered",self,"on_mouse_entering",[i])


func on_mouse_entering(entity):
		print("hi")
		get_parent().check_positions()
		$"../Interview_Form".global_position=get_global_mouse_position()
		$"../Interview_Form".show_form(entity.entity_name,entity.race,entity.skill,entity.blood_group,entity)
		


func replace_tiles_with_scene(scene_dict):
	for tiles in get_used_cells():
		var tile_id=get_cell(tiles.x,tiles.y)
		if scene_dict.has(tile_id):
			var object_scene=scene_dict[tile_id]
			replace_tiles_with_objects(tiles,object_scene)





func replace_tiles_with_objects(tile,object_scene):
	if get_cell(tile.x,tile.y)!=INVALID_CELL:
		set_cellv(tile,-1)
	
	var obj=object_scene.instance()
	var obj_pos=map_to_world(tile)+(cell_size/2)
	obj.global_position=obj_pos
	chairs.add_child(obj)

func on_decision_taken(decision,entity):
	if decision=="Hired" && get_parent().position_open[entity.skill]!=0:
		entity.id=TableAndBenches.generate_id()
		TableAndBenches.current_dev_employees[entity.id]=1
		get_parent().position_open[entity.skill]-=1
		EmployeeDatabase.append_employee_details(entity.skill,entity)
		$"../Interview_Form".visible=false
	elif decision=="Close":
		$"../Interview_Form".visible=false
	elif decision=="Reject":
		entity.queue_free()
		$"../Interview_Form".visible=false


func chair_hashing(pos):
	return chairs.get_children()[pos]
