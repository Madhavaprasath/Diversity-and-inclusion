extends Node

var employee_database={
	"Marketing":[],
	"Development":[],
	"Testing":[]
}





func append_employee_details(department,entity):
	employee_database[department].append([entity.id,entity.entity_name,entity.race,entity.blood_group])
	save_all()

func save_all():
	var file=File.new()
	file.open("res://Employee_database/emp.json",File.WRITE)
	file.store_string(to_json(employee_database))
	file.close()

func read_all():
	var file=File.new()
	file.open("res://Employee_database/emp.json",File.READ)
	var data=file.get_as_text(parse_json(file.get_as_text()))
