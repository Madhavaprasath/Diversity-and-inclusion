extends KinematicBody2D
class_name Entity

var entity_name
var skill
var gender
var id 
var race
var blood_group
var working_place
enum States{
	Entering,
	Working,
	Leaving
}

onready var navigation_agent=$NavigationAgent2D

"""office starts at 8 am and ends at 6pm 
	Checking entity urgency if urgent then use restroom or dont use
	if entity is in sufficent of energy we could make him or her to drink coffee
"""
var current_state=States.Working

var velocity=Vector2()

func _ready():
	pass
func _physics_process(delta):
	match current_state:
		States.Entering:
			pass
		States.Leaving:
			#move_towards(nearest_exit)
			pass
		States.Working:
			#working physics
			pass



func move_towards(target_position):
	$NavigationAgent2D.set_target_location(target_position)
	velocity=(global_position.direction_to($NavigationAgent2D.get_next_location()))*Vector2(100,100)
	$NavigationAgent2D.set_velocity(velocity)
	velocity=move_and_slide(velocity)
