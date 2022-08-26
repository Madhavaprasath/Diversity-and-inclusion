extends Node2D

var position_open={
	"Development":0,
	"Marketing":0,
	"Testing":0,
}



func check_positions():
	position_open={
		"Development":TableAndBenches.current_dev_employees.count(0),
		"Marketing":TableAndBenches.current_marketing_employees.count(0),
		"Testing":TableAndBenches.current_marketing_employees.count(0)
	}





func hire_character():
	pass
