extends RefCounted
class_name RawPositionComponent

@export var data: Vector2 = Vector2.ZERO

func _init(starting_position: Vector2 = Vector2.ZERO):
	data = starting_position

func _get(property):
	if property == "x":
		return data[0]
	if property == "y":
		return data[1]


func _set(property, new_value):
	if property == "x":
		return data[0]
	if property == "y":
		return data[1]
	
