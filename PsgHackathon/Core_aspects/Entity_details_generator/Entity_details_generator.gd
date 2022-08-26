extends Node

var races=["Black","Hispanics", "Indian","White"]
var gender=["male","female"]
var skills=["Development","Marketing","Testing"]
var blood_group=["A+",
"A-",
"B+",
"B-",
"O+",
"O-",
"AB+",
"AB-"]

func spwan_entity_details():
	randomize()
	var d={}
	d['ethnicity']=races[randi()%len(races)]
	d['gender']=gender[randi()%len(gender)]
	d['skills']=skills[randi()%len(skills)]
	d['name']=(NameGenerator.generate_random_name(d['ethnicity'],d['gender']))
	d['blood_group']=blood_group[randi()%len(blood_group)]
	return d
