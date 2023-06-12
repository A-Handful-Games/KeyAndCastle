extends RefCounted
class_name PositionComponent
const COMPONENT_TYPE = "PositionComponent"

var data: Vector2

func _init(starting_position: Vector2 = Vector2.ZERO):
	data = starting_position

func _get(property):
	if property == "x":
		return data[0]
	if property == "y":
		return data[1]
	
