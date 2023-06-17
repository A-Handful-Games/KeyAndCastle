extends RefCounted
class_name GridPositionComponent

@export var data: Vector2i = Vector2i.ZERO

func _init(starting_position: Vector2i = Vector2i.ZERO):
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
	
