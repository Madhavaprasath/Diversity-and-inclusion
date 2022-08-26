extends Node2D

signal decision_taken
var entity
func _ready():
	visible=false
	for i in get_tree().get_nodes_in_group("formbuttons"):
		i.connect("pressed",self,"on_pressed",[i.name])

func show_form(names,ethinicity,skill,blood_group,e):
	visible=true
	$TextureRect/Label.text="Names: "+names
	$TextureRect/Label2.text="Skill: "+skill
	$TextureRect/Label3.text="Ethinicity: "+ethinicity
	$TextureRect/Label4.text="Blood Group: " +blood_group
	entity=e
func on_pressed(names):
	emit_signal("decision_taken",names,entity)


